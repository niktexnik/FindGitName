# frozen_string_literal: true

class Parser
  class ParseError < StandardError; end

  def self.parse_name(name)
    raise ParseError, 'Tooooo short, motherfucker!' if name.nil? || name.empty?
    raise ParseError, 'very - very long!' if name.length > 50
    raise ParseError, 'Only firstname & lastame with one space' if !name.include? " "
    name
  end

  def self.parse_numeric(numeric)
    case numeric.upcase!
    when 'Y'
      true
    when 'N'
      false
    else
      raise ParseError, 'Only Y/N'
    end
  end
end
