# Python-no-thanks (aka Imgur clone)

Hello and welcome to **python-no-thanks**, an application we made during Netguru's Level Up Ruby on Rails Workshops in Warsaw.

### Description
Python-no-thanks is an image hosting web application that allows signed in users to upload images, which can be then seen by them (and other users, including guests) in the application's catalog of images and browsed through conviniently. Upon creation, images are assigned to one of the user's existing galleries or to a new gallery which is created along with the image. Galleries help storing together images that are somehow connected to each other. To help finding images and galleries, we introduced tags which are also assigned to them during their creation and we also provide a simple search engine that finds images by their titles. Users that are signed in can also upvote images which we then use to display the currently most popular tags. Pretty cool, huh?

Simply put: it's almost an [imgur](http://imgur.com/).

### Details
We use:
  - Ruby 2.2.0
  - Rails 4.2.0
  - PostgreSQL

And a bunch of cool gems:
  - [paperclip](https://github.com/thoughtbot/paperclip) and [paperclip-dropbox](https://github.com/janko-m/paperclip-dropbox)
  - [acts_as_votable](https://github.com/ryanto/acts_as_votable)
  - [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
  - [decent_exposure](https://github.com/hashrocket/decent_exposure)
  - [devise](https://github.com/plataformatec/devise)
  - [simple_form](https://github.com/plataformatec/simple_form)
  - and many more!

We test our application using RSpec with Factory Girl as a replacement for fixtures.

We style our views using SCSS and the Bootstrap 3 framework.

### Preview
You can see the app in action at https://python-no-thanks.herokuapp.com

### Setup
To run the application on your computer:

1. Get the source code: `git clone git@github.com:netguru-training/python-no-thanks`, and `bundle` it.

2. Copy the database config file (`cp config/database.sample.yml config/database.yml`), and customize it to work with your own database server.

3. You will also need to provide keys to your Dropbox account. First `cp config/application.sample.yml config/application.yml` and then fill it with the proper data.

4. Prepare the database for the application:
  - `rake db:setup` (to seed the database you will probably need ImageMagick)
  - `rake db:test:prepare` (if you want to run the tests)

5. Run `rails server` and...

6. ...visit http://localhost:3000. Easy enough, right?

### Seeds data
We provide you with a test user account, just to play around:
  - email: 'jan.kowalski@gmail.com'
  - password: '12345678'

### That's it!
Since we are just starting our adventure with Rails, we would love to hear your feedback! It really is invaluable when it comes to learning new thing, so feel free to contact us if you have any comments!

**Thank You!**