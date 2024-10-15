# NodeSet: Like Node but for Hash Set linked lists. # rubocop:disable Style/FrozenStringLiteralComment
# Class NodeSet: Like Node but only contains keys.
class NodeSet
  attr_accessor :key, :next_node

  def initialize(key, next_node = nil)
    self.key = key
    self.next_node = next_node
  end
end
