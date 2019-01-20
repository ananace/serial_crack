require 'rubyserial'

module SerialCrack
  class Cracker
    attr_accessor :delay

    def initialize(target, options = {})
      @backend = if options[:wordlist]
                   Backends::Wordlist.new options
                 else
                   Backends::Range.new options
                 end

      @target = target
      @options = options
      @done = false

      if @options[:prompt].nil?
        conn.write "\n"
        conn.read(256)
        conn.write("\n") unless @options[:no_newline]
        response = conn.read(256)

        @options[:prompt] = response.split.reject(&:empty?).compact.last
        raise "No valid response on prompt estimation;\n#{response}" if @options[:prompt].nil?

        puts "Guessing prompt to be '#{@options[:prompt]}'"
      end
    end

    def total
      return :inf unless @backend.respond_to? :total
      @backend.total
    end

    def done?
      @done
    end

    def test!(password = current_password)
      return true if done?
      conn.write password + "\n"

      response = conn.read(256)
      @done = !response.include?(@options[:prompt])

      conn.write("\n") unless @options[:no_newline]
      conn.read(256)

      @done
    end

    def current_password
      @backend.current
    end

    def next_password!
      @backend.next!
    end

    private

    def conn
      @conn ||= Serial.new @target,
                           @options.fetch(:baud, 9600),
                           @options.fetch(:data, 8),
                           @options.fetch(:parity, :none),
                           @options.fetch(:stop, 1)
    end
  end
end
