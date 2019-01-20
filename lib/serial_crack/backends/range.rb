module SerialCrack::Backends
  class Range
    attr_accessor :current

    def initialize(options = {})
      ranges = options[:range]

      @combined = ranges.map(&:to_a).join
      @cur_index = 0

      # TODO?
      @min_length = 0
      @max_length = 0

      @current = options[:start] || @combined[0]
    end

    def next!
      if current[current.size - 1] == @combined.last
        @cur_index = 0
        current += @combined[0]
      else
        current[current.size - 1] = @combined[@cur_index += 1]
      end

      current
    end

    def done?
      false
    end
  end
end
