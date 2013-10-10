module RedditImageDownloader
  class Processor < Struct.new(:options)
    def self.process!(options)
      new(options).process!
    end

    def process!
      listings.each do |listing|
        download = agent.get(listing["url"])

        if download.is_a?(Mechanize::Image)
          reader = Dimensions::Reader.new

          reader << download.body

          if reader.width > options[:min_width] && reader.height > options[:min_height]
            filename = "#{listing["id"]}.#{reader.type}"
            destination = File.join(options[:destination], filename)

            unless File.exists?(destination)
              download.save(destination)
            end
          end
        end
      end

      if options[:max_age]
        file_query = File.join(options[:destination], "*")

        Dir[file_query].each do |file|
          age = Time.now - File.ctime(file)
          days_old = age / (24 * 3600)

          if days_old > options[:max_age]
            File.delete(file)
          end
        end
      end
    end

    private

    def listings
      options[:subreddits].map do |subreddit|
        client.get_listing(subreddit: subreddit, page: options[:page]).parsed_response["data"]["children"]
      end.flatten.map do |listing|
        listing["data"]
      end
    end

    def client
      @client ||= Snoo::Client.new
    end

    def agent
      @agent ||= Mechanize.new
    end
  end
end
