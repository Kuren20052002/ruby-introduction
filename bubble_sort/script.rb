def bubble_sort(array)
  size = array.length
  for i in 0...(size - 1)
    swapped = false
    for j in 0...(size - i - 1)
      if array[j] > array[j + 1]
        array[j], array[j + 1] = array[j + 1], array[j]
        swapped = true
      end
    end
    unless swapped
      return array
    end
  end
  array
end

puts bubble_sort([2,3,41,43,52,1,2])