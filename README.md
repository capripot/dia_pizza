# Pizza rates

Homework for Dia&Co by Ronan
[![CircleCI](https://circleci.com/bb/capripot/pizza_dia.svg?style=svg)](https://circleci.com/bb/capripot/pizza_dia)

## Task

Build a (very) primitive version of a pizza review aggregator.

## Specifics

* Build a webpage that accepts the name of a pizza restaurant in New York and displays the `n` most recent Yelp reviews for this restaurant, where `n` is a user input. Assume `n < 10`.
* The webpage should also display the average score, or number of stars, of the relevant reviews.

## Implementation

* Your solution should be a Rails application.
* Feel free to use any RubyGems that you deem helpful.
* Note: Yelp’s API does not support retrieving reviews, so you will have to scrape the data yourself!


## Features implemented

- retrieval of best match to given name via Yelp API
- retrieval of 10 first reviews
- average of selected reviews
- one day caching

## Install

- copy `.envrc-example` to `.envrc`
- fill `.envrc` with values from https://www.yelp.com/developers/v2/manage_api_keys
- copy `config/database-example.yml` to `config/database.yml`
- `brew install`
- `rbenv install`
- `nvm install`
- `npm install`
- `rails s`
- go to http://localhost:3000
