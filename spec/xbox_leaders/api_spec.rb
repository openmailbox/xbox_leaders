require 'spec_helper'

describe XboxLeaders::Api do
  let(:url) { 'https://www.xboxleaders.com/api/2.0' }

  describe '#initialize' do
    it 'requires a url' do
      expect {
        XboxLeaders::Api.new
      }.to raise_error(ArgumentError)
    end

    it 'allows a specified timeout in seconds' do
      api = XboxLeaders::Api.new(url, 10)
      api.timeout.should == 10
    end

    it 'defaults to a 6-second timeout' do
      api = XboxLeaders::Api.new(url)
      api.timeout.should == 6
    end
  end

  context 'making requests' do
    let(:api) { XboxLeaders::Api.new(url) }

    it 'validates the gamertag' do
      VCR.use_cassette('profile') do
        lambda { api.fetch_profile('Major Nelson') }.should_not raise_exception
      end

      VCR.use_cassette('bad_profile') do
        lambda { api.fetch_profile('fajdkfjdife99fgsd<F2>') }.should raise_exception
      end
    end

    it 'fetches a profile' do
      VCR.use_cassette('profile') do
        response = api.fetch_profile('Major Nelson')
        response['gamertag'].should == 'Major Nelson'
      end
    end

    it 'fetches a list of games' do
      VCR.use_cassette('games') do
        response = api.fetch_games('Major Nelson')
        response['games'].count.should be > 0
      end
    end

    it 'fetches a list of achievements' do
      VCR.use_cassette('achievements') do
        response = api.fetch_achievements('Major Nelson', '1297287449')
        response['game'].should_not be_nil
      end
    end

    it 'fetches a list of friends' do
      VCR.use_cassette('friends') do
        response = api.fetch_friends('Major Nelson')
        response['total'].should be > 0
      end
    end
  end
end
