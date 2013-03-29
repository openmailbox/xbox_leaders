require 'spec_helper'

describe XboxLeaders::Api do
  describe '#initialize' do
    it 'allows a specified timeout in seconds' do
      api = XboxLeaders::Api.new(timeout: 10)
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
      lambda { api.fetch_profile('nevern02') }.should_not raise_exception
      lambda { api.fetch_profile('foobarbaz123') }.should raise_exception
    end

    it 'fetches a profile' do
      response = XboxLeaders::Api.new.fetch_profile('nevern02')
      response['IsValid'].should == 1
    end

    it 'fetches a list of games' do
      response = XboxLeaders::Api.new.fetch_games('nevern02')
      response['GameCount'].should be > 0
    end

    it 'fetches a list of achievements' do
      response = XboxLeaders::Api.new.fetch_achievements('nevern02', '1096157379')
      response['Achievements'].should_not be_nil
    end

    it 'fetches a list of friends' do
      response = XboxLeaders::Api.new.fetch_friends('nevern02')
      response['Friends'].should_not be_nil
    end
  end
end
