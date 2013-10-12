# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reddit_image_downloader/version'

Gem::Specification.new do |spec|
  spec.name          = "reddit_image_downloader"
  spec.version       = RedditImageDownloader::VERSION
  spec.authors       = ["Brendan Loudermilk"]
  spec.email         = ["bloudermilk@gmail.com"]
  spec.summary       = %q{Command line tool to download images from Reddit}
  spec.homepage      = "https://github.com/bloudermilk/reddit_image_downloader"
  spec.license       = "MIT"
  spec.description = <<-EOF
    Reddit Image Downloader is a command line tool for downloading images from
    Reddit. Users can specify one or more subreddits, minimum dimensions, a
    destination path, and a maximum age for images.
  EOF

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry", "~> 0.9.12.2"

  spec.add_dependency "snoo", "~> 0.1.2"
  spec.add_dependency "mechanize", "~> 2.7.2"
  spec.add_dependency "dimensions", "~> 1.2.0"
end
