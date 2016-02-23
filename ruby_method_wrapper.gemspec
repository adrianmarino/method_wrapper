Gem::Specification.new do |s|
  s.name         = 'ruby_method_wrapper'
  s.version      = '0.0.1'
  s.date         = '2015-12-02'
  s.summary      = 'Only another method wrapper lib'
  s.description  = 'Allow wrap instance/class methods to add behavior before, after or arround this'
  s.authors      = ['Adrian Norberto Marino']
  s.email        = 'adrianmarino@gmal.com'
  s.files        = Gem.find_files("lib/**/*.rb").each { |path| require path }
  s.licenses     = 'MIT'
  s.homepage     = 'http://nonosoft.com.ar'
  s.add_development_dependency "rspec", "3.4.0"
end
