# US News Rankings

A third-party interface into public rankings data published by [U.S. News and World Report](https://www.usnews.com/).

[![Build Status](https://travis-ci.org/data-creative/us-news-rankings-ruby.svg?branch=master)](https://travis-ci.org/data-creative/us-news-rankings-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'us_news_rankings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install us_news_rankings

## Usage

### Client-side

Feel free to make client-side requests to the raw JSON or CSV data (e.g. _____________). Thanks to GitHub for hosting.

### Server-side

```rb
UsNewsRankings::Education::GraduateSchools::Law::Category.new(2017).rankings
#> [{}, {}, {}]
```

## [Contributing](CONTRIBUTING.md)

## [License](LICENSE.md)
