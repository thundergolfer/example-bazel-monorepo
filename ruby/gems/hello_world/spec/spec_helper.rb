# frozen_string_literal: true

require 'rspec'

if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-formatter-badge'
  SimpleCov.formatter =
    SimpleCov::Formatter::MultiFormatter.new(
      [
        SimpleCov::Formatter::HTMLFormatter,
        SimpleCov::Formatter::BadgeFormatter,
      ]
    )

  SimpleCov.start do
    add_filter(/spec/)
  end
end

if ENV['DEBUG']
  puts "————————————————————————————"
  puts $LOAD_PATH.join("\n")
  puts Dir.pwd
  puts Dir.glob("**/*.rb").join("\n")
  puts "———————————————————————————"
end

require 'hello_world/cli'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before :all do
    Colored2.disable!
  end
end

at_exit do
  if ENV['CI'].nil? && ENV['COVERAGE']
    FileUtils.cp('coverage/coverage.svg', 'coverage.svg', verbose: ENV['VERBOSE']) if File.exist?('coverage/coverage.svg')
    FileUtils.rm_rf('tmp', verbose: ENV['VERBOSE']) if Dir.exist?('tmp')
    `git add coverage.svg`
  end
end
