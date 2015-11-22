# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sftp_tree/version'

Gem::Specification.new do |spec|
  spec.name          = "sftp_tree"
  spec.version       = SftpTree::VERSION
  spec.authors       = ["Jamie Little"]
  spec.email         = ["j.little@miami.edu"]

  spec.summary       = "Gem for returning a tree data structure from path over sftp." 
  spec.description   = "This is a Ruby library that allows you to get a tree from a remote location over sftp. When the resulting hash is serialized into JSON it uses the JSTree syntax."
  spec.homepage      = "https://github.com/little9/sftp_tree"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_runtime_dependency "net-sftp"
end
