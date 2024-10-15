require_relative 'linked_list_set' # rubocop:disable Style/FrozenStringLiteralComment
require_relative 'hash_map'

# Class HashSet: Like HashSet but only keys.
class HashSet < HashMap
  attr_accessor :buckets
  attr_reader :load_factor

  def initialize(load_factor = 0.75) # rubocop:disable Lint/MissingSuper
    self.buckets = Array.new(16) { LinkedListSet.new }
    @load_factor = load_factor
  end

  def set(key)
    bucket = get_bucket(key)
    bucket.append(key) unless bucket.contains_key?(key)
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

# # TESTING:
# test = HashSet.new

# keys = %w[alfa bravo charlie delta echo foxtrot golf hotel india julia kilo]

# keys.each do |key|
#   test.set(key)
# end

# puts test.buckets
# puts test.buckets.length
# puts '-----------------'

# test.set('lima')
# test.set('mama')
# test.set('zulu')

# puts test.buckets
