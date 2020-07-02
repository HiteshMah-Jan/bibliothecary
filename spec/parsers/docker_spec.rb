require 'spec_helper'

describe Bibliothecary::Parsers::Docker do
  it 'has a platform name' do
    expect(described_class.platform_name).to eq('docker')
  end

  it 'parses dependencies from docker-compose.yml', :vcr do
    expect(described_class.analyse_contents('docker-compose.yml', load_fixture('docker-compose.yml'))).to eq({
      :platform=>"docker",
      :path=>"docker-compose.yml",
      :dependencies=>[
        {:name=>"postgres", :requirement=>"9.6-alpine", :type=>"runtime"},
        {:name=>"redis", :requirement=>"4.0-alpine", :type=>"runtime"}
      ],
      kind: 'manifest',
      success: true
    })
  end

  it 'matches valid manifest filepaths' do
    expect(described_class.match?('docker-compose.yml')).to be_truthy
    expect(described_class.match?('docker-compose-dev.yml')).to be_truthy
    expect(described_class.match?('docker-compose.prod.yml')).to be_truthy
  end
end
