# README

Mappy is a simple app that allows you to search for an origin and destination location and it will provide you with the distance and travel time between those locations along with a dynamic map overview.

**Mappy Requirements:**

- Ruby 3.2.2
- Rails 7.0.5.1
- Bundler (`gem install bundler`)
- Postgres
- Redis
- Foreman (`gem install foreman`) to run all your processes

**Get Started:**

```
bundle install
rails db:create
rails db:migrate
rails db:seed
bin/dev
```

**Note on Debugging:**

Because of the use of foreman, an interactive debugger won't be possible in the same shell that you're running your rails server. To get around this you can do the following:

Ruby debugger should be installed by default with Rails 7. However, if it's not, you can add this to your Gemfile:

`gem "debug", platforms: %i[ mri mingw x64_mingw ]`

and run `bundle install`.

Add the following in `application.rb`

```ruby
require "rails/all"

if defined?(Rails::Server) && Rails.env.development?
  require "debug/open_nonstop"
end
```

Start your server e.g. `bin/dev` and open a new shell and run `bundle exec rdbg -a`

**Important Note**: in my experience at least, you must enter `c` to continue in this shell in order for it to actually pick up on debugging instances later

Now, to debug, all you have to do is add `debugger` on any line in your code and when it is hit you will be able to interact with it as normal in the second shell that you opened.
