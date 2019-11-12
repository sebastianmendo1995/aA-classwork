class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
     idx = key.hash % num_buckets
    if !@store[idx].include?(key)
      @store[idx] << key
      @count += 1
    end
    if @count >= num_buckets
      resize!
    end
  end

  def include?(key)
    idx = key.hash % num_buckets
    @store[idx].include?(key)
  end

  def remove(key)
    if include?(key)
      idx = key.hash % num_buckets
      @store[idx].delete(key)
      @count -= 1
    end
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
