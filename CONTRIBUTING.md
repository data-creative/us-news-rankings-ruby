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

To download new HTML tables of rankings data to the **/web** directory:

  1. Add ranking data source url(s) to the appropriate `category.rb` file.
  2. Add a corresponding entry into the appropriate `annual_list_spec.rb` test.
  3. Run the tests. If parsing logic has changed, you may need to also update the appropriate `ranking.rb` file until tests pass.

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
