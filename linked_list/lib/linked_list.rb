require_relative "node"

# Linked list?
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    @size += 1
    if @head
      @tail.next = Node.new(value)
      @tail = @tail.next
    else
      @head = Node.new(value)
      @tail = @head
    end
  end

  def prepend(value)
    @size += 1
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
