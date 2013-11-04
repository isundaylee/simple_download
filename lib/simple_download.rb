require "simple_download/version"

puts SimpleDownload.class

module SimpleDownload

  require 'net/http'
  require 'uri'

  def self.get(url)
    Thread.new do
      thread = Thread.current
      thread[:content] = ''
      thread[:completed] = false
      thread[:progress] = 0.0

      partial = 0

      uri = URI.parse url

      Net::HTTP.new(uri.host, uri.port).request_get(uri.path) do |response|
        thread[:length] = response['Content-Length'].to_i

        response.read_body do |frag|
          thread[:content] += frag
          partial += frag.length
          if thread[:length] > 0
            thread[:progress] = partial.quo(thread[:length])
          else
            thread[:progress] = -1
          end
        end
      end

      thread[:completed] = true
    end
  end
end
