#USA Today Spatial Reimagining
## WDI-DC_Project2
###Note: Since this application was published, USA Today has changed their static assets and the structure of their *hidden* article JSON feature. As a result, this little proof of concept is in quite a bit of disarray. Please bear with us while we take the lesson (don't rely on the static assets of others) to heart and attempt to rebuild.

A repository to house work related to the second project for the Web Development Course at GA/DC

**Challenge:  Adding search by geolocation functionality to USA-Today website**

original proof of concept:  https://blooming-bayou-2574.herokuapp.com  (linked CSS no longer available)
updated proof of concept:  https://usatoday-spatialreimagining.herokuapp.com


##User Stories:  
###MVP - Map View of the Latest News

As a user, I can view a map with articles indicated on it by location.
As a user, I can view article briefs that are related to the area of the map shown.
As a user, I can select an article headline, and view the full article.
As a user, I can change the map area by zooming.
As a user, I want to see new articles as they are posted.


###Future Vision - Personal Map View of the News

As a user, I can filter the map of news by category.
As a user, I can search for news by key words including topic and location.
As a user, I can log in to USA today to view my saved articles and new news in my saved searches.
As a (logged in) user, I can save articles to read later.
As a (logged in) user, I can save search topics to re-run later, and add new articles in that topic to my personal news feed.
As a (logged in) user, I can view my personal news feed with saved articles and new news in my saved search topics.
As a user, I can create an account to log in with Facecbook, Google, or Email.
As a user, I can disable my account, if I desire.
As a user, I can see the number of articles for a location at country and regional views, and see articles individually on the map at the city view.


##Developer Information
###Technical Specs
* Ruby 2.2.0p0
* github repo:  https://github.com/mugshepherd/WDI-DC_Project2
* Figaro Gem (v 1.1.0) used to hide API keys
* Devise has been installed, but not currently used for authentication

###Installing instructions
* Developers will need to request API keys from USA-Today, or contact me directly for API keys used here.

####Github####
1. Fork or clone repo
2. `cd` into project directory
3. run `bundle install`
4. ensure /config/application.yml is listed in your /.gitignore file.
  *if it is not, add `/config/application.yml` to your /.gitignore file.  
5. Place API keys in /config/application.yml file in the relevant API variable name entry
6.  Set up your database
  1. `rake db:create`
  2. `rake db:migrate`
  *Users should not need to seed the database, but if necessary or desired, run `Article.get_news*(section=\'USA-Today news category\', count=[number of items])*.  Note that arguments in this command are optional.
7. Launch site by typing `rails s`

####Heroku####
After the site has been correctly configured in Rails, it can be deployed to Heroku via the following steps (taken primarily from [here](https://devcenter.heroku.com/articles/git#creating-a-heroku-remote)).
1. As noted on the link above, Git is the means for deploying via Heroku.
2. When site is properly configured and working above, commit repo via `git commit -m "*commit message*"`
3. Create a new application on Heroku via `heroku create`
4. push site to heroku via `git push heroku master` or '*git push heroku yourbranch:master*' if master is not branch being pushed.  
5. API codes are not included in git push commands.  Push API codes to Heroku via `figaro heroku:set -e production`.  Further details on the using figaro for deployment can be found [here](https://github.com/laserlemon/figaro).
6. run 'heroku run rake db:migrate' to set up database.  
7. Type 'heroku config' to ensure configuration on Heroku is what is expected.
8. Launch Heroku via 'heroku open'
