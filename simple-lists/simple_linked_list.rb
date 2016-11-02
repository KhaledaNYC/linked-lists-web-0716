class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data)
  end

  def index_at(idx)
    cur_node = head
    idx.times do |i|
      return nil if !cur_node.next
      cur_node = cur_node.next
    end
    cur_node.data
  end

  def insert_at_index(idx,data)
    cur_node = self.head
    (idx - 1).times do |i|
      if cur_node.next.nil? && (idx != i)
        cur_node.next = Node.new(nil,nil)
      end
      cur_node = cur_node.next
    end
    if cur_node
      prev_next = cur_node.next
      cur_node.next = Node.new(data, prev_next)
    end
  end

  def unshift(data)
    cur_node = self.head
    self.head = Node.new(data)
    self.head.next = cur_node
  end

  def push(data)
    cur_node = self.head
    while cur_node.next
      cur_node = cur_node.next
    end
    cur_node.next = Node.new(data,nil)
  end

end
