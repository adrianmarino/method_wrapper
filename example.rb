#!/usr/bin/env ruby
require './method_wrapper'

class Example
  def a
    "instance method 'a'"
  end

  def a_a
    "instance method 'a_a'"
  end

  def a_a_a
    "instance method 'a_a' (block: #{yield})"
  end

  def self.a
    "class method 'a'"
  end
end

wrapper = ->(method, *args, &block) { puts "Wrap #{method.call(*args, &block)}" }
Example.wrap_method(pattern: /^a$/, &wrapper)
Example.wrap_instance_method(pattern: /^a/, &wrapper)

example = Example.new
example.a
example.a_a
example.a_a_a { "result" }

Example.a
