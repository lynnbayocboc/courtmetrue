courtships = CourtshipPreference.create([{ name: 'Meet up for Dinner' },
                                         { name: 'Walk at the Park' },
                                         { name: 'Meet up for Lunch' },
                                         { name: 'Sight Seeing' },
                                         { name: 'Attend an event' },
                                         { name: 'Meet up for Dinner' },
                                         { name: 'Visiting parents/relatives' },
                                         { name: 'Road Trip' },
                                         { name: 'Doing Sports' }])

users = User.create([{ email: 'admin@gmail.com', password: 'password', password_confirmation: 'password', role: 'admin' },
                     { email: 'male@gmail.com', password: 'password', password_confirmation: 'password' },
                     { email: 'female@gmail.com', password: 'password', password_confirmation: 'password' }])
                     
profiles = Profile.create([{user_id: 1, gender: "male", name: "admin", age: "20", city: "manila"},
                           {user_id: 2, gender: "male", name: "male", age: "20", city: "manila"},
                           {user_id: 3, gender: "female", name: "female", age: "20", city: "manila"}])