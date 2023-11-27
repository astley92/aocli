# Aocli

A simple CLI that helps start any advent of code problem by retrieving the probem decription,your unique inputs and putting together boilerplate code so you can start solving as soon as possible.

## Installation

Install the gem using

```bash
gem install aocli
```

## Usage

Once installed simply run

```bash
aocli
```

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

## Using your own template file

Don't like the default template you got for each challenge? It's just about as basic as it gets so I've made it easy for users
to create their own and have it be used. Simply create your own template, structured however your prefer
and optionally insert the two directives `__aocli_load_input__` and `__aocli_problem_description__`. You can leave either off if you
prefer to either not have the problem description shown or would like to load your input in another way.

`__aocli_problem_description__` Will be replaced with the given problems description as a comment

`__aocli_load_input__` Will be replaced by the line that loads your input as a string into the `input` variable.

Then run the `aocli` command and choose the "Set Template File" option, paste in the full path to your file and it'll be used
when generating the files for a given day.

Partial file path could be used if you expect to run aocli from the same location
all the time but I'd recommend using the full path just in case.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/astley92/aocli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/astley92/aocli/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
