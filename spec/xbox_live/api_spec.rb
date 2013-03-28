require 'spec_helper'

describe XboxLive::Api do
  describe '#initialize' do
    it 'allows a specified format' do
      ['json', 'xml', 'php'].each do |format|
        lambda { XboxLive::Api.new(format: format) }.should_not raise_exception
      end
      lambda { XboxLive::Api.new(format: 'foobar') }.should raise_exception
    end

    it 'defaults to a json format' do
      api = XboxLive::Api.new
      api.format.should == 'json'
    end

    it 'allows a specified timeout in seconds' do
      api = XboxLive::Api.new(timeout: 10)
      api.timeout.should == 10
    end

    it 'defaults to a 6-second timeout' do
      api = XboxLive::Api.new
      api.timeout.should == 6
    end
  end

  context 'making requests' do
    it 'validates the gamertag' do
      api = XboxLive::Api.new
      lambda { api.fetch_profile('nevern02') }.should_not raise_exception
      lambda { api.fetch_profile('foobarbaz123') }.should raise_exception
    end

    it 'fetches a profile'
    it 'fetches a list of games'
    it 'fetches a list of achievements'
    it 'fetches a list of friends'
  end
end
