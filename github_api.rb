require 'http'

class GithubApi
  class Error < StandardError; end

  BASE_URL = 'https://api.github.com/'.freeze

  def name_available?(name)
    begin
      response = check_name(name)
    rescue HTTP::ConnectionError
      raise Error, 'Check your internet connection'
    end
    raise Error 'Something went wrong' if !response.code == 200

    parse_response(response)
  end

  private

  def parse_response(response)
    body = JSON.parse(response.body)
    body.key?('message')
  end

  def check_name(text)
    request('users/', text)
  end

  def request(path, params)
    HTTP.get("#{BASE_URL}#{path}#{params}")
  end
end
