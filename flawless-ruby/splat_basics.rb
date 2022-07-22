# Destructuring while assignment

a1 = [:first, :second, :third, :fourth]
a2 = [:before, a1, :after]
a3 = [:before, *a1, :after]

puts("a1: #{a1.inspect}")
puts("a2: #{a2.inspect}")
puts("a3: #{a3.inspect}")
puts("\n")

x, y, z = *a1
puts("x: #{x.inspect}")
puts("y: #{y.inspect}")
puts("z: #{z.inspect}")
puts("\n")


*x, y, z = *a1
puts("*x: #{x.inspect}")
puts("y: #{y.inspect}")
puts("z: #{z.inspect}")
puts("\n")

x, *y, z = *a1
puts("x: #{x.inspect}")
puts("*y: #{y.inspect}")
puts("z: #{z.inspect}")
puts("\n")
