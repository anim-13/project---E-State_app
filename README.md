# Apna-Adda

It is an e-state web application designed using rails. In this application, a person can sell and buy mulitple properties online.

### Prerequisites

Install RVM Ruby Version Manager
Install and Configure Ruby
Install Nodejs and Yarn
Update RubyGem Package Manager
Install Ruby on Rails Latest Version
Install and Configure PostgreSQL Database

Below is the link is install all the following prerequisites
https://www.howtoforge.com/tutorial/ubuntu-ruby-on-rails/ 
  
### Installing

Below are the steps for the setup to run this application on your system:

1.Clone the code to your local system.
  https://github.com/anim-13/project---E-State_app.git

2.Navigate to directory by following command: 
  cd e-state (i.e. project-name)

3.Run command
  bundle install

4.Create a superuser in postgresql as described in the link above.

5.Update database.yml file. In the deafult section add following line:
  username: <postgres-username>
  password: <postgres-password>

6.Run the following commands to create and setup the database.
  bin/rails db:create
  bin/rails db:setup

7.Start the rails server by the following command:
  bin/rails server

8.Open your web browser and type following:
  http://localhost:3000
  
## Deployment

Deployed application on Heroku. Below is the link how to deploy rails appliaction on heroku.
https://www.codecademy.com/articles/deploy-rails-to-heroku

## Acknowledgments

Mentor - Ms. Kalpana Sharma
