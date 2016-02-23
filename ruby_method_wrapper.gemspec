# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name           = 'ruby_method_wrapper'
  spec.version        = MethodWrapper::VERSION
  spec.date           = '2015-12-02'
  spec.summary        = 'Only another method wrapper lib'
  spec.description    = 'Allow wrap instance/class methods to add behavior before, after or arround this'
  spec.authors        = 'Adrian Norberto Marino'
  spec.email          = 'adrianmarino@gmal.com'
  spec.files          = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths  = ['lib']
  spec.licenses       = 'MIT'
  spec.homepage       = 'http://nonosoft.com.ar'

  spec.add_development_dependency 'rspec', '3.4.0'
end
