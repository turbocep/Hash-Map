class HashMap
  attr_accessor :buckets
  attr_reader :load_factor

  def initialize(load_factor = 0.75)
    self.buckets = Array.new(16, nil)
    @load_factor = load_factor
  end
  
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end
end

mapp = HashMap.new

p mapp.load_factor
p mapp.buckets