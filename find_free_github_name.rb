# frozen_string_literal: true

require_relative './parser.rb'
require_relative './name_generator.rb'
require_relative './github_api.rb'
class FindFreeGithubName
  def self.call(name, digits, options = {})
    defaults = { numeric: 'n' }
    parsed_name = Parser.parse_name(name)
    use_numbers = Parser.parse_options(defaults.merge(options))
    parse_digest = Parser.parse_digits(digits) if use_numbers
    generated_names = NameGenerator.new.call(parsed_name, use_numbers, parse_digest)

    generated_names.each do |n|
      retries = 1
      begin
        return n if GithubApi.new.name_available?(n)
      rescue GithubApi::Error => e
        puts e.message
        puts "try #{retries}"
        retries += 1
        if retries <= 3
          sleep(2**retries)
          retry
        end
      end
    end
    raise GithubApi::Error, "All names not avalible, try #{use_numbers ? 'another name' : 'to add numbers'}"
  end
end
