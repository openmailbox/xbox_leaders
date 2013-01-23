require 'spec_helper'

module XboxLive
  describe Gamer do
    it 'retrieves a profile' do
      gamer = Gamer.new('nevern02')
      gamer.gamertag.should == 'nevern02'
    end

    it 'raises an error if the gamertag is invalid' do
      lambda { Gamer.new('abc123') }.should raise_exception
    end
  end
end
