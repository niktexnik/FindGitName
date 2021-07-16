# frozen_string_literal: true

require_relative './find_free_github_name.rb'

loop do
  puts 'Input your First name and last name:'
  name = $stdin.gets.chomp
  puts 'Do you want numbers in your nickname? (Only Y/N)'
  numeric = $stdin.gets.chomp
  begin
    checked_name = FindFreeGithubName.call(name, numeric: numeric)
  rescue Parser::ParseError, GithubApi::Error => e
    puts e.message
    redo
  end
  puts "Your avalible name: #{checked_name}"
  exit
end
