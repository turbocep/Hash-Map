# NodeSet: Like Node but for Hash Set linked lists.
class NodeSet
  attr_accessor :key, :next_node

  def initialize(key, next_node = nil)
    self.key = key
    self.next_node = next_node
  end
end
