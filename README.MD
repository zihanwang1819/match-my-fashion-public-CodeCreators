# FASHIONXT

### DEMO
https://fashionnxt.herokuapp.com/


Click on the above link, and open the demo app. The Facebook login feature will not work, as a result of privacy reasons, I took down the app developers account for it.
Get Facebook Login to function:
1. Create Facebook developers acccount  [https://developers.facebook.com/](https://developers.facebook.com/)
2. Create a facebook login app 
3. Use the API key of Facebook app, in the source code. You can find the required details in the document.
4. Start serving Facebook login easily

### How to start a local server:

#### OSX

1. git clone the repository to your local machine  
    ```https://github.com/codecreators07/match-my-fashion-public-CodeCreators```
2. Once the files are downloaded, follow the standard procedure of installing ruby on rails. 
   Click [here](https://gorails.com/setup/ubuntu/17.10)
3. It is recommended to use ```rvm``` over ```rbenv```. 
4. Once Ruby on Rails is installed, you have to install the dependencies available in gem file. 
   Important to note that the dependencies and other rail commands will only work, when installed rails version and ruby version matches the versions mentioned in Gemfile.
5. To ensure same versions are installed, open  Gemfile, and check ruby version. Do the following:
   
   ```rvm install 2.4.1```
   
   ```rvm use 2.4.1```   

6. Install the bundler
    
    ```gem install bundler```
7. Bundle install to install all the dependencies in Gemfile
    ```bundle install```
8. Start the rails server
    ```rails server```  
9. The local server will start on the following link
    
    [http://localhost:3000](http://localhost:3000)

If there is any problem about pg database. Try the steps below:

1. Install postgres

    ```brew update```

    ```brew install postgres```

2. open another terminal to run PG server

    ```postgres -D /usr/local/var/postgres```

3. Open PG console (Open one more terminal to run the code below)

    ```psql postgres```

4. Create admin user (more details in /config/database.yml)

    ```create user beaverthing;```

    ```create password beaverthing;```

type in password(ubuntu) twice

5. Create database follow the previous team’s setting

    ```create database workspace_development;```
    
    ```create database workspace_test;```

    ```create database workspace_production;```

PG console setting completed. You can close the console here.

6. Generate table with database

    ```bin/rails db:migrate RAILS_ENV=development```

7. Start the rails server

    ```rails server``` 

8. The local server will start on the following link

    [http://localhost:3000](http://localhost:3000)

#### Cloud9 (Ubuntu Server 18.04 LTS) 

##### Development

1. Git clone this repository to your local machine. (Make sure you set your SSH key correctly.)

    ```git clone git@github.com:zihanwang1819/match-my-fashion-public-CodeCreators.git```
2. To ensure same versions are installed, open  Gemfile, and check ruby version. Do the following:
   
   ```bash
   curl -ksSL https://get.rvm.io | bash -s -- --branch master
   rvm install 3.0.2
   ```
   
   ```rvm use 3.0.2```   
3. Install the bundler
    
    ```gem install bundler```
4. Before running bundle install, we need to solve dependencies and configurate bundle build
    ```bash
    sudo apt update
    sudo apt install -y libpq-dev libcurl4-openssl-dev libv8-dev libxml2-dev
    bundle config build.libv8 --with-system-v8
    gem uninstall libv8  # if you preinstall some unmatched libv8 gems
    gem install therubyracer -v '0.12.3'
    ```
5. Bundle install to install all the dependencies in Gemfile

    ```bundle install```

6. Before starting the server, we have to run the PostgreSQL (pg). Here are some steps that you need to follow.
* Install PostgreSQL:
    ```bash
    sudo apt install -y postgresql postgresql-contrib
    ```
* According to the database configuration file: (./config/database.yml), we enter the PostgreSQL with the default user postgres
to create corresponding users and databases.
    ```bash
    sudo -u postgres psql
    (below lines are in PostgreSQL console:)
    create user beaverthing;
    alter user beaverthing password 'ubuntu';
    ALTER USER beaverthing CREATEDB;
    create database workspace_production;
    \q # to exit the console
    ```
* create database

    ```rake db:create```

* Migrate database:

    ```rails db:migrate RAILS_ENV=development```
    
7. Set credentials:
    Credentials are stored safely in `config/credentials.yml.enc`. To edit it, we need to save the private key (obtained outside the GitHub)
into a file `config/master.key` (Add this file path to .gitignore. DO NOT PUSH IT TO GitHub REPO!!!). Then type:
    
    ```EDITOR="vim" rails credentials:edit```

to edit the `credentials.yml.enc` where you can manage your secrets.

To use the credentials, please code `Rails.application.credentials.SECRET_NAME`.

Actually, `credentials.yml.enc` is the root of credentials configuration. We can set credentials for different running environments
separately by typing `EDITOR="vim" rails credentials:edit --environment [development/test/production]`, which will create 
`config/credentials/[development/test/production].yml.enc` with their corresponding keys (of course, requiring more keys sharing). For simplicity, we
only use the master credential file to store secrets currently.

8. Start the rails server

    ```rails s -p $PORT -b $IP```  
    
9. The puma app server will start, please click the Preview on the upper menu (nearby Run), then click "Preview Running Application". Copy the
link in pop-up pane's address field to open it in a browser.

##### **Local** production deployment

1. ```rails db:migrate RAILS_ENV=production```
2. Comment out the production's username and password in `config/database.yml`
3. ```RAILS_ENV=production rails s -p $PORT -b $IP```

##### Heroku deployment

1. Uncomment production's username and password in `config/database.yml`
2. Refer to the Microsoft Word document.
    


### Using AWS S3 as Image Backend

If you wish to use the S3 image backend (allowing images to be saved for more than 2 days), you will need to create an S3 bucket(AWS_BUCKET). You will then need to set AWS_BUCKET, AWS_SECRET_KEY ,  AWS_ACCESS_KEY and AWS_REGION so that Rails can find that bucket. For local environments: 
    ```AWS_SECRET_KEY=x AWS_ACCESS_KEY=y rails server```  where ```x``` and ```y``` are replaced by your account details from Amazon Web Services

For deployed Heroku environments: (assuming the site is already deployed)

```heroku config:set AWS_SECRET_KEY=x``` and then ```heroku config:set AWS_ACCESS_KEY=y```
   
### Geocoding

For searching by location, a Google Geocoding API key will be required. This must be set as an environment variable (see Using AWS S3... above) with the name "GOOGLE_KEY".

Once this key is set, it is necessary to run "rake geocode:all CLASS=GeneralInfo" to populate the gecoded fields. For Heroku environments, prepend the previous command with "heroku run".
    
### What will you see on the web app?

1. Home page
2. Login/Signup, Search
3. My Profile
5. Admin user has been added, with privilege for using the admin APIs. This is only available to the single admin user, added by the developer. Contact admin for help

### To get started

1. Click on sign up and create your profile in 3 quick steps.
2. Once your profile is created, you will be shown logged in to the account
3. Click on my profile page, to see your profile information.
4. If you want to edit your profile, you can click on the three main links available on edit profile page
5. If you want to search other users, you click on search button on top of the page.
6. Personal information like phone number, email id is displayed on everyone's profile page to connect with others.

### How does search feature work:

Contains- Matches any data which contains the searched word
1. Starts With- Matches any data which starts with the searched word 
2. Ends With- Matches any data which ends with the searched word
3. Exactly Matches- Matches any data that exactly matches the searched word
4.  Improved search criteria: Added email id in the search criteria. Email id is also regular expression based

### Notes:
    
1. You can always choose to keep the default value of contains in the regular expression-based search, which guarantees the best possible results without any hassle of choosing a regular expression.
2. You can keep all the search fields blank for the search, and in that case, the page displays all the possible search results. Simply put, all the fields in the search are totally optional and any combination of search parameters can be utilized to improve the search results.
3.  States and Country available in Search Page
4.  Earlier search parameters didn’t include the country and didn’t make states available for user. Now I have included the country parameter in the search form, and included the states as a select option in the drop-down list. Now the search will support country-based search as well.
