# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "r4z3ng4n@yahoo.co.id",
            password: "ch1d0r1r41k1r1",
            first_name: "Steven",
            last_name: "Natalius",
            personal_description: "A serious person, seriously up to do things both serious and unserious alike.",
            billing_first_name: "Stevie",
            billing_last_name: "Natalius",
            billing_street_address: "2103 State Highway 83 N",
            billing_city: "Dumas",
            billing_state: "AR",
            billing_zip_code: "71639-9626",
            credit_card_number: "1111111111111111",
            expiration_date: "02/29",
            cvv: "999",
            home_street_address: "40 N Eldorado St",
            home_city: "San Mateo",
            home_state: "CA",
            home_zip_code: "94401",
            house_description: "The house where I live is very big and beautiful. It has eight rooms; two bathrooms, three 
                                bedrooms, a dining room, a living room and a small kitchen. There is also a garden with a 
                                swimming pool. I usually swim there in the summer. In the dining room there is a large table
                                for the five of us. In the living room there are two sofas and a television. At nights my
                                father and I watch TV together. We both like football and quiz shows. I really like my house
                                because it’s cozy and clean.",
            searchable: true,
            price: "12",
            available_time: "01:40-06:30")

User.create(email: "sodapopinski@sodapop.pepsi.co.id",
            password: "v0DK!+-a",
            first_name: "Vodka",
            last_name: "Drunkenski",
            personal_description: "Champion of the USSR. Soviet/Russian. Loves soda pops.",
            billing_first_name: "Vodka",
            billing_last_name: "Drunkenski",
            billing_street_address: "2606 N 31st St",
            billing_city: "Boise",
            billing_state: "ID",
            billing_zip_code: "83703-5441",
            credit_card_number: "8593023748233829",
            expiration_date: "08/25",
            cvv: "734",
            home_street_address: "10343 Dawsons Crk Blvd",
            home_city: "Fort Wayne",
            home_state: "IN",
            home_zip_code: "46825-1906",
            house_description: "The house where I live is very big and beautiful. It has eight rooms; two bathrooms, three 
                                bedrooms, a dining room, a living room and a small kitchen. There is also a garden with a 
                                swimming pool. I usually swim there in the summer. In the dining room there is a large table 
                                for the five of us. In the living room there are two sofas and a television. At nights my 
                                father and I watch TV together. We both like football and quiz shows. I really like my house
                                because it’s cozy and clean.",
            searchable: true,
            price: "100",
            available_time: "02:45-08:20")

User.create(email: "buzz@toinfinityandbeyond.yahweh.co.id",
            password: "spacerangertotherescue",
            first_name: "Buzz",
            last_name: "Lightyear",
            personal_description: "To infinity and beyond!",
            billing_first_name: "Buzz",
            billing_last_name: "Lightyear",
            billing_street_address: "10343 Dawsons Crk Blvd",
            billing_city: "Fort Wayne",
            billing_state: "IN",
            billing_zip_code: "46825-1906",
            credit_card_number: "1010101010010101",
            expiration_date: "01/01",
            cvv: "111",
            home_street_address: "255 E Weber Ave",
            home_city: "Stockton",
            home_state: "CA",
            home_zip_code: "95202-2706",
            house_description: "From the outside this house looks cozy. It has been built with oak wood and has
                               white stone decorations. Tall, wide windows add to the overall look of the house 
                               and have been added to the house in a mostly asymmetric way. The house is equipped
                               with a small kitchen and three bathrooms, it also has a cozy living room, four bedrooms, 
                               a spacious dining room and a roomy garage. The building is square shaped. The house is 
                               fully surrounded by a garden path. The second floor is bigger than the first, which creates 
                               a stylish overhang on two sides of the house. This floor has a different style than the 
                               floor below.The roof is high and pyramid shaped and is covered with black roof tiles. 
                               Two small chimneys sit at either side of the house. Many smaller windows let in plenty 
                               of light to the rooms below the roof. The house itself is surrounded by a modest garden, 
                               with mostly grass and a few small trees.",
            searchable: true,
            price: "16",
            available_time: "10:30-12:45")

User.create(email: "judy@zootopia.com",
            password: "ITZDAPOLIZE",
            first_name: "Judy",
            last_name: "Hopps",
            personal_description: "Most honest cop you'll find in town.",
            billing_first_name: "Judy",
            billing_last_name: "Hopps",
            billing_street_address: "1415 Juniper St",
            billing_city: "Ontario",
            billing_state: "CA",
            billing_zip_code: "91762-5324",
            credit_card_number: "2345123467891234",
            expiration_date: "05/31",
            cvv: "420",
            home_street_address: "139 Elmwood Ave",
            home_city: "Burlington",
            home_state: "VT",
            home_zip_code: "05401-4394",
            house_description: "Rabbit's hideout. Just a simple apartment, away from all distractions.",
            searchable: true,
            price: "13",
            available_time: "13:40-20:20")

