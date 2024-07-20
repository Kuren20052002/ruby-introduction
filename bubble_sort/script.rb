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


array = Array.new(100000000) {rand(1..10000000)}
start = Time.now
bubble_sort(array)
puts "Time it took to sort the array of #{array.length} number is #{Time.now - start}"
