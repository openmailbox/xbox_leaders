require 'httparty'

class XboxLeaders::Api

  include HTTParty
  base_uri 'https://www.xboxleaders.com/api/1.0'

  attr_accessor :timeout
  
  def initialize(timeout = 6)
    @timeout = timeout
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
    response = self.class.get(path + ".json", timeout: timeout, query: query).to_hash

    if error = response['Error']
      raise ArgumentError, error
    end

    response['Data']
  end

end
