require_relative "node"

# Linked list?
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head
      @tail.next = Node.new(value)
      @tail = @tail.next
    else
      @head = Node.new(value)
      @tail = @head
    end
  end
end
