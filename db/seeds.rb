# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
super_admin=User.create({:first_name=>"super", :last_name=>"admin", :email=>"admin@admin.com", :password=>"11111111", :admin=>"true"})
testAdmin1 = User.create({:first_name=>"test", :last_name=>"admin", :email=>"test@admin.com", :password=>"11111111", :admin=>"true"})
testAdmin2 = User.create({:first_name=>"test", :last_name=>"admin", :email=>"test1@admin.com", :password=>"11111111", :admin=>"true"})
testAdmin3 = User.create({:first_name=>"test", :last_name=>"admin", :email=>"test2@admin.com", :password=>"11111111", :admin=>"true"})
testUser1 = User.create({:first_name=>"test", :last_name=>"user", :email=>"test@user.com", :password=>"11111111"})
testUser2 = User.create({:first_name=>"test", :last_name=>"user", :email=>"test1@user.com", :password=>"11111111"})
testUser3 = User.create({:first_name=>"test", :last_name=>"user", :email=>"test2@user.com", :password=>"11111111"})