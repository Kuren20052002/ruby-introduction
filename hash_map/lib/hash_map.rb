require_relative "linked_list"

class HashMap
  def initialize
    @size = 16
    @load_factor = 0.8
    @buckets = LinkedList.new
  end

  def hash(key)
    key = key.to_s
    hash_code = 0
    pn = 179
    key.each_byte { |char_num| hash_code = (hash_code * pn) + char_num }

    hash_code % @size
  end
end
