# frozen_string_literal: true

require_relative './name_generator.rb'
require_relative './parser.rb'
require_relative './check.rb'
require_relative './github_api.rb'
# class Main
loop do
  puts 'Input your First name and last name:'
  name = $stdin.gets.chomp
  puts 'Do you want numbers in your nickname? (Only Y/N)'
  numeric = $stdin.gets.chomp

  # ?? def call(name, numeric)
  begin
    parsed_name = Parser.parse_name(name)
    parsed_numeric = Parser.parse_numeric(numeric)
  rescue Parser::ParseError => e
    puts e.message
    redo
  end

  generated_names = NameGenerator.process(parsed_name, parsed_numeric)
  generated_names.each do |name|
    begin
      checked_name = CheckUsername.process(name)
    rescue CheckUsername::CheckNameError => e
      puts e.message
      next
    end
    puts "Your avalible name: #{checked_name}"
  end
  # end call
  exit
end
# end
# Main.new.call
