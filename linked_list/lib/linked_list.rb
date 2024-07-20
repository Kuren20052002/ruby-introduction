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

  def prepend(value)
    if @head
      temp = Node.new(value)
      temp.next = @head
      @head = temp
    else
      @head = Node.new(value)
      @tail = @head
    end
  end

  def to_s
    temp = @head
    while temp
      print "( #{temp.value} ) -> "
      temp = temp.next
    end
    puts "nil"
  end
end
