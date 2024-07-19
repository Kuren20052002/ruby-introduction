def merge_sort(array, left, right)
  return array[left..right] if left >= right

  middle = left + (right - left) / 2
  left_a = merge_sort(array, left, middle)
  right_a = merge_sort(array, middle + 1, right)
  merge(left_a, right_a)
end

def merge(left_array, right_array)
  result = []
  until left_array.empty? || right_array.empty?
    if left_array[0] > right_array[0]
      result << right_array.shift
    else
      result << left_array.shift
    end
  end
  result.concat(left_array).concat(right_array)
end
