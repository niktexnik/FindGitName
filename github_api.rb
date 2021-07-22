# frozen_string_literal: true

require 'http'

class GithubApi
  class Error < StandardError; end

  BASE_URL = 'https://api.github.com/'

  def name_available?(name)
    begin
      response = check_name(name)
    rescue HTTP::ConnectionError
      raise Error, 'Check your internet connection'
    end
    parse_response(response)
  end

  private

  def parse_response(response)
    body = JSON.parse(response.body)
    body['message'] == 'Not Found' && response.code == 404
  end

  def check_name(text)
    request('users/', text)
  end

  def request(path, params)
    HTTP.get("#{BASE_URL}#{path}#{params}")
  end
end
