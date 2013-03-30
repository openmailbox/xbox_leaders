# XboxLeaders

This is a wrapper around the Xbox Live API provided for free at [https://www.xboxleaders.com/](https://www.xboxleaders.com/).

## Installation

Add this line to your application's Gemfile:

    gem 'xbox_leaders'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xbox_leaders

## Usage

    2.0.0p0 :001 > require 'xbox_leaders'
     => true
    2.0.0p0 :002 > api = XboxLeaders::Api.new
      => #<XboxLeaders::Api:0x007fbba19adeb8 @timeout=6>
    2.0.0p0 :003 > api.fetch_profile('Major Nelson')
      => {"Tier"=>"gold", "IsValid"=>1, "IsCheater"=>0, "IsOnline"=>0, "OnlineStatus"=>"Offline", "XBLLaunchTeam"=>1, "NXELaunchTeam"=>1, "KinectLaunchTeam"=>1, "AvatarTile"=>"http://avatar.xboxlive.com/avatar/Major%20Nelson/avatarpic-l.png", "AvatarSmall"=>"http://avatar.xboxlive.com/avatar/Major%20Nelson/avatarpic-s.png", "AvatarLarge"=>"http://avatar.xboxlive.com/avatar/Major%20Nelson/avatarpic-l.png", "AvatarBody"=>"http://avatar.xboxlive.com/avatar/Major%20Nelson/avatar-body.png", "AvatarTileSSL"=>"https://avatar-ssl.xboxlive.com/avatar/Major%20Nelson/avatarpic-l.png", "AvatarSmallSSL"=>"https://avatar-ssl.xboxlive.com/avatar/Major%20Nelson/avatarpic-s.png", "AvatarLargeSSL"=>"https://avatar-ssl.xboxlive.com/avatar/Major%20Nelson/avatarpic-l.png", "AvatarBodySSL"=>"https://avatar-ssl.xboxlive.com/avatar/Major%20Nelson/avatar-body.png", "Gamertag"=>"Major Nelson", "GamerScore"=>63147, "Reputation"=>20, "Name"=>nil, "Motto"=>"", "Location"=>"", "Bio"=>nil}

See the specs, rdocs, lib files, and documentation at [https://www.xboxleaders.com/](https://www.xboxleaders.com/) for more API calls.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
