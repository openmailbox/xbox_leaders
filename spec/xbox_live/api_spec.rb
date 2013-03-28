require 'spec_helper'

describe XboxLive::Api do
  describe '#initialize' do
    it 'accepts a hash of options' 
    it 'allows a specified format'
    it 'defaults to a json format'
    it 'allows a specified timeout'
    it 'defaults to a 6-second timeout'
  end

  context 'making requests' do
    it 'validates the gamertag'
    it 'fetches a profile'
    it 'fetches a list of games'
    it 'fetches a list of achievements'
    it 'fetches a list of friends'
  end
end
