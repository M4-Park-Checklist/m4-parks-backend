# README

NPS Service is an API that provides details on all US national parks, preserves, monuments, memorials, historic sites, seashores, and national battlefield parks. 

The project follows service-oriented architecture (SOA) and is divided into two different repositories:
- [NPS Service back-end]()
- [NPS Service front-end]()

NPS Service API fits into our projects SOA by providing the endpoint and backend logic that allows us to easily connect to any given front end service as a way of being able to quickly adapt.

## Getting Started

The fastest way to start working out using NPS Service is to visit our deployed app [here]().

If you would like to run the application locally, you will need Rails 7.X.X and to clone both [NPS Service-FE](https://github.com/FasTracks/FasTracks-FE) and [NPS Service-BE](https://github.com/FasTracks/FasTracks-BE), since the application follows service-oriented architecture. For the BE repo, follow the steps below. For the FE Repo, follow the ** Getting Started ** steps within the repo. 

1. `bundle install`
2. `rails db:{drop,create}` 
3. `bundle exec rspec` -- to see TDD in action
4. `rails server`

Then, in your browser, visit `localhost:3000` and follow the prompts on screen. 

### Prerequisites

We recommend a basic understanding of the following concepts before diving in to our code:

- Ruby on Rails Applications
- Service oriented architecture
- Oauth 2.0

Requirements for the software and other tools to build, test and push 
- Rails 7.X
- Ruby 3.2.2

### Installing

- Fork and clone these repos
  - [FasTracks-Frontend](https://github.com/FasTracks/FasTracks-FE) 
  - [FasTracks-Backend](https://github.com/FasTracks/FasTracks-BE) (you are here)

`bundle install`<br>
`rails db:{create,migrate}`<br>

Gems Included: 

- gem "pry-rails"
- gem "rspec-rails"
- gem "factory_bot_rails"
- gem "faker"
- gem "shoulda-matchers"
- gem "capybara"
- gem "faraday"
- gem "webmock"
- gem "vcr"

## Running the tests

Follow commands below to run the app test suite. 

`bundle exec rspec`

## Deployment

This project is deployed using heroku [here](https://fastracks-62267ab898ea.herokuapp.com/) 


## Contributing

Contributions are welcome and can be submitted by pull request. 

## Versioning

The current version (V1) of our application is live here on github. 

## Authors
  
  - **Kameron Kennedy** - *[LinkedIn](https://www.linkedin.com/in/kameron-kennedy-pe/), [GitHub](https://github.com/kameronk92)*
  - **Kameron Kennedy** - *[LinkedIn](https://www.linkedin.com/in/kameron-kennedy-pe/), [GitHub](https://github.com/kameronk92)*
  - **Kameron Kennedy** - *[LinkedIn](https://www.linkedin.com/in/kameron-kennedy-pe/), [GitHub](https://github.com/kameronk92)*
  - **Kameron Kennedy** - *[LinkedIn](https://www.linkedin.com/in/kameron-kennedy-pe/), [GitHub](https://github.com/kameronk92)*

## License

This project is not licensed and is open source. 

## Acknowledgments

  - Technical direction and consultation provded by [Jamison Ordway](https://github.com/jamisonordway) and [Chris Simmons](https://github.com/cjsim89)
  - This project completed by Mod 3 students at [Turing School of Software and Design](https://turing.edu/)
