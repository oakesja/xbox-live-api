# XboxLiveApi
[![Build Status](https://travis-ci.org/oakesja/xbox-live-api.svg?branch=master)](https://travis-ci.org/oakesja/xbox-live-api)
[![Code Climate](https://codeclimate.com/github/oakesja/xbox-live-api/badges/gpa.svg)](https://codeclimate.com/github/oakesja/xbox-live-api)
[![Test Coverage](https://codeclimate.com/github/oakesja/xbox-live-api/badges/coverage.svg)](https://codeclimate.com/github/oakesja/xbox-live-api/coverage)
[![Gem Version](https://badge.fury.io/rb/xbox_live_api.svg)](http://badge.fury.io/rb/xbox_live_api)

XboxLiveApi is a wrapper library for Xbox Live's undocumented API used for the Xbox One Smartglass app. This gem will 
provide you access to your profile, games, and achievements. It is important to note that you must have a Windows Live 
Account to be able to login and use this gem. Emails and passwords are not stored, logged, or otherwise used in any 
manner other than to securely login to Xbox Live. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xbox_live_api'
```

Or install it yourself as:

```
$ gem install xbox-live-api
```
## Usage

To use this library, you must first login using your Windows Live Account details. This will provide you with an `XboxLiveApi` 
object that can be used to request additional information. 

```ruby
require 'xbox_live_api'

api = XboxLiveApi.login(email, password)
```

Once logged in the following information can be accessed. 

 - [Profile](https://github.com/oakesja/xbox-live-api/blob/master/lib/xbox_live_api/models/profile.rb)
 - [Games](https://github.com/oakesja/xbox-live-api/blob/master/lib/xbox_live_api/models/game.rb)
 - [Achievements](https://github.com/oakesja/xbox-live-api/blob/master/lib/xbox_live_api/models/achievement.rb)
 
```ruby

profile = api.get_profile

xbox_one_games = api.get_xbox_one_games

xbox_360_games = api.get_xbox_360_games

achievements = api.get_achievements_for(xbox_360_games.first)

```

Each call will return a corresponding object (ex. XboxLiveApi::Game). See the above links for all of their attributes. 


## Contributing

If you run into any issues, find a bug, or have a question please submit an issue on Github. 
If you would like to contribute to this project please fork it and create a pull request. 

## License

This gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

It is also an unofficial API of the Xbox LIVE Service, it is in no way endorsed or affiliated to the Microsoft 
Corporation, Xbox, Xbox LIVE and any Xbox images are registered trademarks of their respected owners.

