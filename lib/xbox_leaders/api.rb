require 'httparty'

class XboxLeaders::Api
  include HTTParty

  attr_accessor :timeout
  attr_reader :api_url
  
  def initialize(api_url, timeout = 6)
    @timeout = timeout
    @api_url = api_url.chomp('/')
  end

  def fetch_achievements(gamertag, game_id)
    get('/achievements', gamertag: gamertag, gameid: game_id)
  end

  def fetch_friends(gamertag)
    get('/friends', gamertag: gamertag)
  end
  
  def fetch_games(gamertag)
    get('/games', gamertag: gamertag)
  end

  def fetch_profile(gamertag)
    get('/profile', gamertag: gamertag)
  end

  private

  def get(path, query={})
    response = self.class.get("#{api_url}#{path}.json", timeout: timeout, query: query).to_hash

    if response['status'] == 'error'
      raise ArgumentError, "#{response['data']['code']}: #{response['data']['message']}"
    end

    response['data']
  end

end
