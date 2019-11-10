# 1. Setup
## Ruby & Bundler
To be able to run this project make sure you have installed a recent version of ruby and bunlder.
https://www.ruby-lang.org/en/
https://bundler.io
## Install dependencies 
To install required dependencies you just need to run `bundle install`
## Database server
We assumed that you will be using *PostgreSQL* as a database server, that is why we included by default PostgreSQL datamapper adapter.
In case you want to use another database server please check the [documentation of datamapper](https://datamapper.org/getting-started.html) and add the right adapter.

Make sure to update database connection path in the file `config/environment.rb`.

# 2. Run the project
To run this starter project, simply execute `rackup` in your console
## 3. Testing
To run tests simply execute `rspec`  