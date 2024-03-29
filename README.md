# README

## trakehner-db-new

# The Unofficial Trakehner Database


Lastest News
=======

**Mid August 2023**
The Heroku deployment is no longer functional due to sunsetting.

Removing from portfolio for now.  The original intent was to create examples of my work while I had no industry experience.  Now the I've 10 years experience, this project can simply be removed so as to stop displaying non-working projects in my overall CV.

As soon as I have the convenient time, I still want to pick this project back up, with updated Trakehner data, as I have 10 years to catch up with.  To that end, I am happy to report that the current master branch of trakehner-db-new works successfully on my local.

This is the LinkedIn entry:

Unofficial Trakehner Database
http://www.unofficialtrakehnerdatabase.com
A Ruby on Rails website designed to address the challenges facing the Trakehner horse enthusiast when researching various horse statistics with emphasis for Trakehner breeders.  This Rails 4 application uses Ruby, Rails, HTML, CSS, Javascript, jQuery, Twitter Bootstrap, PostgreSQL, authentication, authorization, and many gems to implement the various needed features.  

• Use of AWS for CNAME, DNS, and S3 hosting of the user uploadable horse images.
• Security concerns improved through use of Brakeman, keeping keys out of Github, and sanitizing user entered data before storage to database.
• Devise for authenitication. Pundit and Omniauth for authorization according to policies and roles.
• Gemnasium used to keep track of new gems.
• Added basic i18n support for German.
• Implemented tables using simple_form gem for simplicity and straightforwardness of page design.


**Mid June 2021**
The Unofficial Trakehner Database site has been restored, or rather, re-implemented.  

The data is from 2013 and is therefore stale.  In the coming month, I will investigate
taking a new snapshot of the ATA website to bring this site up to date.  The current
database uses Heroku's Hobby-dev level for data storage which is free.  However, the
maximum number of entries for this level of database is 10,000.  The UTDB site has
over 23,000 entries, so you can see the problem.  The next level of Heroku database
costs $9/month, which isn't terrible, but is a price I cannot currently pay.  Here is
hoping for a brighter future with the ability to upgrade as needed.  I plan to work
on scraping the ATA data into json files to prepare for this in the meantime.  

I also wonder what the interest level would be in my scraping the Trakehner Verband
site for data to add to this site.


**Early June 2021**
The Unofficial Trakehner Database site has been down for a while now.  I would like
to extend my apologies to those who use the site.  Technology continues to grow and
change, which in this case, took down the UTDB site when the hosting platform
advanced beyond the capabilities of the technologies used in the original creation
of the site.  The good news is that I am actively working again to bring back this
marvelous tool for all those who love and admire the Trakehner horse.  Please be
patient with me and know that I am committed to this project.


Project Idea
=======
To implement a website for the Trakehner horse enthusiast, with emphasis for Trakehner breeders.


Motivation
=======
Performing research on the bloodlines of various Trakehners can be
very tedious.  Almost none of the historical Trakehners have pages,
so most of the horses in a given pedigree have no links to further
information, just a name.  As a horse breeder, I want to easily look
up pertinent data (pedigree, performance records, photos, inspection
results, etc) for every ancestor and every descendant of any given
Trakehner horse.  I want this accessible on the web.  I want it fast
and easy.  I want it available for everyone to read.  I want only the
owner of a horse to be able to change/enter data.  It should not be
possible for a user to delete a horse entirely, this should probably
be an admin task to correct for gross mistakes or duplications.

This site is my solution to those problems.


Technical Details
=======

Uses Rails 5.2.6 and Ruby 2.5.1


Deployment
=======
This project has been deployed to Heroku and can be found here: http://trakehner-db-new.herokuapp.com.
Heroku also points to the custom domain http://www.unofficialtrakehnerdatabase.com.


Tasks and technical observations
=======
It appears that rails 5 no longer supports multiple foreign_keys.  This introduces a challenge of how to correctly associate a give horse with its sire (father) and dam (mother).  Looking around, I have found the 'ancestry' gem which looks like a way to solve this need.

Glad to see the devise gem is still maintained.  For now, I plan to remove authorization and re-implement it later.  I plan to comment out the small devise-related lines and delete the big devise-related blocks.  Re-implementation may or may not be needed.  The original concept for this site included the power to add, edit, and upload images.  It will be a future decision whether or not to allow this in the future.  It is worth noting that the UTDB is 8 years out of date, so either new horses/breeders/images will need to be addable or a new scraping of the ATA site data will need to occur.

