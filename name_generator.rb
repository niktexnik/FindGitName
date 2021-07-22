# frozen_string_literal: true

class NameGenerator
  def self.call(name, use_numbers, digits)
    first_name, last_name = name.split
    # numbers = [*(0..1000),*(1940..Date.today.year)]
    result = []
    1.upto([first_name.size, last_name.size].max) do |slice_size|
      first = first_name.slice(0...slice_size)
      last = last_name.slice(0...slice_size)
      if use_numbers
        result << [digits, last, first].join
        result << [last, digits, first].join
        result << [last, first, digits].join
      else
        result << [first, last].join
        result << [last, first].join
      end
    end
    puts result
    result
  end
end
