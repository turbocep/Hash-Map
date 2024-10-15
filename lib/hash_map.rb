require_relative 'linked_list.rb'

class HashMap
  attr_accessor :buckets
  attr_reader :load_factor

  def initialize(load_factor = 0.75)
    # I could have made the following call #clear but that sacrifices LoB too 
    # much for my taste.
    self.buckets = Array.new(16) { LinkedList.new }
    @load_factor = load_factor
  end
  
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def get_index(key)
    hash(key) % buckets.length
  end

  def get_bucket(key)
    buckets[get_index(key)]
  end

  def set(key, value)
    bucket = get_bucket(key)
    if bucket.length == 0
      bucket.append(key, value)
    elsif bucket.contains_key?(key)
      bucket.replace(key, value)
    else
      bucket.append(key, value)
    end
    resize()
  end

  def get(key)
    get_bucket(key).find(key)
  end
  
  #There must be a way better way to implement this:
  def has?(key)
    return false if get(key).nil?
    true
  end

  def remove(key)
    get_bucket(key).remove(key)
  end

  def length
    total = 0
    buckets.each do |bucket|
      total += bucket.length
    end
    total
  end

  def clear(new_size = 16)
    self.buckets = Array.new(new_size) { LinkedList.new }
  end

  def keys
    keys = []
    buckets.filter do | bucket |
      keys.concat(bucket.keys)
    end
    keys
  end

  def values
    values = []
    buckets.filter do | bucket |
      values.concat(bucket.values)
    end
    values
  end

  def entries
    entries = []
    buckets.each do | bucket |
      entries.concat(bucket.entries)
    end
    entries
  end

  def resize
    if length() > load_factor * buckets.length
      old_length = buckets.length
      pre_resized = entries()
      self.buckets = clear(old_length * 2)

      pre_resized.each do | pair |
        key, value = *pair
        set(key, value)
      end
    end
  end
end

# TESTING
test = HashMap.new

keys = %w[apple banana carrot dog elephant frog grape hat].push('ice cream', 'jacket', 'kite', 'lion')
values = %w[red yellow orange brown gray green purple black white blue pink golden]

keys.each_with_index do |key, value|
  test.set(key, values[value])
end

test.set('moon', 'silver')
puts test.buckets

puts test.buckets
p test.keys
p test.values
p test.entries











