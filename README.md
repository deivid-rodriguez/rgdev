# Rgdev

A Ruby gem to simplify contributing to [RubyGems](https://github.com/rubygems/rubygems),
by using a Docker-based development environment.

## Dependencies

1. Docker
2. Git
3. Ruby

## Usage

This is a gem meant to make developing RubyGems itself easier, and as such
doesn't make much sense if you're not contributing to RubyGems.

### First-time setup

    $ git clone https://github.com/rubygems/rubygems.git
    $ cd rubygems
    $ gem install rgdev
    $ rgdev setup

### Execute commands in the Docker container

Now, with setup done, you're ready to execute commands inside the Docker container:

    $ rgdev <command to run in the Docker container>

**Example**: Running the RubyGems test suite inside the Docker container

    $ rgdev rake test

## Developing Rgdev

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/duckinator/rgdev. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rgdev project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/duckinator/rgdev/blob/master/CODE_OF_CONDUCT.md).
