# Splat in method parameters

puts("\n##########\n")

def sum3(x, y, z)
  x + y + z
end

triangle = [90, 60, 30]
puts("sum3(*triangle): #{sum3(*triangle)}")

puts("\n##########\n")

def greet(greeting, *names)
  names.each do |name|
    puts("#{greeting}, #{name}")
  end
end
greet('Hey', 'Alice', 'Bob', 'Charlie')

puts("\n##########\n")

# Here's a method that draws a specific number of random numbers.
# And it does that a specified number of times
def random_draw(num_times, num_draws)
  num_times.times do
    draws = num_draws.times.map { rand(10) }
    yield(*draws)
  end
end

random_draw(5, 4) do |first, second, third, fourth|
  puts "#{first} #{second} #{third} #{fourth}"
end

puts("\n##########\n")

random_draw(5, 4) do |first, *rest|
  puts "#{first} #{rest.inspect}"
end

puts("\n##########\n")

random_draw(5, 4) do |first, *rest, last|
  puts "#{first} #{rest.inspect} #{last}"
end

puts("\n##########\n")

# Splat group

expr = [:*, 3, [:+, 2, 5, 6, 7, 8, 9, 10]]
op, f1, (inner_op, *ts) = expr
puts("#{op}:#{f1}:#{inner_op}:#{ts.inspect}}")

puts("\n##########\n")

# each_with_index example
menu = {
  'Pizza Bakery' => 'Rs 250',
  'Brick Oven'   => 'Rs 350',
  'Stoners'      => 'Rs 230'
}

menu.each_with_index do |(name, price), i|
  puts "#{i+1}: #{name} (#{price})"
end
