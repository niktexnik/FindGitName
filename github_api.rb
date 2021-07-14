# frozen_string_literal: true

require 'http'

class GithubApi
  BASE_URL = 'https://api.github.com/'
  class << self
    def check_name(text)
      request('users/', text)
    end

    def request(path, params)
      HTTP.get("#{BASE_URL}#{path}#{params}")
    end
  end
end