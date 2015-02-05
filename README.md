# RubyWmata [![Code Climate](https://codeclimate.com/github/bennacer860/ruby_wmata/badges/gpa.svg)](https://codeclimate.com/github/bennacer860/ruby_wmata)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_wmata'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_wmata

## Usage

You will need to get your own api_key from [here](https://developer.wmata.com/demokey)
Setup you api key first

```ruby
WMATA.api_key = "xxxxxxx"
```
And then you can make you api calls like this

```ruby
WMATA.next_trains("A01")
```

In this case we have used the station name code as argument, you can determine the code for each station by making a simple code on a specific line

```ruby
WMATA.train_stations("RD")
```

In this case 'RD' is the code name for the 'red line', you can find all those line code name by making a simple call

```ruby
WMATA.lines
```

Another cool feature you can make is to find the path between two stations

```ruby
WMATA.train_path("A01","A15")
```

## Contributing

1. Fork it ( https://github.com/bennacer860/ruby_wmata/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
