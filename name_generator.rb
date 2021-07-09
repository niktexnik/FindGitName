# frozen_string_literal: true

class NameGenerator
  NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0].freeze
  def self.process(name, numeric)
    firstname, lastname = name.split
    freename = []
    i = 0
    while i < name.length
      i += 1
      freename << (firstname[0...i] + lastname[0...i])
    end
    CheckUsername.obr(freename)
  end
end
