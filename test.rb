# frozen_string_literal: true

require_relative './check.rb'

puts 'Input your name:'
input = $stdin.gets.chomp
checktext = CheckUsername.check_name(input)
$stdout.puts "Result: #{checktext}"
