# README

## trakehner-db-new

# The Unofficial Trakehner Database


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

Uses Rails 5.2.5 and Ruby 2.5.1


Deployment
=======
This project has been deployed to Heroku and can be found here: http://trakehner-db.herokuapp.com.
Heroku also points to the custom domain http://www.unofficialtrakehnerdatabase.com.


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


Common runtime errors seen
=======
This one is caused by having no horses in the database.
~~~~
  Showing /Users/susan/Documents/myProjects/codefellows/trakehner-db/app/views/home/index.html.erb where line #17 raised:

  undefined method `image_url' for nil:NilClass
~~~~
Fix by running
~~~~
  $ rake db:seed
~~~~
