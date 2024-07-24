require_relative "Node"
require "pry-byebug"
class BST
  def initialize
    @root = Node.new
  end

  def build_tree(array = [], level = 0)
    return nil if array.empty?

    array.sort! if level.zero?
    @root = Node.new(array[array.size / 2])
    array.each { |number| insert(number) }
    @root
  end

  def insert(value)
    new_node = Node.new(value)
    parent = nil
    current = @root

    while current
      parent = current
      if value < current.value
        current = current.left
      elsif value > current.value
        current = current.right
      else
        return nil
      end
    end

    if new_node < parent
      parent.left = new_node
    else
      parent.right = new_node
    end

    current
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
