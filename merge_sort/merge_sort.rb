def merge_sort(array, left, right)
  return array[left..right] if left >= right

  middle = left + (right - left) / 2
  left_a = merge_sort(array, left, middle)
  right_a = merge_sort(array, middle + 1, right)
  merge(left_a, right_a)
end

def merge(left_array, right_array)
  result = []
  l = r = 0
  while l < left_array.length && r < right_array.length
    if left_array[l] > right_array[r]
      result << right_array[r]
      r += 1
    else
      result << left_array[l]
      l += 1
    end
  end

  until l >= left_array.length
    result << left_array[l]
    l += 1
  end

  until r >= right_array.length
    result << right_array[r]
    r += 1
  end
  result
end

array = Array.new(100000000) {rand(1..100)}
start = Time.nows
merge_sort(array, 0 , array.length)
puts "Time it took to sort the array of #{array.length} number is #{Time.now - start}"
