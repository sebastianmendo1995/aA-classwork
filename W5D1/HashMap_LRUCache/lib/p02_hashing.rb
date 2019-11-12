class Integer
  # Integer#hash already implemented for you
end

class Array
  
  
  def hash
    arr = []
    self.flatten.each_with_index do |el, idx|
      arr << (el+idx)
    end
    arr.join("").to_i.hash
  end

end

class String
  def hash
    alphabet = ('a'..'z').to_a
    arr = []
    self.each_char { |char| arr << alphabet.index(char) }
    arr.join("").to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = []
    alphabet = ('a'..'z').to_a + (0..9).to_a.map!(&:to_s)
    self.each do |k,v|
      arr << alphabet.index(k.to_s) + alphabet.index(v.to_s)
    end
    arr.sort!
    return arr.join("").to_i.hash
    0
  end
end
