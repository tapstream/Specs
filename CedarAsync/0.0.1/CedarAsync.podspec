Pod::Spec.new do |s|
  s.name         = "CedarAsync"
  s.version      = "0.0.1"
  s.summary      = "asynchronous testing for Cedar (and others)."
  s.description  = <<-DESC
                    CedarAsync lets you use [Cedar](http://github.com/pivotal/cedar) matchers to 
test asynchronous code. This becomes useful when writing intergration tests 
rather than plain unit tests. (CedarAsync only supports Cedar's should syntax.)

Instead of

    client.lastResponse should contain(@"Google");

use

    in_time(client.lastResponse) should contain(@"Google");

to force `contain` matcher check `client.lastResponse` multiple times until 
it succeeds or times out.
                   DESC
  s.homepage     = "https://github.com/cppforlife/CedarAsync"

  s.license      = { :type => 'MIT', :text => 'LICENSE' }
                    
                   
  s.author       = { "Dmitriy Kalinin" => "email@address.com" }
  s.source       = { :git => "https://github.com/cppforlife/CedarAsync.git", :commit => "ccd4ecc3ae2a697267f22a3e216942ef00e74a54" }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source_files = 'Source', 'Source/**/*.{h,m}'
  s.dependency "Cedar"

  # Versions of this pod >= 0.9.0 require C++11.
  #   https://github.com/pivotal/cedar/issues/47
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++0x',
    'CLANG_CXX_LIBRARY' => 'libc++'
  }
  s.requires_arc = false
end
