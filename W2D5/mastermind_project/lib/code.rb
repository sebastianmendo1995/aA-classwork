class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all?{ |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise "Invalid pegs"
    end
  end

  def self.random(len)
    random_pegs = []
    len.times do 
      random_pegs << POSSIBLE_PEGS.keys.sample
    end
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.upcase.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  #Phase 2

  def num_exact_matches(guess_obj)
    count = 0
    guess_obj.pegs.each_with_index do |peg, i|
      count += 1 if @pegs[i] == peg      
    end
    count
  end

  def num_near_matches(guess_obj)
    count = 0
    guess_obj.pegs.each_with_index do |peg, i|
      count += 1 if @pegs[i] != peg && @pegs.include?(peg)    
    end
    count
  end

  def ==(guess_obj)
    self.pegs == guess_obj.pegs
  end
end
