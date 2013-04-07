#SRobo League scorer

It's a ruby project. `bundle install` for depends (only needed if you want to
run the tests). Run the tests with `bundle exec rspec`. Tested on ruby 2.0.0.

##Examples:

```
$ ruby src/srobo_league_points.rb psc 8 clf 9 hrs 30 bees 40
{"bees":4.0,"hrs":3.0,"clf":2.0,"psc":1.0}
$ ruby src/srobo_league_points.rb psc 8 clf 9 hrs 30 bees 30
{"bees":3.5,"hrs":3.5,"clf":2.0,"psc":1.0}
$ ruby src/srobo_league_points.rb psc 8
you probably got the arguments wrong, they are [team1] [score1] [team2] [score2] and so on for exactly 4 teams
```

The output is JSON for you to parse
