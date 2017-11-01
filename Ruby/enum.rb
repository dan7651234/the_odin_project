module Enumerable

  #my_each should act the same as Each
  #it should work on arrays, ranges, and hashes
  #it should loop through the "list" it was called on and run the block that was passed to it
  def my_each(&block)
    #identify object type
    type = self.class
    #if the object is an array or range, simply run the block on each item
    if type == Array || type == Range
      for i in self
        yield i
      end
    #if the object is a hash both the key and the value need to be identified
    elsif type == Hash
      #obtain the keys
      keys = self.keys
      #obtain the value for each key
      for key in keys
        value = self[key]
        #run the block on the key-value pair
        yield(key,value)
      end
    end
    self
  end



  def my_each_with_index(&block)
    #returns input as enumerable if no block is provided as an arg.
    return self.to_enum unless block_given?
    #assigns input type to compare
    type = self.class
    #counter variable that moves through entire input list. Used like a while loop in this case.
    index = 0
    #for non-Hash lists, run the code block and increment the index only.
    if type == Array || type == Range
      for i in self
        yield(self[index], index)
        index += 1
      end
    #for Hashes run code block based on the list of key value pairs and increment the index.
    elsif type == Hash
      for key in self.keys
        yield(key, self[key], index)
        index += 1
      end
    end
    self
  end


  def my_select(&block)
    return self.to_enum unless block_given?
    type = self.class
    if type == Array || type == Range
      result = []
      for i in self
        if yield(i) == true
          result.push(i)
        end
      end
    else
      result = {}
      for key in self.keys
        if yield(key, self[key]) == true
          result[key] = self[key]
        end
      end
    end
    return result
  end

  def my_all?
    if block_given? == false
      for i in self
        if i == false
          return false
        end
      end
    elsif self.class == Array || self.class == Range
      for i in self
        if yield(i) == false
          return false
        end
      end
    else
      if self.class == Hash
        for key in self.keys
          if yield(key,self[key]) == false
            return false
          end
        end
      end
    end
    return true
  end

  def my_any?
    for i in self
      if yield(i) == true
        return true
      end
    end
    return false
  end

  def my_none?
    if block_given? == false
      for i in self
        if i == true
          return false
        end
      end
    else
      for i in self
        if yield(i) == true
          return false
        end
      end
    end
      return true
  end

  def my_count
    result = 0
    if block_given? == true
      for i in self
        if yield(i) == true
          count += 1
        end
      end
    elsif
      for i in self
        result += 1
      end
    end
    result
  end

  def my_map(&proc)
    return self.to_enum unless block_given?
    result = []
    for i in self
      result.push(yield(i))
    end
    result
  end

  def my_inject(memo = nil)
    memo ||= self[0]
    for i in self
      memo = yield(memo,i)
    end
    return memo
  end

  def multiply_els(list)
    result = 1
    list.my_inject(result) {|result,i| result*i}
    return result
  end

end

#Test cases for my_each method
test_arr = [1, "two", 3.0]
puts "my_each results (should return list of 3 mixed items):"
test_arr.my_each { |a| puts a }
print "\n"

#Test cases for my_each_with_index method
test_arr = [1, "two", 3.0]
puts "my_each_with_index results (should return numbered list of 3 mixed items):"
test_arr.my_each_with_index { |a, index| puts "#{index}. #{a}" }
print "\n"

#Test cases for my_select method
test_arr = ["albert", "bob", "cody", "aaron", "steve"]
puts "my_select resuts (should return [\"albert\"\, \"aaron\"]):"
print test_arr.my_select { |a| a.include?("a") }
print "\n\n"

#Test cases for my_all? method
test_arr_a = [2, 4, 6, 8]
test_arr_b = [2, 4, 5, 8]
puts "my_all? first test (should return true):"
puts test_arr_a.my_all? { |a| a % 2 == 0 }
puts "my_all? second test (should return false):"
puts test_arr_b.my_all? { |a| a % 2 == 0 }
print "\n"

#Test cases for my_any? method
test_arr_a = [2, 4, 6, 8]
test_arr_b = [1, 3, 5, 8]
test_arr_c = [1, 3, 5, 7]
puts "my_any? first test (should return true):"
puts test_arr_a.my_any? { |a| a % 2 == 0 }
puts "my_any? second test (should return true):"
puts test_arr_b.my_any? { |a| a % 2 == 0 }
puts "my_any? third test (should return false):"
puts test_arr_c.my_any? { |a| a % 2 == 0}
print "\n"

#Test cases for my_none? method
test_arr_a = [1, 3, 4, 7]
test_arr_b = [1, 3, 5, 7]
puts "my_none? first test (should return false):"
puts test_arr_a.my_none? { |a| a % 2 == 0 }
puts "my_none? second test (should return true):"
puts test_arr_b.my_none? { |a| a % 2 == 0 }
print "\n"

#Test case for my_count method
test_arr = ["Bob", 2, 3.0, 2]
puts "my_count results (should return 2):"
puts test_arr.count { |a| a == 2 }
print "\n"

#Test case for my_map method
test_arr = [1, 2, 3, 4]
puts "my_map results (should return [2, 4, 6, 8]:"
print test_arr.my_map { |a| a *= 2 }
print "\n\n"

#Test case for my_inject method
test_arr = [1, 2, 3, 4]
puts "my_inject first test (should return 10):"
puts test_arr.my_inject { |tot, a| tot + a }
#Method used for testing my my_inject

puts "my_inject second test (should return 24):"
puts multiply_els([1,2,3,4])
print "\n"