- [x] Re-implement basic site
- [x] Re-add static pages
- [x] Re-add internationalization
- [x] Deploy new UTDB to production with note of explanation
- [x] Re-implement fonts
- [x] Remove or comment out all devise and auth-related code related to Horse model
- [x] Re-add model for Horses
- [x] Re-add controller for Horses
- [x] Re-add migrations for Horses
- [x] Confirm database functionality and implementation of the Horse migrations
- [x] Re-add Index Horses view
- [x] Re-add Show Horse view
- [x] Confirm functionality and fix issues for Index of Horses, with and without thumbnail
- [x] Confirm functionality and fix issues for Show Horse, without image(s)
- [x] Re-implement image uploader for Horses.  This is already done.  All images and thumbnails are stored in AWS S3.  When the json is imported into the database, the URLs for images and thumbnails are populated accordingly.    Here is an example thumbnails - https://unofficialtrakehnerdb.s3-us-west-2.amazonaws.com/uploads/horse/image/1001/thumbnail_Martini.jpg
- [x] Re-implement ATA logo on Show Horses page
- [x] Confirm functionality and fix issues for Show Horse, with image(s)
- [x] Remove or comment out all devise and auth-related code related to Breeder model
- [x] Re-add model for Breeders
- [x] Re-add controller for Breeders
- [x] Re-add migrations for Breeders
- [x] Confirm database functionality and implementation of the Breeder migrations
- [x] Re-add Index Breeders view
- [x] Re-add Show Breeder view
- [x] Confirm functionality of Breeder views (index, show)
- [x] Re-implement Horse tests
- [x] Re-implement Breeder tests
- [x] Re-implement population of database with horses and breeders from json
- [x] Re-implement pedigree
- [x] Import ATA approved stallions
- [x] Re-implement horse images
- [x] Import json data and ATA stallions on Heroku
- [x] Bug with progeny.  Probably due to the need for the ancestry gem to handle the multiple foreign key problem with the progeny of Horse.  See the json files for C and A for the stallion Almox Prints J.  Update: Good news.  Offspring/Progeny is working beautifully.  belongs_to automatically carries the association in the other direction, so a has_many for offspring within the horse model is not needed and has been removed.  The worrisome indicator I saw was only due to not having imported all the json files yet.
- [x] Import all json data on Heroku, letter by letter, trying to avoid maxing out the database inserts for the free level of database.  Over 23,000 inserts into database.  Heroku is not happy and will permit no others, but the site is stable without the need to change the DB (for now).
- [x] Re-implement home page with ATA approved stallion carousel
- [ ] Need to upgrade from Heroku's free Hobby-dev database to the $9/month Hobby-basic database.  This should be done when the updated horse json data scraping is performed on the ATA website.
- [ ] Re-scrape the ATA website to get the new horses.  Probably need to scrape all data, then the rake script will need to check both that the horse/breeder exists and also that any data for that horse/breeder has changed.  If data is unchanged, the save should not be made.  
- [ ] Re-implement ATA logo on home page
- [ ] Re-implement ATA logo on Index Horses page
- [ ] Improve i18n on Show Horse page (and "Home" button)
- [ ] There is a stallion, Absalon, who looks to be from Germany whose gender is "V".  Figure out the German translations for Stallion, Gelding, and Mare.  Examine data for FRG or ??? in the Breeder name and check gender for these horses, correcting as needed.  NEED TO DO THIS BEFORE POPULATING HEROKU!!!\
- [ ] Fix McGill vs Mcgill.  Consider upcasing.
- [ ] Add photo credit, see horse Ballzauber, https://unofficialtrakehnerdb.s3-us-west-2.amazonaws.com/ata_approved_stallions/BallzauberPhotoCredit.txt
- [ ] Fix location of language toggle.  Should be on far right.  Hmmm.  Fixed on Heroku (in production), with correct fonts which are all missing locally.  Priority on this is much lower as a result but should be looked into at some point.
- [ ] When a horse sire or dam is Unknown, the name 'Unknown' is not a link.  However, when a breeder name is 'Unknown', it is still displayed as a link, which then brings up every horse whose breeder is unknown. Change the 'Unknown' breeder name to no longer be displayed (or function) as a link.


Testing
=======

To run all tests except those in /test/system, type the following at the command line:
~~~~
  $ rake test
~~~~
Note: <code>rake test:all</code> was deprecated as of rails 4.2.

To run system tests:
~~~~
  $ rake test:system
~~~~

To run all tests including system tests:
~~~~
  $ rake test:system test
~~~~

To run a single test file, do this:
~~~~
  $ rake test TEST=test/controllers/home_page_test.rb
~~~~

If you get a message like this:
~~~~
  rake aborted!
  PG::ConnectionBad: could not connect to server: Connection refused
      Is the server running on host "localhost" (::1) and accepting
      TCP/IP connections on port 5432?
~~~~
your postgresql is probably not running.  This can be checked using:
~~~~
  $ pg_ctl -D /usr/local/var/postgres status
~~~~
To start postgresql, use a command like this:
~~~~
  $ pg_ctl -D /usr/local/var/postgres -l ~/postgres-server.log start
~~~~

Remember that in binding.pry, you can find where you are in the code with
`> show-source
`

Good advice on where to store the various different types of tests: https://guides.rubyonrails.org/testing.html#rails-sets-up-for-testing-from-the-word-go


Common runtime errors seen
=======
This one is caused by having no horses in the database.  Or possibly having horses, but none with an image.
~~~~
  Showing /Users/susan/Documents/myProjects/codefellows/trakehner-db/app/views/home/index.html.erb where line #17 raised:

  undefined method `image' for nil:NilClass
~~~~
Fix by running
~~~~
  $ rake db:seed
~~~~


Policy and roles plan - This is currently removed and still under consideration for the future.
=======

<pre>
Five roles:

    visitors to the site -  can look and search horses and breeders;
                            cannot see new h/b, edit h/b, delete h/b,
                            cannot see sign up anywhere.
                            sign up new users is only by email to me and
                            Nathaniel...this is the way the ATA does it.
    owners -    can see edit horses they own only (will eventually include
                  editing horse
                owner info)
                cannot see new h/b, edit breeder, delete h/b
    breeders -  can edit self
                cannot see new h/b, edit horse, edit breeders other than
                self cannot see delete horse/breeder, sign up
    ata -   can see edit horse and edit breeder
            cannot see new or delete h/b (we should reconsider this when
            the time comes)
    admin - me and Nathaniel
            can see all the things
</pre>



Database info
=======

~~~~
  $ psql postgres

  postgres=# create user postgres with password 'postgres';
  postgres=# alter user postgres with superuser;
  postgres-# \q

  $ rake db:create
  $ rake db:migrate

  $ dropdb db/trakehner_dev

~~~~


Thumbnails
=======
https://alvinalexander.com/mac-os-x/batch-thumbnails-images-photos-free-mac-osx/
