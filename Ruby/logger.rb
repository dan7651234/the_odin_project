def logger description, &outerBlock
  puts('Beginning ' + description + '...')
  logger.call 'Alrighty then' do outerBlock
  end
  puts('...' + description + ' has ended')
end

logger 'Outer Block' do puts('Just Checking')
end
