require "open-uri"
require "json"

class FlatsController < ApplicationController
  def index
    # 1. Define the URL where our fake database (JSON) lives
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

    # 2. Open the URL, read the data, and parse it from a String into a Ruby Array of Hashes
    @flats = JSON.parse(URI.parse(url).read)
  end
end
