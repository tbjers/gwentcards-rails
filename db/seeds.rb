# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{ name: 'registered' }, { name: 'subscriber' }, { name: 'admin' }])
admin = User.new(email: 'torgny@gwentcards.com', password: 'password', password_confirmation: 'password')
admin.role ||= Role.where(name: 'admin').first
admin.save
