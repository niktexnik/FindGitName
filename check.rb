# frozen_string_literal: true

require 'http'
require 'json'
require 'uri'
class CheckUsername
  class CheckNameError < StandardError; end
  BASE_URL = 'https://api.github.com/'

  class << self
    def process(freename)
      response = GithubApi.check_name(freename)
      parse_response(response)

      freename
    end

    def parse_response(response)
      return 'Something went wrong' if !response.code == 200

      body = JSON.parse(response.body)

      unless body.key?("message")
        raise CheckNameError, "- name not avalible"
      end
    end
  end
end
