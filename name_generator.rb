# frozen_string_literal: true
class NameGenerator
  def self.process(name, numeric = false)
    firstname, lastname = name.split
    num = %w[1 2 3 4 5 6 7 8 9 0]
    freename = []
    i = 0
    while i < name.length
      i += 1
      allnames = firstname[0...i] + lastname[0...i]
      allnames += num.shuffle[i].to_s if numeric
      freename << allnames
    end
    freename
  end
end
