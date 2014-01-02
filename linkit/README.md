Linkit!
==============

Create a full blown reddit clone. 

The goal here is to work with a non-trivial rails app and object model:

* Use devise gem to handle authentication.
* Use twitter bootstrap to make your app look decent out of the box. 
* Use scaffolds to get started, but don't be afraid to manual adjust the code. 

## Completing the assignemnt
Follow the setup below. The codebase begins with part 1 complete. You are encouraged to start from scratch, but to jump start you, you may begin with the code as is here. Submit your work as a pull request against the master branch of this repo. 

You'll note that the instructions this time are less literal, and more of a guide to point you in the right direction. 

## Part 1

* Create the rails app

`rails new linkit`

* add twitter bootstrap gem (https://github.com/seyhunak/twitter-bootstrap-rails)

* Create the links scaffold

`bundle exec rails generate scaffold links url:string name:string`

* Style the scaffold links with the twitter boottrap generator

`bundle exec rails generate bootstrap:themed Links`

* add the devise gem (https://github.com/plataformatec/devise)

* style the links to use bootstrap

`bundle exec rails generate bootstrap:themed Links`

* Make the create links app available only to logged in users 

* add login log out links

* Add links to users. 

* Add user annotation to links

* add "my links" page. 

## Part 2
Implement integration tests for: 

* Login / Log out

* Creating a link 

* Trying to create a link, and have it prompt you to login first

* Create comment. 

* Up/Down vote a comment updates cumulative score. 

## Part 3

Implement the commenting/voting system.

* Any registered user can comment on any link.  (It's probably easiest to have comments on the link "show" page)
* Any registered user can vote up or down. 
* If a comment is up/downvoted, that effects the total cumulative score of the link. 
* Any user (logged in or out) can see any link, comment, or score. 

## Extra credit
* Have fun/get creative with the interface. 
* Build out more inegration/unit tests. 
* Build taggin system for links and/or comments.



