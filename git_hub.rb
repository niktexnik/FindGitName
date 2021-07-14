# frozen_string_literal: true

require_relative './name_generator.rb'
require_relative './parser.rb'
require_relative './check_username.rb'
require_relative './github_api.rb'
class GitHub
  def self.call(name, numeric)
    parsed_name = Parser.parse_name(name)
    parsed_numeric = Parser.parse_numeric(numeric)

    generated_names = NameGenerator.process(parsed_name, parsed_numeric)
    generated_names.each do |name|
      begin
        checked_name = CheckUsername.process(name)
      rescue CheckUsername::CheckNameError => e
        puts e.message
        next
      end
      return name
    end
  end
end
