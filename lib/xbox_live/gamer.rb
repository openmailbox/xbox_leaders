require 'net/http'
require 'json'

module XboxLive
  class Gamer
    attr_reader :gamertag

    def initialize(gamertag)
      @response = JSON.parse(fetch_profile(gamertag), symbolize_names: true)
      raise Exception, "#{@response[:error][:message]}" if @response[:error]
      @gamertag = @response[:Data][:Gamertag]
    end

    private

    def fetch_profile(gamertag)
      Net::HTTP.get(URI("#{API_ROOT}/profile.json?gamertag=#{gamertag}"))
    end
  end
end
