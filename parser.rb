# frozen_string_literal: true

class Parser
  class ParseError < StandardError; end
  class << self
    def parse_name(name)
      raise ParseError, 'Tooooo short, motherfucker!' if name.nil? || name.empty?
      raise ParseError, 'very - very long!' if name.length > 50
      raise ParseError, 'Only firstname & lastame with one space' unless name.include? ' '

      name
    end

    def parse_options(options)
      case options[:numeric].upcase!
      when 'Y'
        true
      when 'N'
        false
      else
        raise ParseError, 'Only Y/N'
      end
    end
  end
end
