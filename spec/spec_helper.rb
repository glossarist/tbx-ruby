# frozen_string_literal: true

require "tbx"
require "rspec/matchers"
require "canon"
require "canon/rspec_matchers"

Bundler.require(:development)

Dir["./spec/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require "lutaml/model"
Lutaml::Model::Config.configure do |config|
  config.xml_adapter_type = :nokogiri
end

Canon::Config.configure do |config|
  config.xml.match.profile = :spec_friendly
  config.xml.match.options = { comments: :ignore }
  config.xml.diff.algorithm = :semantic
  config.xml.diff.max_node_count = 50_000
end
