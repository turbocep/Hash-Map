class Node
  attr_accessor :key, :value, :next_node

  def initialize(key, value, next_node = nil)
    self.key = key
    self.value = value
    self.next_node = next_node
  end
end