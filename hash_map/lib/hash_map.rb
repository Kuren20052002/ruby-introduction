require_relative "linked_list"

class HashMap
  def initialize
    @size = 16
    @load_factor = 0.8
    @buckets = LinkedList.new
  end

  def hash(key)
    key = key.to_s
    key = key[1..key.length] + key[0]
    hash_code = 0
    pn1 = 179
    pn2 = 103
    key.each_byte { |char_num| hash_code = (hash_code * pn1 % pn2) + (char_num * pn2 % pn1) }
    hash_code % @size
  end
end
