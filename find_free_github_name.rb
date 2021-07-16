# frozen_string_literal: true

require_relative './parser.rb'
require_relative './name_variants_generator.rb'
require_relative './github_api.rb'
class FindFreeGithubName
  def self.call(name, options = {})
    defaults = { numeric: 'n' }
    parsed_name = Parser.parse_name(name)
    use_numbers = Parser.parse_options(defaults.merge(options))

    generated_names = NameVariantsGenerator.call(parsed_name, use_numbers)

    generated_names.each do |n|
      begin
        return n if GithubApi.new.name_available?(n)
      rescue GithubApi::Error => e
        puts e.message
        puts 'retrying...'
        retry
      end
    end
    raise GithubApi::Error, "All names not avalible, try #{use_numbers ? 'another name' : 'to add numbers'}"
  end
end
