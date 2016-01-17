# method_wrapper

Allow intercept method invocations. Useful for log, cache, etc...

## Usage

Step 1:  Include in your Gemfile.
```ruby
gem 'method_wrapper', git: 'https://github.com/adrianmarino/method_wrapper.git', branch: 'master'
```

Step 2: Write an example.

```ruby
requre 'method_wrapper'

class Example
  def a
    "a"
  end
end

Example.wrap_instance_method(pattern: /^a/, ->(method, *args, &block) do 
  puts "Before call"
  method.call(*args, &block)
  puts "After call"
end)

puts instance.new.a

```

Also is possible:

* Invoke private and protected methods.
* Invoke class methods.
* Replace method call with another implementation.