module SerialCrack::Backends
  class Wordlist
    attr_accessor :current

    def initialize(options = {})
      @list = File.readlines(options[:wordlist])
      @index = 0
      @current = options[:start] || @list[0]
    end

    def total
      @list.size
    end

    def next!
      return @current if done?

      @current = @list[@index += 1]
    end

    def done?
      @current = @list.last
    end
  end
end
