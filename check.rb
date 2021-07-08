# frozen_string_literal: true

require 'http'
require 'json'
require 'uri'
class CheckUsername
  BASE_URL = 'https://api.github.com/'

  class << self
def check_name(text)
  request('users/', text)
end

    def parse_response(response)
      return 'Something went wrong' if !response.code == 200

      body = JSON.parse(response.body)
      error = []
      body.each do |key, value|
        error << value
      end
      if error.include? 'Not Found'
        print 'name avalible'
      else
        print 'poshel naxuy'
      end
    end

    def request(path, params)
      response = HTTP.get("#{BASE_URL}#{path}#{params}")
      parse_response(response)
    end
  end
end
