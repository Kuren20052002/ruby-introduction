require_relative "node"
# Linked list?
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(key, value)
    @size += 1
    if @head
      temp = Node.new(key, value)
      temp.prev = @tail
      @tail.next = temp
      @tail = temp
    else
      @head = Node.new(key, value)
      @tail = @head
    end
  end

  def pop
    @size -= 1
    if @head == @tail && @head
      @head = nil
      @tail = nil
    elsif @head != @tail
      @tail = @tail.prev
      @tail.next = nil
    end
    nil
  end

  def contain?(key)
    temp = @head
    while temp
      return true if temp.key == key

      temp = temp.next
    end
    false
  end

  def find(key)
    if @head
      temp = @head
      while temp
        return temp if temp.key == key

        temp = temp.next
      end
    end
    nil
  end

  def remove(key)
    return nil unless contain?(key)
    return pop if @head == @tail || (temp = find(key)) == @tail

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
