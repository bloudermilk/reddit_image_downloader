module RedditImageDownloader
  module OptionParser
    PAGES = %W[top new controversial]

    DEFAULT_OPTIONS = {
      show_help: false,
      subreddits: [],
      min_width: 0,
      min_height: 0,
      destination: Dir.pwd,
      max_age: nil,
      page: :top,
    }

    BANNER = "Usage: reddit_image_downloader [options]"

    SUBREDDIT_FORMATS = %W[-r --subreddits=SUB1,SUB2]
    SUBREDDIT_DESC = "List of subreddits to download from"

    PATH_FORMATS = %W[-d --destination=PATH]
    PATH_DESC = "Path to download images to (defaults to current directory)"

    WIDTH_FORMATS = %W[-x --min-width=WIDTH]
    WIDTH_DESC = "Only download images at least WIDTH wide"

    HEIGHT_FORMATS = %W[-y --min-height=HEIGHT]
    HEIGHT_DESC = "Only download images at least HEIGHT tall"

    PAGE_FORMATS = %W[-p --page=PAGE]
    PAGE_DESC = "Page to download (top [default], new, controversial)"

    DAYS_FORMATS = %W[-a --max-age=DAYS]
    DAYS_DESC = "Purge files in destination folder older than DAYS days"

    HELP_FORMATS = %W[-h --help]
    HELP_DESC = "Show this message"

    def self.parse(args)
      options = DEFAULT_OPTIONS.dup

      parser = ::OptionParser.new do |parser|
        parser.banner = BANNER

        parser.on(*SUBREDDIT_FORMATS, Array, SUBREDDIT_DESC) do |subreddits|
          options[:subreddits] += subreddits
        end

        parser.on(*PATH_FORMATS, PATH_DESC) do |destination|
          options[:destination] = destination
        end

        parser.on(*WIDTH_FORMATS, Integer, WIDTH_DESC) do |min_width|
          options[:min_width] = min_width
        end

        parser.on(*HEIGHT_FORMATS, Integer, HEIGHT_DESC) do |min_height|
          options[:min_height] = min_height
        end

        parser.on(*PAGE_FORMATS, PAGES, PAGE_DESC) do |page|
          options[:page] = page
        end

        parser.on(*DAYS_FORMATS, Integer, DAYS_DESC) do |days|
          options[:max_age] = days
        end

        parser.on_tail(*HELP_FORMATS, HELP_DESC) do
          options[:show_help] = true
        end
      end

      parser.parse!(args)

      options
    end
  end
end
