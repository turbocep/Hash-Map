require_relative 'linked_list.rb'

class HashMap
  attr_accessor :buckets
  attr_reader :load_factor

  def initialize(load_factor = 0.75)
    self.buckets = Array.new(16) { LinkedList.new }
    @load_factor = load_factor
  end
  
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    index = hash(key) % buckets.length
    bucket = buckets[index]
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
end

# mapp = HashMap.new
# %w[a b c d e f g h i j k l m n o p q].each_with_index do |key, value|
#   mapp.set(key, value)
# end

# puts mapp.buckets

