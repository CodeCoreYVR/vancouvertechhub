# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(first_name: 'Frank', last_name: 'Liu',
              email: 'frankliu81@gmail.com', password: 'bu',
              password_confirmation: 'bu', activated: true, admin: true)

u2 = User.create(first_name: 'Frank2', last_name: 'Liu',
              email: 'frankliu82@gmail.com', password: 'bu',
              password_confirmation: 'bu', activated: true)

u3 = User.create(first_name: 'Denis', last_name: 'Trinh',
              email: 'denistrinh@gmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true, admin: true)

u4 = User.create(first_name: 'Denis2', last_name: 'Trinh',
              email: 'denistrinh2@gmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true)

u5 = User.create(first_name: 'Alex', last_name: 'Tang',
              email: 'hyperdemonster@gmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true, admin: true)

u6 = User.create(first_name: 'Alex2', last_name: 'Tang',
              email: 'hyperdemonster2@gmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true)

u7 = User.create(first_name: 'Todd', last_name: 'Cardoso',
              email: 'todd1cardoso@gmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true, admin: true)

u8 = User.create(first_name: 'Todd2', last_name: 'Cardoso',
              email: 'todd1cardoso2@gmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true)

u9 = User.create(first_name: 'Lucas', last_name: 'Cheung',
              email: 'lucas20229763@hotmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true, admin: true)

u10 = User.create(first_name: 'Lucas2', last_name: 'Cheung',
              email: 'lucas202297632@hotmail.com', password: 'Community',
              password_confirmation: 'Community', activated: true)

o1 = Organization.create(name: 'Hootsuite', address: '5 E 8th Ave, Vancouver, BC V5T 1R6, Canada', overview: 'Hootsuite is a social media management system for brand management created by Ryan Holmes in 2008. The system’s user interface takes the form of a dashboard, and supports social network integrations for Twitter, Facebook, LinkedIn, Google+, Foursquare, MySpace, WordPress, TrendSpottr and Mixi.', employee_count: 600, tech_team_size: 600, website: 'https://hootsuite.com', twitter: 'hootsuite', published: false)
