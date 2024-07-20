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
      temp = Node.new(value)
      temp.prev = @tail
      @tail.next = temp
      @tail = temp
    else
      @head = Node.new(value)
      @tail = @head
      @tail.prev = @head
      @head.next = @tail
    end
  end

  def prepend(value)
    @size += 1
    if @head
      temp = Node.new(value)
      temp.next = @head
      @head.prev = temp
      @head = temp
    else
      @head = Node.new(value)
      @tail = @head
      @tail.prev = @head
      @head.next = @tail
    end
  end

  def at(index)
    return nil if @size.zero?

    middle = (@size / 2) - 1
    if index > middle
      temp = @tail
      (@size - index - 1).times { temp = temp.prev }
    else
      temp = @head
      index.times { temp = temp.next }
    end
    temp
  end

  def to_s
    temp = @head
    while temp
      print "#{temp} -> "
      temp = temp.next
    end
    puts "nil"
  end
end
