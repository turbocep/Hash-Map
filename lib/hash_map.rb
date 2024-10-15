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
    # Case - empty bucket:
    return bucket.append(key, value) if bucket.length == 0
    # Case - keys match on bucket:
    if bucket.contains_key?(key)
      bucket.replace(key, value)
    # Case - keys don't match but hashes do:
    else
      bucket.append(key, value)
    end
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

  def clear
    self.buckets = Array.new(16) { LinkedList.new }
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
end

mapp = HashMap.new
%w[a b c d e f g h i j k l m n o p q].each_with_index do |key, value|
  mapp.set(key, value)
end

puts mapp.buckets
p mapp.keys
p mapp.values
p mapp.entries


