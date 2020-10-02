# Railsbook

A Facebook clone project using Ruby on Rails.

## App Features

#### Homepage

Here users can either sign up to Railsbook or Login if they are already registered.

![Railsbook Homepage](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-Home.png?raw=true)

#### Post Feed Page

Here is a feed of posts from all users of Railsbook.

![Railsbook Post Feed 1](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-Post-Feed.png?raw=true)

![Railsbook Post Feed 2](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-Post-Feed-2.png?raw=true)

#### View Post Page

Here is a more detailed view of an individual post where users can see and make comments on posts.

![Railsbook View Post](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-View_Post.png?raw=true)

#### Viewing Likes

Users can see who has liked a post.

![Railsbook View Likes](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-View-Likes.png?raw=true)

#### Viewing Images Larger

Users can view images larger on screen.

![Railsbook View Images](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-View-Image.png?raw=true)

#### User Page

Here you can see all posts from an individual user, as well adding other users as friends and see who has been friended.

![Railsbook User Page](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-User-Page.png?raw=true)

#### Edit User Page

Here users can edit their accounts.

![Railsbook Edit User](https://github.com/kristycer/acebook/blob/master/app/assets/images/Railsbook-Edit-User.png?raw=true)

## Technology Stack

- Ruby on Rails
- PostgreSQL
- Bootstrap
- AWS
- RSpec
- Capybara

## Setting up Railsbook

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
