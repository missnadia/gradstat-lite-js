# GradStat-js

GradStat-js is a course management application that logs your study time as well as comparing your pace with other students taking the same course. This version integrates JavaScript and a JSON API to add dynamic features to the GradStat application.

## Setup

Clone with SSH:

`$ git clone 'git@github.com:missnadia/gradstat-js.git'`

OR

Clone with HTTPS:

`$ git clone 'https://github.com/missnadia/gradstat-js.git'`

Then execute:

`$ bundle install`

`$ rails db:migrate`

`$ rails db:seed`

`$ thin start --ssl`

Admin username/password (db/seeds.rb):

Email: "sfields@abc.com"

Password: "password"

## Contributing

Bug reports and pull requests are welcome on GitHub at [github.com/missnadia/gradstat-js.git](https://github.com/missnadia/gradstat-js.git). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GradStat-js project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/missnadia/gradstat/blob/master/CODE_OF_CONDUCT.md).