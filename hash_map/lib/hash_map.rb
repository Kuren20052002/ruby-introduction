require_relative "linked_list"
class HashMap
  def initialize
    @size = 16
    @load_factor = 0.8
    @buckets = Array.new(@size) { LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number1 = 31
    key.each_byte { |char_num| hash_code = (hash_code * prime_number1) + char_num }

    hash_code % @size
  end

  def set(key, value)
    hash_code = hash(key)
    temp = @buckets[hash_code].find(key)
    return @buckets[hash_code].append(key, value) unless temp

    temp.update(value)
  end

  def get(key)
    hash_code = hash(key)
    temp = @buckets[hash_code].find(key)
    return temp.value unless temp

    nil
  end

  def has?(key)
    hash_code = hash(key)
    @buckets[hash_code].contain?(key)
  end

  def remove(key)
    @buckets[hash(key)].remove(key)
  end

  def length
    @buckets.reduce(0) { |sum, list| sum + list.size }
  end

  def clear
    @buckets = Array.new(@size) { LinkedList.new }
  end

  def keys
    keys = []
    @buckets.each do |list|
      temp = list.head
      while temp
        keys << temp.key
        temp = temp.next
      end
    end
    keys
  end

  def value
    values = []
    @buckets.each do |list|
      temp = list.head
      while temp
        values << temp.value
        temp = temp.next
      end
    end
    values
  end

  def entries
    entries = []
    @buckets.each do |list|
      temp = list.head
      while temp
        entries << temp.pair
        temp = temp.next
      end
    end
    entries
  end
end
