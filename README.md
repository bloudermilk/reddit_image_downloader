# RedditImageDownloader

RedditImageDownloader is a command line tool written in Ruby for downloading
images from any subreddit on reddit.com.

## Installation

The tool is available on RubyGems:

    $ gem install reddit_image_downloader

## Usage

Use the `reddit_image_downloader` command to download images. Specify one or
more of the options below to customize your query.

    $ reddit_image_downloader [options]

### Specifying subreddit(s)

You must use `--subreddits` (shorthand `-r`) to specify one or more subreddits
as a comma-separated list. The following example will download the top images
[/r/EarthPorn][earthporn] and [/r/awww][awww].

    $ reddit_image_downloader -r EarthPorn,awww

### Downloading to a specific path

By default, the command will download all images into the current working
directory of your shell. You can override this behavior with the
`--destination` (shorthand `-d`) option. The following example will download
images from [/r/Earthporn][earthporn] to your desktop.

    $ reddit_image_downloader -r EarthPorn -d ~/Desktop

### Requiring minimum dimensions

You may choose to only download images which meet minimum width and height
requirements with the `--min-width` (shorthand `-x`) and `--min-height`
(shorthand `-y`) options respectively. The following example will download
images from [/r/EarthPorn][earthporn] *only* if they are 1920x1080.

    $ reddit_image_downloader -r EarthPorn -x 1920 -y 1080

You may choose to only specify one dimension, as well.

    $ reddit_image_downloader -r EarthPorn -y 1080

### Choosing a page

You may choose to download images from either one the of "top" (default),
"new", or "controversial" pages with the `--page` (shorthand `-p`) option. The
following example will download new images from [/r/awww][awww].

    $ reddit_image_downloader -r awww -p new

### Purging old images

The initial use case for this tool was to manage a folder for wallpaper
images. The `--max-age` (shorthand `-a`) option can be used to purge images
older than a specified number of days. The following example will download
images from [/r/awww][awww] then delete any images that were downloaded more
than 14 days ago.

    $ reddit_image_downloader -r awww -a 14

### Need help?

You can use the `--help` (shorthand `-h`) option to see a list of all the
available options and a short description of each. The following example shows
the help message:

    $ reddit_image_downloader -h

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[earthporn]: http://reddit.com/r/EarthPorn
[awww]: http://reddit.com/r/awww

## License

Copyright (c) 2013 Brendan Loudermilk

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
