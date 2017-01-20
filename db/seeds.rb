# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

courtships = CourtshipPreference.create([{ name: 'Meet up for Dinner' },
                                         { name: 'Walk at the Park' },
                                         { name: 'Meet up for Lunch' },
                                         { name: 'Sight Seeing' },
                                         { name: 'Attend an event' },
                                         { name: 'Meet up for Dinner' },
                                         { name: 'Visiting parents/relatives' },
                                         { name: 'Road Trip' },
                                         { name: 'Doing Sports' }])