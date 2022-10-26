# Basic usage for ensure is in the context of exceptional handling

puts("-------Ensure in exception handling-----------")
x = 1

begin
  #x += 1    # do something
   x += 'a'  # rescue
rescue => e
  # In case of error
  puts('I am rescue. I run in case of an error')
  puts(x)
ensure
  # Always run
  puts('I am ensure. I always run')
  puts(x+1)
end

puts("-------Ensure in methods-----------")

# Method returns always return control of the method iff ensure is not present in
# a method.
# If a method has ensure, it always run even if we return early from the method

# Not only can ensure run something after an early return but it can also be used to actually override a return value


def some_method
  i = 2
  return i #This will not return because ensure is present in the method

ensure
  i += 1
  return i
end

puts(some_method)
# Ensure in methods acts a lot like exceptional handling


puts("-----Same concept^ - Fluent builder interface/pattern ------")
# This pattern is useful for creating message chains
# Eg - object.do_something().do_some_thing_else().do_some_other_thing()

class Request
  def port(new_port)
    return unless new_port.is_a?(Integer)
    @port = new_port
  ensure
    return self
  end

  def host(new_host)
    @host = new_host
    self
  end

  def path(new_path)
    @path = new_path
    self
  end

  def inspect
    "GET #{@host}#{@port && ':'}#{@port}#{@path}"
  end
end

puts(Request.new.host('rubytapas.com').port(nil).path('/foo').inspect)


# Gotcha with `ensure with return self` is that it hides raised exceptions

def should_raise_exception
raise StandardError

ensure
  return "exception not raised"
end

puts(should_raise_exception)

