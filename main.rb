# frozen_string_literal: true

require_relative './name_generator.rb'
require_relative './parser.rb'
require_relative './check.rb'

loop do
  puts 'Input your First name and last name:'
  name = $stdin.gets.chomp
  puts 'Do you want numbers in your nickname? (Only Y/N)'
  numeric = $stdin.gets.chomp
  
  begin
    parsed_name = Parser.parse_name(name)
    parsed_numeric = Parser.parse_numeric(numeric)
  rescue Parser::ParseError => e
    $stdout.puts e.message
    redo
  end
  NameGenerator.process(parsed_name, parsed_numeric) 
  # $stdout.puts "Your avalible name: #{freename}"
  exit
end
