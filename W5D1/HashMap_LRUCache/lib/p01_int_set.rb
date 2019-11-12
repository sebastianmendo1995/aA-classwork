require 'byebug'
class MaxIntSet
  attr_accessor :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num < max && num >= 0
      store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    if !store[num]
      false
    else
      true
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end

  
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
   idx = num % num_buckets
   @store[idx] << num
  end

  def remove(num)
    idx = num % num_buckets
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % num_buckets
    if @store[idx].include?(num)
      true
    else
      false
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % num_buckets
    if !@store[idx].include?(num)
      @store[idx] << num
      @count += 1
    end
    if @count >= num_buckets
      resize!
    end

  end

  def remove(num)
    idx = num % num_buckets
    if @store[idx].include?(num)
      @store[idx].delete(num)
      @count -= 1
    end

  end

  def include?(num)
    idx = num % num_buckets
    return true if @store[idx].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    new_num_buckets = num_buckets
    empty_buckets = @store.flatten
    empty_buckets.each { |ele| remove(ele) }
    @count = 0

    new_num_buckets.times do
      @store << []
    end
    num_buckets
    

    empty_buckets.each { |ele| insert(ele) }
  end
end
