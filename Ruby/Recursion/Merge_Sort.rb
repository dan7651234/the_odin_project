def mergesort(start)
  if start.length <= 1
    return start
  else
    left, right = start.each_slice((start.size/2.0).round).to_a

    left = mergesort(left)
    right = mergesort(right)
  end
  return merge(left,right)
end

def merge(left,right)
  result = []
  while left.length > 0 && right.length > 0
    #puts left[0].to_s
    #puts right[0].to_s
    if left[0] <= right[0]
      result << left[0]
      left.shift
    else
      result << right[0]
      right.shift
    end
  end

  while left.length > 0
    result << left[0]
    left.shift
  end

  while right.length > 0
    result << right[0]
    right.shift
  end
  return result
end

puts mergesort([8,5,1,2,4,7,3,6]).to_s
random_length = 1 + rand(50)
i = 0
test_array = []
while i < random_length
  test_array << 1 + rand(50)
  i = i + 1
end
puts mergesort(test_array).to_s
