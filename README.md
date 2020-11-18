# Jungle

A mini e-commerce application built with Ruby on Rails. This app uses Rails 4.2.6 for the purpose of simulating a workplace scenario of inheriting a codebase that is x-amount of years old with older versions of its frameworks.

## Walkthrough 

### Responsive navbar showing the number of spots available for each day.
![view days](https://github.com/JoshGrant5/interview-scheduler/blob/master/public/images/gifs/view-days.gif) 

### Select a timeslot to book an appointment and decrese spots remaining for that day.
![book appointment](https://github.com/JoshGrant5/interview-scheduler/blob/master/public/images/gifs/book-appointment.gif) 

### Edit an existing appointment with no change to spots remaining for that day.
![edit appointment](https://github.com/JoshGrant5/interview-scheduler/blob/master/public/images/gifs/edit-appointment.gif) 

### Delete an appointment and increase spots remaining for that day.
![delete appointment](https://github.com/JoshGrant5/interview-scheduler/blob/master/public/images/gifs/delete-appointment.gif) 

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
