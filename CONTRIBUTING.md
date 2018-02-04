# Contributor's Guide

Bug reports and pull requests are welcome on GitHub at https://github.com/data-creative/us-news-rankings-ruby.

## Prerequisites

Install Ruby (version 2.2.5) and Bundler (version 1.16).

## Installation

Install source code:

```sh
git clone git@github.com:data-creative/us-news-rankings-ruby.git
cd us-news-rankings-ruby/
```

Install package dependencies:

```sh
bin/setup
```

## Development

Run an interactive console, as desired:

```sh
bin/console
```

### Updating Rankings Data

1. Download HTML files into the [archives repo](https://github.com/data-creative/us-news-rankings-archive).

2. Transform source HTML into table elements:

```sh
bundle exec rake extract_tables
```

2. Transform source HTML into machine-readable data in JSON and CSV format:

```sh
bundle exec rake transform_tables
```

## Testing

Run tests:

```sh
bundle exec rspec spec
```

## Documenting

Generate docs:

```sh
bundle exec yard doc
```

## Releasing

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
