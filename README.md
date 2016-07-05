# README

## Installation

This application was created using Ruby version 2.3.1 and Rails 5.0.0 using RVM to manage the Ruby and Gems needed to generate a Rails application.

1. Install RVM if you don't already have it installed.

  details can be located here if you don't have it installed: https://rvm.io

  The quick and dirty way is to run this in your terminal (of choice):

  `curl -sSL https://get.rvm.io | bash -s stable`

2. Install Ruby 2.3.1

  `rvm install ruby-2.3.1`

  Make sure you are switched to using this version of Ruby also:

  `ruby -v` should output something like this: `ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]`

  If you are not using the correct version of Ruby just insalled:

  `rvm use ruby-2.3.1`

  or optionally, create a new gemset:

  `rvm use ruby-2.3.1@rails-5.0.0 --create`

  Make sure bundler is installed:

  `gem install bundler`

3. Finally, clone the application, run Bundler and migrate the database:

  For example:

  `git clone https://github.com/ol/project.git ~/ol_project`

  `cd ~/ol_project`

  `bundle install`

  `rails db:migrate`

4. Seed the database:

  This will load the data file in `db/seeds.csv` (the original data file provided for the project) into the database.

  `rails db:seed`

## Rails version

`5.0.0`

## Ruby version

`2.3.1`

## System dependencies

Application was created using RVM and using the built in version of SQLite3 that comes with Mac OS X (El Captain 10.11).

## Database creation

`rails db:migrate`

## Database initialization

`rails db:seed`

## How to run the test suite

`rails test`

## Deployment instructions

There are no plans to deploy this project (yet). At least, as far as I know. :)
