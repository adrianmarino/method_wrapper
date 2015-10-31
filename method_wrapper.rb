# Suppress ruby warnings
$VERBOSE = nil

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

class Class
  def wrap_method(pattern:, &wrapper)
    methods.grep(pattern).each do |name|
      method = method(name)
      define_singleton_method(name) { |*args, &block| wrapper.call(method, *args, &block) }
    end
  end

  def wrap_instance_method(pattern:, &wrapper)
    instance_methods.grep(pattern).each do |name|
      method = instance_method(name)
      define_method(name) { |*args, &block| wrapper.call(method.bind(self), *args, &block) }
    end
  end
end
