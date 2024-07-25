require_relative "Node"
require "pry-byebug"
class BST
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def build_tree(array, level = 0, left = 0, right = array.length - 1)
    return nil if left >= right

    array.sort! if level.zero?
    middle = (left + right) / 2
    insert(array[middle])
    build_tree(array, level + 1, left, middle)
    build_tree(array, level + 1, middle + 1, right)
  end

  def insert(value)
    new_node = Node.new(value)
    return @root = new_node unless @root.value

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

  def delete(value)
    current = @root
    parent = nil
    until current.value == value
      parent = current
      if value < current.value
        current = current.left
      elsif value > current.value
        current = current.right
      end
    end

    if current.left.nil? && current.right.nil?
      parent.left = nil if current < parent
      parent.right = nil if current > parent
    elsif current.left.nil? || current.right.nil?
      delete_one_child_node(parent, current)
    elsif current.left && current.right
      delete_two_child_node(parent, current)
    end
  end

  def delete_one_child_node(parent, current)
    if current < parent
      parent.left = current.right if current.right
      parent.left = current.left if current.left
    elsif current > parent
      parent.right = current.right if current.right
      parent.right = current.left if current.left
    end
  end

  def delete_two_child_node(parent, current)
    succ = current.right
    succ_parent = nil
    # find min node on the right of current
    while succ.left
      succ_parent = succ
      succ = succ.left
    end

    succ.right = current.right
    succ.left = current.left
    if current == @root
      @root = succ
    else
      parent.left = succ if current < parent
      parent.right = succ if current > parent
    end
    succ_parent.left = nil
  end

  def to_s(node = @root, prefix = "", is_left = true)
    to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def find(value)
    temp = @root
    while temp
      if value < temp.value
        temp = temp.left
      elsif value > temp.value
        temp = temp.right
      else
        break
      end
    end
    temp
  end

  def level_order
    queue = Queue.new
    queue.push(@root)
    until queue.empty?
      current = queue.pop
      yield(current)
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
    end
  end

  def inorder
    stack = []
    current = @root
    while !stack.empty? || current
      while current
        stack.push(current)
        current = current.left
      end
      current = stack.pop
      yield(current)
      current = current.right
    end
  end

  def preorder
    stack = []
    stack.push(@root)
    until stack.empty?
      current = stack.pop
      yield(current)
      stack.push(current.right) if current.right
      stack.push(current.left) if current.left
    end
  end

  def postorder(node = @root, &block)
    return nil if node.nil?

    postorder(node.left, &block)
    postorder(node.right, &block)
    yield(node)
  end

  def height(node = @root)
    return 0 unless node

    [1 + height(node.left), 1 + height(node.right)].max
  end

  def depth(node = @root)
    height - height(node)
  end

  def balanced?
    (height(@root.left) - height(@root.right)).abs < 1
  end

  def rebalance
    array = []
    inorder { |node| array << node.value }
    @root = Node.new
    build_tree(array)
  end
end
