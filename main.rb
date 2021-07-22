# frozen_string_literal: true

require_relative './find_free_github_name.rb'

loop do
  puts 'Input your First name and last name:'
  name = $stdin.gets.chomp
  puts 'Do you want numbers in your nickname? (Only Y/N)'
  numeric = $stdin.gets.chomp
  if numeric == 'y'
  puts 'Input your number'
  digits = $stdin.gets.chomp
  end
  begin
    checked_name = FindFreeGithubName.call(name, digits, numeric: numeric)
  rescue Parser::ParseError, GithubApi::Error => e
    puts e.message
    redo
  end
  puts "Your avalible name: #{checked_name}"
  exit
end
