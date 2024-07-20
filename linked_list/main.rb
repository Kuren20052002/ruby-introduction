require_relative "lib/linked_list"

list = LinkedList.new
array = Array.new(10) { rand(0..100) }
array.each { |e| list.append(e) }
puts list
list.at(5)
