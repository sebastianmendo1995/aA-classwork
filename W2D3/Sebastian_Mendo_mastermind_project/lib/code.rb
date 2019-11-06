class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs
  def self.valid_pegs?(arr)
    arr.all?{|ele|  POSSIBLE_PEGS.has_key?(ele.upcase) }
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:capitalize)
    else
      raise "Not valid pegs"
    end
  end

  def self.random(len) 
    possible = POSSIBLE_PEGS.keys 
    random = Code.new(Array.new(len, possible.sample))
  end

  def self.from_string(str)
    array = str.split("")
    Code.new(array)
  end


  def [](idx)
    @pegs[idx]
  end


  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    @pegs.each.with_index { |ele,idx| count += 1 if @pegs[idx] == guess[idx]}
    count
  end

  def num_near_matches(guess) 
    count = 0
    (0...guess.length).each do |i| 
      count += 1 if guess[i] != @pegs[i] && @pegs.include?(guess[i])
    end
    count
  end

  
  def ==(other_code)
    self.pegs == other_code.pegs
  end

  
end
