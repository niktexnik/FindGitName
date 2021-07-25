# frozen_string_literal: true

class NameGenerator
  def call(name, use_numbers, digits)
    first_name, last_name = name.split
    max_name_size = [first_name.size, last_name.size].max
    result = (1..max_name_size).each_with_object([]) do |slice_size, array|
      first = first_name.slice(0...slice_size)
      last = last_name.slice(0...slice_size)
      if use_numbers
        array << [last, first, digits].permutation.map(&:join)
      else
        array << [last, first].permutation.map(&:join)
      end
    end
    result.flatten
  end
end
