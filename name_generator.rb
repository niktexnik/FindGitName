# frozen_string_literal: true

class NameGenerator
  def self.process(name, numeric)
    
    firstname, lastname = name.split
    num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    freename = []
    uni = (firstname + lastname )
    i = 0
    while i < name.length
      i += 1
      freename << if numeric == true
                    firstname[0...i] + lastname[0...i] + "#{num.shuffle[i]}"
                  else
                    firstname[0...i] + lastname[0...i]
                  end
    end
    CheckUsername.nameloop(freename)
  end
end
