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

```rb
UsNewsRankings::Education::GraduateSchools::Law::AnnualList.new(2017).rankings
#> [
#   {
#     :rank=>1,
#     :tie=>false,
#     :school_name=>"Yale University",
#     :school_city=>"New Haven, CT",
#     :tuition=>"$59,865 per year (full-time)",
#     :enrollment=>"632"
#   },
#   {
#     :rank=>2,
#     :tie=>false,
#     :school_name=>"Stanford University",
#     :school_city=>"Stanford, CA",
#     :tuition=>"$58,236 per year (full-time)",
#     :enrollment=>"579"
#   },
#   {
#     :rank=>3,
#     :tie=>false,
#     :school_name=>"Harvard University",
#     :school_city=>"Cambridge, MA",
#     :tuition=>"$60,638 per year (full-time)",
#     :enrollment=>"1,771"
#   }, etc.
# ]
```

## [Contributing](CONTRIBUTING.md)

## [License](LICENSE.md)
