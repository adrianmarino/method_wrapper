#!/usr/bin/env ruby
require './method_wrapper'

class Example
  def a
    "instance method 'a'"
  end

  def a_a
    "instance method 'a_a'"
  end

  def self.a
    "class method 'a'"
  end
end

block = ->(method, *args) { puts "Wrap #{method.call(*args)}" }
Example.wrap_method(pattern: /^a$/, &block)
Example.wrap_instance_method(pattern: /^a/, &block)

example = Example.new
example.a
example.a_a

Example.a
