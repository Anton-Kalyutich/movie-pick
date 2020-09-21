# Pick::A::Movie

This gem pulls information from https://suggestmemovie.com/, and puts out a list of 3 movies to pick from.
The user then inouts the number of the movie for more information, goes back to the list or types 'done' to exit the program.
The mission: when you can't choose what movie to watch next, random pick can simplify things.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pick-a-movie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pick-a-movie

## Usage

The program starts with greeting the user and listing 3 randomly picked movies. Upon entering the number of the movie in the list the user can see detailed information about the movie, and then either pick another movie from the list, get the whole list again, or enter 'done' to exit the program. The gems says 'goodbye' upon exiting.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'cool-clone-8176'/pick-a-movie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pick::A::Movie project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'cool-clone-8176'/pick-a-movie/blob/master/CODE_OF_CONDUCT.md).
