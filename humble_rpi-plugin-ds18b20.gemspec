Gem::Specification.new do |s|
  s.name = 'humble_rpi-plugin-ds18b20'
  s.version = '0.1.0'
  s.summary = 'A Humble RPi plugin to read the ambient temperature from the DS18B20 sensor.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/humble_rpi-plugin-ds18b20.rb']
  s.signing_key = '../privatekeys/humble_rpi-plugin-ds18b20.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/humble_rpi-plugin-ds18b20'
end
