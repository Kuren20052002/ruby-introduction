require_relative "node"
require "pry-byebug"
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
    end
  end

  def at(index)
    return nil if @size.zero?

    middle = (@size / 2)
    if index > middle
      temp = @tail
      (@size - index - 1).times { temp = temp.prev }
    else
      temp = @head
      index.times { temp = temp.next }
    end
    temp
  end

  def pop
    @size -= 1
    if @head == @tail && @head
      @head = nil
      @tail = nil
    elsif @head != @tail
      @tail = @tail.prev
      @tail.next = nil
    else
      puts "There is no node to pop!"
    end
  end

  def contain?(value)
    temp = @head
    while temp
      return true if temp.value == value

      temp = temp.next
    end
    false
  end

  def find(value)
    if @head
      temp = @head
      while temp
        return temp if temp.value == value

        temp = temp.next
      end
    end
    nil
  end

  def insert_at(index, value)
    @size += 1
    return append(value) unless @head

    temp = at(index)
    new_node = Node.new(value)
    new_node.prev = temp
    new_node.next = temp.next
    temp.next.prev = new_node
    temp.next = new_node
    new_node
  end

  def remove_at(index)
    unless @head
      puts "There is no Node to remove!"
      return nil
    end
    return pop if @head == @tail || (temp = at(index)) == @tail

    @size -= 1
    temp.prev.next = temp.next
    temp.next.prev = temp.prev
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
