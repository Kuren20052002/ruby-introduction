require_relative "linked_list"
class HashMap
  attr_reader :entries_number, :size

  def initialize
    @size = 17
    @load_factor = 0.75
    @buckets = Array.new(@size) { LinkedList.new }
    @entries_number = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code % @size
  end

  def set(key, value)
    hash_code = hash(key)
    temp = @buckets[hash_code].find(key)
    @entries_number += 1 if @buckets[hash_code].empty?

    if temp
      temp.update(value)
    else
      @buckets[hash_code].append(key, value)
    end

    growth if @entries_number > @size * @load_factor
  end

  def growth
    @size = next_prime(@size)
    temp_buckets = @buckets.dup
    clear

    temp_buckets.each do |bucket|
      temp = bucket.head
      while temp
        set(temp.key, temp.value)
        temp = temp.next
      end
    end
  end

  def get(key)
    hash_code = hash(key)
    temp = @buckets[hash_code].find(key)
    return temp.value if temp

    nil
  end

  def has?(key)
    hash_code = hash(key)
    @buckets[hash_code].contain?(key)
  end

  def remove(key)
    @buckets[hash(key)].remove(key)
  end

  # Return the numbers of keys currently in the Hashmap
  def length
    @buckets.reduce(0) { |sum, list| sum + list.size }
  end

  def clear
    @entries_number = 0
    @buckets = Array.new(@size) { LinkedList.new }
  end

  # Return an array of all keys in Hashmap
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

  # Return an array of all values in Hashmap
  def values
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

  # Return a pair of key and value of all values in Hashmap
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

  def to_s
    @buckets.each_with_index do |bucket, idx|
      puts "Bucket #{idx}"
      puts bucket
    end
  end
end

# utility function for setting Hashmap size
def is_prime?(number)
  return false if number <= 1
  return true if number <= 3
  return false if number % 2 == 0 || number % 3 == 0 # rubocop:disable Style/EvenOdd,Style/NumericPredicate

  i = 5
  while i * i < number
    return false if (number % i).zero? || (number % (i + 2)).zero?

    i += 5
  end

  true
end

def next_prime(n)
  n = (n * 2) + 1

  loop do
    return n if is_prime?(n)

    n += 2
  end
end
