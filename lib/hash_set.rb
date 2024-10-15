require_relative 'linked_list_set'
require_relative 'hash_map'

# Class HashSet: Like HashSet but only keys.
class HashSet < HashMap
  attr_accessor :buckets
  attr_reader :load_factor

  def initialize(load_factor = 0.75)
    self.buckets = Array.new(16) { LinkedListSet.new }
    @load_factor = load_factor
  end

  def set(key)
    bucket = get_bucket(key)
    if bucket.length.zero?
      bucket.key = key
    elsif !bucket.contains_key?
      bucket.append(key)
    end
    resize
  end

  def get
    puts "Don't use this method!"
  end

  # There must be a way better way to implement this:
  def has?(key)
    buckets.each do |bucket|
      return true if bucket.contains_key?(key)
    end
    false
  end

  def clear(new_size = 16)
    self.buckets = Array.new(new_size) { LinkedListSet.new }
  end

  def values
    puts "Don't use this method!"
  end

  def entries
    puts "Don't use this method!"
  end

  def resize
    return unless length > load_factor * buckets.length

    old_length = buckets.length
    pre_resized = keys
    self.buckets = clear(old_length * 2)

    pre_resized.each do |key|
      set(key)
    end
  end
end
