# Aocli

A simple CLI that helps start any advent of code problem by retrieving the probem decription,your unique inputs and putting together boilerplate code so you can start solving as soon as possible.

## Installation

Install the gem using

    $ gem install aocli

## Usage

Once installed simply run

    $ aocli

You'll need to save your advent of code cookie before you can do anything else, simply select the save cookie option and paste your cookie in when prompted. This will save the cookie in the config file located at `~/aocli_config`.

## How Do I Get My Advent Of Code Cookie

Advent of code uses a cookie to authenticate and determine the current user. To find out what your cookie is, simply go to [advent of code](TODO) and login using Github.

Once that's done

1. Open up the developer tools
1. Find the network tab
1. Navigate to any days problem
1. find the network entry with the name of the current days problem
1. In this network entry, you should find a request header called `cookie`.
1. The value of this header is your cookie
1. Copy that value, run `aocli`, select save cookie and paste it in when prompted

For the example shown, I viewed 2018 day 11 and can see the cookie inside the contents of the network tab named `11`

![cookie-example](/public/aocli-cookie-helper.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/astley92/aocli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/astley92/aocli/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
