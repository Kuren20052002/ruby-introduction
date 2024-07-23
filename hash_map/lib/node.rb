# Node class for linked list
class Node
  attr_accessor :next, :prev
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
    @prev = nil
  end

  def update(value)
    @value = value
  end

  def to_s
    return "( #{key} #{value} )" if @value

    "nah"
  end
end
