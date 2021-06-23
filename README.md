
# 🍿 MONTE CINEMA API 🎥

### Technologies
- Rails 6.1.3
- Ruby 3.0.1
- Postgresql 1.1
- Redis 6.2.4
- RSpec 5.0.0

### Setup
To run this project:
1. `bundle install`
2. `rails db:setup`
3. `rails server`

### Documentation
API's documentation is generated with `rspec_api_documentation` and `apitome` and it's based in `/api/docs`. To generate it use `rails docs:generate`

### Admin
A general admin panel (powered by [administrate](https://github.com/thoughtbot/administrate)) can be accessed at http://localhost:3000/admin
<img width="1436" alt="122821517-3bee2400-d2dd-11eb-9787-a46ca912f919" src="https://user-images.githubusercontent.com/35639449/123091657-e83d2100-d429-11eb-99fd-fbc1d8716c98.png">

### Production
The API is accessible at the following URL: https://monte-cinema-app.herokuapp.com/

### Must have
Functional requirements:
- [x] Endpoint to buy tickets/create reservation from ticket desk
- [x] Endpoint to buy tickets/create reservation from online application
- [x] There should be mechanism (Cronjob? Background job?) to terminate reservation if somebody did not pay ~30 minutes before screening (for reservations created by online application)
- [ ] There should be email communication provided:
  - [ ] When reservation is created (tickets, seats and price should be attached)
  - [ ] When reservation is terminated (the reason should be attached)
- [x] Creating reservation should be robust and there should be validations (for instance - for already taken seats etc., - consider edge cases). 
- [x] Application should have implemented authentication (there should be logging by user and by employer)
- [x] Application should have authorization in terms of role-based separation
- [x] Regular user should have ability to create only online reservation
- [x] Employer should have ability to create online reservation but also offline reservation

Not functional requirements:
- [x] API should be documented 
- [x] Application should have provided seeds and should be generally operational
- [x] At least 80% of tests coverage
- [x] Application should have connected Sentry and CircleCI
- [x] Application should be accessible publicly (for instance by Heroku)
- [x] Application should have configured rubocop and should fulfill all rubocop requirements.

Nice to have:
- [ ] JSON:API endpoint
- [ ] GraphQL endpoint
- [ ] File upload (for instance avatar for user?)
- [x] Other functionalities like adding new movies, screenings, cinema halls