User.create(email: 'alejandro@gmail.com', 
            password: 'boondogle', 
            first_name: 'Alejandro', 
            last_name: 'Salazar', 
            personal_description: 'I am a dumb Colombian.', 
            billing_first_name: 'Alejandro', 
            billing_last_name: 'Salazar', 
            billing_street_address: '2700 Hearst Avenue', 
            billing_city: 'Berkeley', 
            billing_state: 'CA', 
            billing_zip_code: '94720', 
            credit_card_number: '1234123412341234', 
            expiration_date: '06/22', 
            cvv: '137', 
            home_street_address: '2520 Ridge Road', 
            home_city: 'Berkeley', 
            home_state: 'CA', 
            home_zip_code: '94709', 
            house_description: 'A beautiful college property, right in the heart of UC Berkeley, with access to a dirty pool.',
            searchable: true,
            price: "9",
            available_time: "20:01-21:00")
            
User.create(email: 'jared@gmail.com', 
            password: 'boondogle', 
            first_name: 'Jared', 
            last_name: 'Ryan', 
            personal_description: 'I am an American.', 
            billing_first_name: 'Jared', 
            billing_last_name: 'Ryan', 
            billing_street_address: '2350 Hearst Avenue', 
            billing_city: 'Berkeley', 
            billing_state: 'CA', 
            billing_zip_code: '94709', 
            credit_card_number: '4321432143214321', 
            expiration_date: '08/22', 
            cvv: '731', 
            home_street_address: '2368 Le Cont Avenue', 
            home_city: 'Berkeley', 
            home_state: 'CA', 
            home_zip_code: '94709', 
            house_description: 'The working Church.',
            searchable: true,
            price: "8",
            available_time: "00:00-00:01")
            
User.create(email: 'batman@gmail.com', 
            password: 'boondogle', 
            first_name: 'Bruce', 
            last_name: 'Wayne', 
            personal_description: 'I am the Batman.', 
            billing_first_name: 'Wayne', 
            billing_last_name: 'Wayne', 
            billing_street_address: '2520 Hearst Avenue', 
            billing_city: 'Berkeley', 
            billing_state: 'CA', 
            billing_zip_code: '94709', 
            credit_card_number: '2222222222222222', 
            expiration_date: '01/22', 
            cvv: '115', 
            home_street_address: '2151 Pedro Ave', 
            home_city: 'Milpitas', 
            home_state: 'CA', 
            home_zip_code: '95035', 
            house_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                laboris nisi ut aliquip ex ea commodo consequat.',
            searchable: true,
            price: "22",
            available_time: "08:15-22:50")
            
User.create(email: 'superman@gmail.com', 
            password: 'boondogle', 
            first_name: 'Clark', 
            last_name: 'Kent', 
            personal_description: 'I am Superman.', 
            billing_first_name: 'Clark', 
            billing_last_name: 'Kent', 
            billing_street_address: '2760 Hearst Avenue', 
            billing_city: 'Berkeley', 
            billing_state: 'CA', 
            billing_zip_code: '94709', 
            credit_card_number: '1122112211221122', 
            expiration_date: '05/22', 
            cvv: '125', 
            home_street_address: '18 Hallock Dr', 
            home_city: 'Washingtonvle', 
            home_state: 'NY', 
            home_zip_code: '10992', 
            house_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                laboris nisi ut aliquip ex ea commodo consequat.',
            searchable: true,
            price: "18",
            available_time: "09:34-09:59")
            
User.create(email: 'notwonderwoman@gmail.com', 
            password: 'boondogle', 
            first_name: 'Diane', 
            last_name: 'Amazon', 
            personal_description: 'I am not Womderwoman.', 
            billing_first_name: 'Diana', 
            billing_last_name: 'Amazon', 
            billing_street_address: '2760 Hearst Avenue', 
            billing_city: 'Berkeley', 
            billing_state: 'CA', 
            billing_zip_code: '94709', 
            credit_card_number: '1122112211221122', 
            expiration_date: '05/22', 
            cvv: '125', 
            home_street_address: '41a Kirkland Rd', 
            home_city: 'Silver City', 
            home_state: 'NM', 
            home_zip_code: '88061', 
            house_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                laboris nisi ut aliquip ex ea commodo consequat.',
            searchable: true,
            price: "20",
            available_time: "10:00-20:00")

random = Random.new(12345678)
User.all().each do |user|
    user.amenity_list = AmenityList.create(couch: random.rand > 0.5, tv: random.rand > 0.5, wifi: random.rand > 0.5)
    path = Rails.root.join('app', 'assets', 'images', 'user_images', user.email)
    Dir.mkdir path unless File.exists? path
end
