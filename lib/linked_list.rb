require_relative 'node.rb'

class LinkedList
  attr_accessor :head

  def initialize(node = nil)
    self.head = node
  end

  def tail
    current = head
    loop do
      return current if current.next_node.nil?
      current = current.next_node
    end
  end

  def append(key, value)
    return self.head = Node.new(key, value) if head.nil?
    tail.next_node = Node.new(key, value)
  end

  def length
    current = head
    count = 0
    loop do
      return count if current.nil?
      count += 1
      current = current.next_node
    end
  end

  def contains_key?(key)
    current = head
    loop do
      return true if current.key == key
      return false if current.next_node.nil?
      current = current.next_node
    end
  end

  def replace(key, value)
    current = head
    loop do
      return current.value = value if current.key == key
      return false if current.next_node.nil?
      current = current.next_node
    end
  end

  def find(key)
    current = head
    loop do
      return current.value if current.key == key
      return nil if current.next_node == nil
      current = current.next_node
    end
  end

  def to_s
    string = ''
    current = head
    loop do
      return string << 'nil' if current.nil?
      string += " (#{current.key}: #{current.value}) -> "
      current = current.next_node
    end
  end

  def shift
    value = head.value
    self.head = head.next_node
    value
  end

  def remove(key)
    if head.key == key
      return shift()
    end
    current = head
    loop do
      return nil if current.next_node == nil
      if current.next_node.key == key
        value = current.next_node.value
        current.next_node = current.next_node.next_node
        return value
      end
      current = current.next_node
    end
  end
end

list = LinkedList.new
%w[a b c d e f].each_with_index do |element, index|
  list.append(element, index + 1)
end

puts list
puts list.remove('f')
puts list


