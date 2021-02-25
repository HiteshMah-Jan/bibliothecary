require 'json'

module Bibliothecary
  module Parsers
    class NPM
      include Bibliothecary::Analyser

      def self.mapping
        {
          match_filename("package.json") => {
            kind: 'manifest',
            parser: :parse_manifest
          },
          match_filename("npm-shrinkwrap.json") => {
            kind: 'lockfile',
            parser: :parse_shrinkwrap
          },
          match_filename("yarn.lock") => {
            kind: 'lockfile',
            parser: :parse_yarn_lock
          },
          match_filename("package-lock.json") => {
            kind: 'lockfile',
            parser: :parse_package_lock
          }
        }
      end

      def self.parse_shrinkwrap(file_contents)
        manifest = JSON.parse(file_contents)
        manifest.fetch('dependencies',[]).map do |name, requirement|
          {
            name: name,
            requirement: requirement["version"],
            type: 'runtime'
          }
        end
      end

      def self.parse_package_lock(file_contents)
        manifest = JSON.parse(file_contents)
        manifest.fetch('dependencies',[]).map do |name, requirement|
          if requirement.fetch("dev", false)
            type = 'development'
          else
            type = 'runtime'
          end
          {
            name: name,
            requirement: requirement["version"],
            type: type
          }
        end
      end

      def self.parse_manifest(file_contents)
        manifest = JSON.parse(file_contents)
        raise "appears to be a lockfile rather than manifest format" if manifest.key?('lockfileVersion')
        map_dependencies(manifest, 'dependencies', 'runtime') +
        map_dependencies(manifest, 'devDependencies', 'development')
      end

      def self.parse_yarn_lock(file_contents)
        # TODO support yarnlock file v2 (yaml)

        lines = file_contents.split("\n\n")[1..-1]

        deps = []

        lines.each do |line|
          sublines = line.gsub(/^\s/, '').split("\n")
          name = sublines[0]
          name = name.gsub!("\"", '') if name[0] == '"'
          if name[0] == '@'
            name = "@" + name.gsub("\n", '').split("@")[1]
          else
            name = name.split("@")[0]
          end

          version = sublines[1].gsub("version", '').gsub("\"", '').strip
          deps << { name: name, requirement: version, type: 'runtime' }
        end

        deps
      end
    end
  end
end
