# SerialCrack

A simple password cracker for serial-connected hardware

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'serial_crack'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install serial_crack

## Usage

```
$ serial_crack --help
Usage: serial_crack [SERIAL]
    -b, --bitrate BAUD               choose the bitrate for communication
    -d, --data BITS                  choose the data bits for communication
    -s, --stop BITS                  choose the stop bits for communication
    -D, --delay MS                   add a delay between tests
    -w, --wordlist FILE              use a wordlist from the given file
    -r, --range RANGE                add a character range
    -S, --start PASSWORD             start with the given password
    -P, --prompt PROMPT              specify the prompt to look for
    -N, --no-newline                 skip the extra newline between password attempts
    -h, --help                       help
```

To attempt to crack a device attached at /dev/ttyUSB0 which has a password that allows the characters `a-zA-Z0-9`;

```
$ serial_crack -r a..z -r A..Z -r 0..9 /dev/ttyUSB0
```

## Development

TODO: Write development instructions

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ananace/serial_crack.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
