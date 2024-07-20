# Node class for linked list
class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value = nil)
    @value = value
    @next = nil
  end

  def to_s
    return "( #{value} )" if @value

    "nah"
  end
end
