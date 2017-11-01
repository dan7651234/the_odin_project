def logger (description, &outerBlock)
  puts('Beginning ' + description + '...')
  value_returned = outerBlock.call
  puts('...' + description + ' has ended')
  puts('returned: ' + value_returned.to_s                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   )
end

testBlock1 = Proc.new do
  return 'Prima Nocte? First night!'
end

testBlock2 = Proc.new do
  return 'Hot shots part deux'
end

logger('Braveheart', testBlock1)
