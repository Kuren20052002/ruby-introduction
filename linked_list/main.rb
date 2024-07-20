require_relative "lib/linked_list"

list = LinkedList.new
list.append(13)
list.append(22)
list.prepend(323)
list.append(333)
list.append(123)
puts list
