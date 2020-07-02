require 'yaml'

module Bibliothecary
  module Parsers
    class Docker
      include Bibliothecary::Analyser

      DOCKER_COMPOSE_REGEXP = /docker-compose[a-zA-Z0-9\-_\.]*\.yml$/

      def self.mapping
        {
          lambda { |p| DOCKER_COMPOSE_REGEXP.match(p) } => {
            kind: 'manifest',
            parser: :parse_docker_compose,
            can_have_lockfile: false
          }
        }
      end

      def self.parse_docker_compose(file_contents)
        manifest = YAML.load file_contents
        manifest['services'].map do |k, v|
          next if v['image'].nil?
          image = v['image'].split(':')
          {
            name: image[0],
            requirement: image[1] || 'latest',
            type: 'runtime'
          }
        end.compact
      end
    end
  end
end
