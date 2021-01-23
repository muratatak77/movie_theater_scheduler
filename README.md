# leeetcode
Solution Leetcode Easy
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	2.6.4


* Configuration
	 - When you enter the movie_theater_scheduler application main path, this .ruby_gemset and .ruby-version will start to generate whatever you need to run this application. You can follow the coming instructions.

	if you need step by step configuration

		After git clone project you need 

		1- Gemset create and use:

			rvm use 2.6.4@movie_theater_scheduler --create

			when you run : 
				rvm gemset list

			you should see your brach:

				gemsets for ruby-2.6.4 (found in /Users/muratatak/.rvm/gems/ruby-2.6.4)
				   (default)
				=> movie_theater_scheduler

		2- Rails Installiation

			gem install rails  --no-document


		After 'git clone project' than you will need:

		4- Enter the application main path:

			bundle install


		5- Run program

			rspec spec/requests


* Database creation
	 - None
* Database initialization
	- None
* How to run the test suite
	
	- I used rspec gem. 
	- If you want different test, you should change this json file : 'spec/input.json'
	- My input file is the input.json file.

	- And we can go to the application path and we can run by from the console: 		
		
		  rspec spec/requests


* Services (job queues, cache servers, search engines, etc.)
	- None
* Deployment instructions
	- None
* ...