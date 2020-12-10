# Jungle

A mini e-commerce application built with Ruby on Rails. This app uses Rails 4.2.6 for the purpose of simulating a workplace scenario of inheriting a codebase that is x-amount of years old with older versions of its frameworks.

## Tech Stack
Front End:
- ERB

Back End:
- Ruby on Rails
- PostgreSQL

Testing:
- RSpec
- Capybara
- Poltergeist

*Created in Weeks 9 and 10 of Lighthouse Labs Web Development Bootcamp.*

## Walkthrough 

### Customers can add products to their cart.
![index](https://github.com/JoshGrant5/jungle/blob/master/public/screenshots/Screen%20Shot%202020-11-18%20at%209.33.18%20AM.png) 

### Customer reviews their cart before confirming order.
![review cart](https://github.com/JoshGrant5/jungle/blob/master/public/screenshots/Screen%20Shot%202020-11-18%20at%209.35.02%20AM.png) 

### Customers pay for their order using Stripe prompt.
![stripe charge](https://github.com/JoshGrant5/jungle/blob/master/public/screenshots/Screen%20Shot%202020-11-18%20at%209.35.56%20AM.png) 

### Customers are shown their order confirmation and summary.
![order confirmation](https://github.com/JoshGrant5/jungle/blob/master/public/screenshots/Screen%20Shot%202020-11-18%20at%209.36.23%20AM.png) 

### Admin can view all sales and add a new sale.
![admin sale](https://github.com/JoshGrant5/jungle/blob/master/public/screenshots/Screen%20Shot%202020-11-18%20at%209.37.03%20AM.png) 

### Admin can view all products listed and add a new product.
![admin add product](https://github.com/JoshGrant5/jungle/blob/master/public/screenshots/Screen%20Shot%202020-11-18%20at%209.37.26%20AM.png) 

### Leave a review for a product and view other users' reviews.
![review product](https://github.com/JoshGrant5/jungle/blob/master/public/screenshots/Screen%20Shot%202020-11-18%20at%209.38.05%20AM.png) 

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
