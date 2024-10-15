require_relative 'node.rb'

class LinkedList
  attr_accessor :head

  def initialize(node = nil)
    self.head = node
  end

  def append(key, value)
    current = head
    loop do
      return self.head = Node.new(key, value) if current.nil?
    end
  end
end

list = LinkedList.new

p list

list.append('hello', 'world')

p list