module LightsOut
  class Game
    def self.valid_seed?(seed)
      return false unless seed =~ /^[0-9a-f]{12}$/i
      return false unless values_from_seed(seed).all? { |value| value < 64 }
      true
    end

    def self.random_seed
      6.times.with_object([]) do |_, out|
        out << format("%02x", (0...35).to_a.sample)
      end.join
    end

    def self.values_from_seed(seed)
      idx = 0
      values = []

      while idx < 12
        values << seed[idx, 2].to_i(16)
        idx += 2
      end

      values
    end

    attr_reader :moves

    def initialize(seed)
      unless Game.valid_seed? seed
        raise ArgumentError, "Invalid Seed"
      end
      @seed = seed
      @lights = Game.values_from_seed seed
      @moves = 0
    end

    def to_s
      to_seed
    end

    def each_with_index
      idx = 0

      @lights.each do |row|
        6.times do
          row, light = row.divmod 2
          yield (light == 1), idx
          idx += 1
        end
      end

      self
    end

    def initial_seed
      @seed
    end

    MOVE_FLIPS = { 0 => 3, 1 => 7, 2 => 14, 3 => 28, 4 => 56, 5 => 48 }

    def move!(index)
      raise IndexError, 'Move index out of bounds' unless (0...36).cover? index
      row, col = index.divmod 6
      indexes = []
      unless row == 0
        indexes << (row - 1) * 6 + col
        @lights[row - 1] ^= (2**col)
      end

      unless row == 5
        indexes << (row + 1) * 6 + col
        @lights[row + 1] ^= (2**col)
      end

      (-1..1).each do |dif|
        new_col = col + dif
        unless new_col < 0 || new_col > 5
          indexes << row * 6 + new_col
          @lights[row] ^= (2**new_col)
        end
      end
      @moves += 1

      indexes
    end

    def win?
      @lights.all?(&:zero?)
    end

    private

    def to_seed
      @lights.map { |row| format '%02x', row }.join
    end
  end
end
