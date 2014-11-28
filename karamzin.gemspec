# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'karamzin/version'

Gem::Specification.new do |spec|
  spec.name          = "karamzin"
  spec.version       = Karamzin::VERSION
  spec.authors       = ["Pavel Kalashnikov"]
  spec.email         = ["kalashnikovisme@gmail.com"]
  spec.summary       = %q{Вставляет букву Ё там, где она нужна.}
  spec.description   = %q{Принимает на вход строку и возвращает строку с проставленной буквой Ё именно в тех словах, где она нужна.}
  spec.homepage      = "https://github.com/kalashnikovisme/karamzin"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.0.0'
  spec.metadata = { "issue_tracker" => "https://github.com/kalashnikovisme/karamzin/issues" }
  spec.post_install_message = "Карамзин доволен тобой!:)"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
