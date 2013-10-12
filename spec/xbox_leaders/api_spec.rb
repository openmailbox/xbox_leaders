require 'spec_helper'

describe XboxLeaders::Api do
  describe '#initialize' do
    it 'allows a specified timeout in seconds' do
      api = XboxLeaders::Api.new(10)
      api.timeout.should == 10
    end

    it 'defaults to a 6-second timeout' do
      api = XboxLeaders::Api.new
      api.timeout.should == 6
    end
  end

  context 'making requests' do
    it 'validates the gamertag' do
      api = XboxLeaders::Api.new
      lambda { api.fetch_profile('Major Nelson') }.should_not raise_exception
      lambda { api.fetch_profile('fajdkfjdife99fgsd<F2>') }.should raise_exception
    end

    it 'fetches a profile' do
      response = XboxLeaders::Api.new.fetch_profile('Major Nelson')
      response['gamertag'].should == 'Major Nelson'
    end

    it 'fetches a list of games' do
      response = XboxLeaders::Api.new.fetch_games('Major Nelson')
      response['games'].count.should be > 0
    end

    it 'fetches a list of achievements' do
      response = XboxLeaders::Api.new.fetch_achievements('Major Nelson', '1297287449')
      response['game'].should_not be_nil
    end

    it 'fetches a list of friends' do
      response = XboxLeaders::Api.new.fetch_friends('Major Nelson')
      response['total'].should be > 0
    end
  end
end
