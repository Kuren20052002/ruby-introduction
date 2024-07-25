require_relative "lib/BST"

tree = BST.new

array = Array.new(15) { rand(1..100) }
tree.build_tree(array)
puts tree
tree.delete(array[7])
puts tree
tree.level_order { |node| print "#{node.value} " }
puts ""
tree.inorder { |node| print "#{node.value} " }
puts ""
tree.preorder { |node| print "#{node.value} " }
puts ""
tree.postorder { |node| print "#{node.value} " }
puts ""

Array.new(5) { rand(100..300) }.each { |number| tree.insert(number) }
puts tree
puts tree.balanced?
tree.rebalance

puts tree
puts tree.balanced?
