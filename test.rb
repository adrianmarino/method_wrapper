require 'bundler/setup'
require 'method_wrapper'

class Bob
  def say_hello
    puts "Hello!"
  end
end

Bob.wrap_instance_method(pattern: /^say_hello$/, & ->(method, *args, &block) do
  puts "Before call #{method.name}"
  method.call(*args, &block)
  puts "After call #{method.name}"
end)

Bob.new.say_hello
