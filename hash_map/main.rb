require_relative "lib/hash_map"

hash = HashMap.new

array = Array.new(10) { rand(1..100) }
array.each { |number| puts hash.hash(number) }
