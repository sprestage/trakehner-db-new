# README

## trakehner-db-new

# The Unofficial Trakehner Database


Lastest News
=======
**June 2021**
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
- [ ] Implement ancestry gem for Horses
- [ ] Re-implement ATA logo on home page
- [ ] Re-implement ATA logo on Index Horses page


Policy and roles plan
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


Testing
=======

To run the tests, type the following at the command line:
~~~~
  $ rake test
~~~~
Note: <code>rake test:all</code> was deprecated as of rails 4.2.

To run a single test file, do this:
~~~~
  $ rake test test/features/admin/admin_test.rb
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
