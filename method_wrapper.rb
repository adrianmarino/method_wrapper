# Suppress ruby warnings
$VERBOSE = nil

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

class Class
  def wrap_method(pattern:, &block)
    methods.grep(pattern).each do |name|
      method = method(name)
      define_singleton_method(name) { |*args| block.call(method, *args) }
    end
  end

  def wrap_instance_method(pattern:, &block)
    instance_methods.grep(pattern).each do |name|
      method = instance_method(name)
      define_method(name) { |*args| block.call(method.bind(self), *args) }
    end
  end
end
