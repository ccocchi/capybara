module Capybara
  class Expectation
    def initialize(type, expected, actual)
      @type = type
      @expected = expected
      @actual = actual
    end
    
    def error_message_for(selector_name)
      case @type
      when :count
        "expected #{selector_name} to appears #{timify(@expected)} but appeared #{timify(@actual)}"
      else
        "expected #{selector_name} to return something"
      end
    end
    
    protected
    def timify(count)
      return "once" if count == 1
      return "twice" if count == 2
      "#{count} times"
    end
  end
end