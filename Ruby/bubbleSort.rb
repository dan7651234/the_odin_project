=begin
create method that sorts an array of integers using the bubble sort methodoloty.
iterate through array and compare two values. If the value on the right is less than the value on the left, swap the values.
=end

def bubble_sort(list)
  set = list.length - 1
  while set >= 0
    count = 0
    temp = 0
    while count < list.length - 1
      if list[count] > list[count + 1]
        temp = list[count]
        list[count] = list[count + 1]
        list[count + 1] = temp
      end
      count += 1
    end
    set = set - 1
  end
  return list
end

p bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(list, &block)
  set = list.length - 1
  while set >= 0
    count = 0
    temp = 0
    while count < list.length - 1
      if yield(list[count], list[count + 1]) > 0
        temp = list[count]
        list[count] = list[count + 1]
        list[count + 1] = temp
      end
      count += 1
    end
    set = set - 1
  end
  return list
end

p bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}
