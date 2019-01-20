module SerialCrack::Backends
  class Range
    def initialize(options = {})
      ranges = options[:range]

      @combined = ranges.map(&:to_a).join
      @cur_index = 0

      # TODO?
      @min_length = 0
      @max_length = 0

      @current = [options[:start] || @combined[0]]
    end

    def current
      @current.reverse.join
    end

    def next!
      if @current.first == @combined[@combined.size - 1]
        @cur_index = 0

        carry = true
        @current.each do |char|
          break unless carry

          ind = @combined.index(char) + 1
          if ind >= @combined.size
            ind = 0
          else
            carry = false
          end

          char.replace(@combined[ind])
        end

        if carry
          @current << @combined[0]
        end
      else
        @current.first.replace(@combined[@cur_index += 1])
      end

      current
    end

    def done?
      false
    end
  end
end
