def names
  yield 'Ruby'
  yield 'is'
  yield 'fun'
  yield 'strong'
  yield 'awesome'
ensure
  puts 'and fast'
end

result = names do |name|
  puts name
  break name if name =~ /^f/
end
puts("Last result: #{result}")

# Break can end a method's  execution early but it still runs  ensure blocks
# Break can force an early return from any method that yields. Not just loops
# Break can return with a value from a method
