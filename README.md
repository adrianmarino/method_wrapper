# ruby-method-wrapper

Allow intercept method invocations. Useful for log, cache, etc...

## Usage

Step 1: Include in your Gemfile.
```ruby
gem 'ruby_method_wrapper'
```

Step 2: Write an example.

```ruby
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
```

Also is possible:

* Invoke private and protected methods.
* Invoke class methods.
* Replace method call with another implementation.
