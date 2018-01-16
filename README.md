# Todo

Command Line Interface for simple todo management

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todo

## Usage

```bash
$ exe/todo
Commands:
  todo add             # add new todo
  todo clear           # clear all todos
  todo delete          # delete a todo
  todo done            # make a todo done
  todo help [COMMAND]  # Describe available commands or one specific command
  todo init            # initialize
  todo list            # show todo list
```

## Examples

- initialize at first

```bash
$ exe/todo init
```

```bash
# Add task
$ exe/todo add foo
  +------------------+---------+----+-------+------+
  | created_at       | done_at | id | state | task |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 1  | 🔥     | foo  |
  +------------------+---------+----+-------+------+
$ exe/todo add bar
  +------------------+---------+----+-------+------+
  | created_at       | done_at | id | state | task |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 1  | 🔥     | foo  |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 2  | 🔥     | bar  |
  +------------------+---------+----+-------+------+
$ exe/todo add buzz
  +------------------+---------+----+-------+------+
  | created_at       | done_at | id | state | task |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 1  | 🔥     | foo  |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 2  | 🔥     | bar  |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 3  | 🔥     | buzz |
  +------------------+---------+----+-------+------+

# Make task done
$ exe/todo done 2
  +------------------+---------+----+-------+------+
  | created_at       | done_at | id | state | task |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 1  | 🔥     | foo  |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 3  | 🔥     | buzz |
  +------------------+---------+----+-------+------+

# Show all tasks
$ exe/todo list --all
  +------------------+------------------+----+-------+------+
  | created_at       | done_at          | id | state | task |
  +------------------+------------------+----+-------+------+
  | 2018-01-16 13:38 |                  | 1  | 🔥     | foo  |
  +------------------+------------------+----+-------+------+
  | 2018-01-16 13:38 | 2018-01-16 13:38 | 2  | 🎉     | bar  |
  +------------------+------------------+----+-------+------+
  | 2018-01-16 13:38 |                  | 3  | 🔥     | buzz |
  +------------------+------------------+----+-------+------+

# Show tasks which have been not done
$ exe/todo list
  +------------------+---------+----+-------+------+
  | created_at       | done_at | id | state | task |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 1  | 🔥     | foo  |
  +------------------+---------+----+-------+------+
  | 2018-01-16 13:38 |         | 3  | 🔥     | buzz |
  +------------------+---------+----+-------+------+i
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/msroz/todo-cli-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Todo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/todo/blob/master/CODE_OF_CONDUCT.md).
