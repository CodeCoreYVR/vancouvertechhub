# README

## Google Custom Search Setup

**Signing Up as a New User**

- Enter in the new users first name, last name, email, password, and password confirmation

- A user verification email will be sent to the new users email

- Once the user has been verified, they can continue onto the site signed in

- User will be redirected to home page

**Signing In**

- Enter existing user email and password

- Will be redirected to the sites home page

**Creating an Organization**

- Enter the Organization name, address, description, employee count, tech count, a link for website and twitter account

- Able to upload image files for your organization


**Setting up Google API key**

https://console.developers.google.com/project
- Go to Google Projects, Create a project, ie. VancouverTechHub

- After project has been created, in the upper left hamburger next to Google APIs, select API Manager (console.developers.google.com/apis ), then to go Credential tags,

- Click create credentials API key->API key->Server key
Click on your created project, and look for API key under Server API key section

- Copy the API key into config/initializers/app_keys.rb: ENV["GOOGLE_API_KEY"]    = "<PUT YOUR GOOGLE API KEY HERE>"

**Setting up custom search engine ID**

https://cse.google.com


- Click on Create a custom search engine

- Leave Sites to search blank

- Give a name of the search engine, ie. VancouverTechHub Custom Search

- Under Advanced Options, Restrict Pages using Schema.org types, type in NewsArticle.  Click Create

- Click on Modify your search engine, Control Panel.  Under Basic->Details, click on Search engine ID.  

- Copy the search engine ID into config/initializers/app_keys.rb: ENV["GOOGLE_SEARCH_CX"]="<PUT YOUR SEARCH ENGINE ID>"
