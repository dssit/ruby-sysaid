Gem::Specification.new do |s|
  s.name        = 'sysaid'
  s.version     = '0.1.1'
  s.date        = '2012-06-13'
  s.summary     = "ruby-sysaid"
  s.description = "A wrapper for the SysAid SOAP API"
  s.authors     = ["Christopher Thielen"]
  s.email       = 'cmthielen@ucdavis.edu'
  s.files       = Dir["lib/sysaid.rb"] + Dir["lib/sysaid/ticket.rb"] + Dir["lib/sysaid/driver/*.rb"]
  s.homepage    =
    'https://github.com/cthielen/ruby-sysaid'
  s.add_dependency('mumboe-soap4r', '>= 1.5.8.5')
end
