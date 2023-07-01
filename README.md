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

Start your server e.g. `bin/dev` and open a new shell and run `bundle exec rdbg -a`

**Important Note**: in my experience at least, you must enter `c` to continue in this shell in order for it to actually pick up on debugging instances later

Now, to debug, all you have to do is add `debugger` on any line in your code and when it is hit you will be able to interact with it as normal in the second shell that you opened.

**Screenshots:**

Log-In:
<img width="1378" alt="Screenshot 2023-06-30 at 2 59 49 PM" src="https://github.com/eastoncaleb/mappy/assets/37001399/406fd46e-52a4-4fc3-8c40-dbe67d131201">

Search Index:
<img width="1664" alt="Screenshot 2023-06-30 at 3 00 05 PM" src="https://github.com/eastoncaleb/mappy/assets/37001399/ef262c00-1932-4831-b226-29a3af9178bf">

Search New:
<img width="1671" alt="Screenshot 2023-06-30 at 3 00 20 PM" src="https://github.com/eastoncaleb/mappy/assets/37001399/4987b313-ad25-4253-89f1-fc797e235df7">

Search Show:
<img width="1663" alt="Screenshot 2023-06-30 at 3 00 35 PM" src="https://github.com/eastoncaleb/mappy/assets/37001399/113c2996-9b0a-4f15-80fb-f8a47cf30ebb">





