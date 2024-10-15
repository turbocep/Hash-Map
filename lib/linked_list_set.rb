require_relative 'node_set' # rubocop:disable Style/FrozenStringLiteralComment
require_relative 'linked_list'

# Class LinkedListSet. Like LinkedList but for Hash Sets.
class LinkedListSet < LinkedList
  def append(key)
    return self.head = NodeSet.new(key) if head.nil?

    tail.next_node = NodeSet.new(key)
  end

  def replace(replaced, replacee)
    current = head
    loop do
      return current.key = replacee if current.key == replaced
      return false if current.next_node.nil?

      current = current.next_node
    end
  end

  def find
    puts "Don't use this method for a Hash Set."
  end

  def to_s
    string = ''
    current = head
    loop do
      return string << 'nil' if current.nil?

      string += " (#{current.key}) -> "
      current = current.next_node
    end
  end

  def shift
    key = head.key
    self.head = head.next_node
    key
  end

  def remove(key)
    return shift if head.key == key

    current = head
    loop do
      return nil if current.next_node.nil?

      if current.next_node.key == key
        current.next_node = current.next_node.next_node
        return key
      end
      current = current.next_node
    end
  end

  def keys
    current = head
    keys = []
    loop do
      return keys if current.nil?

      keys << current.key
      current = current.next_node
    end
  end

  def values
    puts "Don't use this method for a Hash Set."
  end

  def entries
    puts "Don't use this method for a Hash Set."
  end
end
