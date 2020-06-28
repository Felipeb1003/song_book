# Setlist Creator Made in Sinatra
This is an application that follows the MVC design pattern. It lets the user create songs and use them to create their own setlist through create, read, update, and delete functions.

Watch this video demo on how to use the app

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Clone and run the following command inside this project's directory 

    $ bundle

### Development

Run the following command to load database schema

    $ bundle exec rake db:schema:load

Start up local server

    $ bundle exec shotgun or $ bundle exec rackup

For interactive console

    $ bundle exec rake console

## Built With

* [Ruby 2.6.1](https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/)
* [Sinatra](http://sinatrarb.com/) - The web framework used
* [Bundler](https://bundler.io/) - Dependency Management

## Versioning

Thie repository uses [SemVer](http://semver.org/) for versioning.

## Author

* **Felipe Beltran** - *Initial work* - [FelipeB](https://github.com/Felipeb1003)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
