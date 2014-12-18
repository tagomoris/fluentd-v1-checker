# fluentd-v1-checker

Checker utility for Fluentd v1 configuration syntax.

* to check Fluentd configuration files are valid as both of v0 (classic) and v1 syntax
* to check difference between v0 and v1 configuration files

## Installation

    $ gem install fluentd-v1-checker

## Usage

```
Usage: fluentd-v1-checker [options] CONF_PATH
        --with-v1-conf V1_CONF_PATH  configuration file path with v1 syntax to be checked whether same or not
```

To check classic configuration file is valid as v1:

    $ fluentd-v1-checker my_fluentd.conf

To check v1 configuration file is actually same with classic configuration file:

    $ fluentd-v1-checker --with-v1-conf my_v1_fluentd.conf my_classic_fluentd.conf

If any differences exist, this utility shows entire parse result and diff, and exits with code 1.
If no difference exists, it exits with code 0 without any output.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fluentd-v1-checker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
