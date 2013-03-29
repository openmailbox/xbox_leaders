require 'httparty'

class XboxLive::Api

  include HTTParty
  base_uri 'https://www.xboxleaders.com/api'
  format :json

  attr_accessor :timeout
  
  def initialize(timeout: 6)
    @timeout = timeout
  end

  def fetch_profile(gamertag)
    get('/profile', gamertag: gamertag)
  end

  def fetch_games(gamertag)
    get('/games', gamertag: gamertag)
  end

  private

  def get(path, query={})
    response = self.class.get(path, timeout: timeout, query: query).to_hash

    if response['error']
      raise ArgumentError, response['error']['message']
    end

    response['Data']
  end

end
