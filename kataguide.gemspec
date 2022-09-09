Gem::Specification.new do |spec|
  spec.name          = "kataguide"
  spec.version       = "0.0.1"
  spec.authors       = ["Cade Brown"]
  spec.email         = ["me@cade.site"]

  spec.summary       = %q{Online documentation and resources for Kata software.}
  spec.homepage      = "https://kata.guide"
  spec.license       = "MIT"
  spec.metadata      = {
  }

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(css|js|img|bin|_layouts|_includes|lib|Rakefile|_sass|LICENSE|README|CHANGELOG|favicon)}i) }
  spec.executables   << 'just-the-docs'

  spec.add_development_dependency "bundler", "~> 2.3.5"
  spec.add_runtime_dependency "jekyll", ">= 3.8.5"
  spec.add_runtime_dependency "jekyll-seo-tag", ">= 2.0"
  spec.add_runtime_dependency "rake", ">= 12.3.1"
end
