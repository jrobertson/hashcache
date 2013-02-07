Gem::Specification.new do |s|
  s.name = 'hashcache'
  s.version = '0.2.6'
  s.summary = 'hashcache'
    s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/hashcache.pem'
  s.cert_chain  = ['gem-public_cert.pem']
end
