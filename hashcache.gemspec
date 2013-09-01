Gem::Specification.new do |s|
  s.name = 'hashcache'
  s.version = '0.2.10'
  s.summary = 'hashcache'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.add_dependency('chronic_duration')
  s.signing_key = '../privatekeys/hashcache.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/hashcache'
end
