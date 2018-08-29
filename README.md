# Baseball Stats Application

Build a Baseball Statistics application.  This application can be built using any language or framework you prefer, but should be built as if you were going to deploy it for production use.

### Requirements:

* The application should import the provided players.csv and batting.csv files
* Create CRUD functionality for Players
* The “show" page for a Player should display their stats per season and full career (batting average and slugging %)
* Add a Leaderboard when the user can show leaders for batting average and slugging %.
    * Allow user to select by team, league, season or all-time
* Deploy a functioning version of application to a free Heroku instance and provide details on how to access the application.

### Setup Locally

* Run Redis: `redis-server /usr/local/etc/redis.conf`
* Run Resque: `QUEUE=* rake resque:work`
