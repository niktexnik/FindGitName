# frozen_string_literal: true

require_relative './name_generator.rb'
require_relative './parser.rb'
require_relative './check_username.rb'
require_relative './github_api.rb'
require_relative './git_hub.rb'
loop do
  puts 'Input your First name and last name:'
  name = $stdin.gets.chomp
  puts 'Do you want numbers in your nickname? (Only Y/N)'
  numeric = $stdin.gets.chomp
  begin
    checked_name = GitHub.call(name, numeric)
  rescue Parser::ParseError => e
    puts e.message
    redo
  end
    puts "Your avalible name: #{checked_name}"
  exit
end
