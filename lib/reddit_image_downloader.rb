# Stdlib
require "optparse"
require "ostruct"

# Gems
require "snoo"
require "mechanize"
require "dimensions"

# Development Gems
if ENV["DEV"]
  require "pry"
end

# Self
require "reddit_image_downloader/version"
require "reddit_image_downloader/option_parser"
require "reddit_image_downloader/processor"

module RedditImageDownloader
end
