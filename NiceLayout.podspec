Pod::Spec.new do |spec|
  
  spec.name = 'NiceLayout'
  spec.version = '0.0.1'
  
  spec.summary = "A concise Swift API that makes Auto Layout code nicer."
  spec.homepage = 'https://github.com/adamshin/NiceLayout'
  spec.author = 'Adam Shin'
  spec.license = 'MIT'
  
  spec.platform = :ios, '9.0'
  spec.swift_version = '5.0'
  
  spec.source = { :git => 'https://github.com/adamshin/NiceLayout.git', :tag => "#{spec.version}" }
  spec.source_files = 'Source/*'
  
end
