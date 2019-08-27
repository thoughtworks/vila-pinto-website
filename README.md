Vila Pinto Website
==================

This project is the website for Vila Pinto, one of the most needing areas in Porto Alegre/RS - Brazil.

They have a lot of initiatives to make their lives better and one of their ideas is the Recycling Center, that help a lot of families get money and also help the local community to fight against the drug dealers and social injustice.

You can see more information about Vila Pinto and the Recycling Center here:
http://www.youtube.com/watch?v=ejIlcZJd4cA


Instructions
============
There are two ways to configure the app. 

Docker
--------------------
```
docker build -t image-cea .
docker run -p 8080:3000 --rm -v $PWD:/app -it --name cea-website image-cea 
```

Ubuntu Instalation
------------------

1. Install git  
	`sudo apt-get install git`

2. Install RVM - Ruby Version Manager  
	`curl -L get.rvm.io | bash -s stable --auto`

	>ps: you might need to install curl: sudo apt-get install curl
	
3. Install Ruby with Readline support  
	`sudo rvm install 1.9.3 --with-readline-dir=/usr`

4. Download Vila Pinto Project  
	`git clone https://github.com/thoughtworks/vila-pinto-website.git`
	
5. Use ruby with gemset global and install bundler  
	`rvm gemset use global && gem install bundler`
	
6. Broke on postgresql problem  
	`sudo apt-get install libpq-dev`
	
	>ps: if any of the gems fails, run the command it suggests, like `gem install pg -v '0.14.1'`. If it fails, it will show which lib is missing, so do a `sudo apt-get install [MISSING LIB]`.

7. Install ImageMagick  
	`sudo apt-get install imagemagick`

8. Execute `bundle install` until no error is seeing. If necessary, install the missing libs and run `bundle install` again.

	>ps: if you get a error like _missing javascript runtime_, then run 
	`sudo apt-get install nodejs`
	
9. Change bootstrap permission to execute  
	`chmod +x bootstrap.sh`

10. Execute `bootstrap.sh`

11. Access Vila Pinto through: `http://localhost:3000`

Development
-----------

Fork the project

Install RVM

Clone the repo

Run `sh bootstrap.sh`

have fun!


PS: If you're not able to upload images from the administration section, make sure you set the environment variables GOOGLE_DRIVE_USER and GOOGLE_DRIVE_PASSWORD. We have a test account set, ask someone for the credentials!


LICENSE
=======

Vila Pinto Website
Copyright (C) 2012 Vila Pinto

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
