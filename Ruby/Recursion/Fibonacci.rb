def fib(n)
  result = []
  i = 0
  while i < n
    if i <= 1
      result << 1
    else
      result.push(result[i-2].to_i + result[i-1].to_i)
    end
    i = i + 1
  end
  return result
end

def fibs_rec(result, n)
  if n == 1
    result << 1
    return result
  else
    fibs_rec(result,n-1)
    result.push(result[-1].to_i + result[-2].to_i)
  end
end


puts "iterative: " + fib(3).to_s
puts "iterative: " + fib(5).to_s
puts "iterative: " + fib(10).to_s

puts "recursive: " + fibs_rec([],3).to_s
puts "recursive: " + fibs_rec([],5).to_s
puts "recursive: " + fibs_rec([],10).to_s

puts "Enter how long you want your Fibonacci Sequence: "
n = gets.chomp
puts "iterative: " + fib(n.to_i).to_s
puts "recursive: " + fibs_rec([],n.to_i).to_s
