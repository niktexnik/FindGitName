# frozen_string_literal: true

class NameVariantsGenerator
  def self.call(name, use_numbers)
    first_name, last_name = name.split
    digits = %w[1 2 3 4 5 6 7 8 9 0]
    result = []
    i = 0
    while i < name.length
      i += 1
      variant = first_name[0...i] + last_name[0...i]
      variant += digits.shuffle[i].to_s if use_numbers
      result << variant
    end
    result
  end
end
