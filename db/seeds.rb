# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'admin@admin.com', password: '12345678', role: 'admin', name: 'Administrator', surname: 'First')
User.create(email: 'manager@manager.com', password: '12345678', role: 'manager', name: 'Manager', surname: 'First')
User.create(email: 'reader@reader.com', password: '12345678', role: 'reader', name: 'Reader', surname: 'First')