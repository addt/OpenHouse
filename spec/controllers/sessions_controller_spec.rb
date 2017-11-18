require 'rails_helper'
require 'spec_helper'

describe SessionsController do
    before(:each) do
        @login_data = {
            email: "buzz@toinfinityandbeyond.yahweh.co.id",
            password: "spacerangertotherescue"
        }
        
        @wrong_data = {
            email: "buzz@toinfinityandbeyond.yahweh.co.id",
            password: "spacerangertotheparty"
        }
        
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
            home_street_address: "2634 Virginia Street",
            home_city: "Berkeley",
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
            price: "16")
    end
    
    describe 'login page' do
        it 'goes to the log in page' do
			get :new
			expect(response).to render_template(:new)
		end
		it 'redirects to home page upon success' do
		    post :create, :session => @login_data
		    expect(response).to redirect_to root_path
		end
		it 'returns to login page upon failure' do
		    post :create, :session => @wrong_data
		    expect(response).to render_template(:new)
		end
		it 'shows an error message upon failure' do
		    post :create, :session => @wrong_data
		    expect(flash[:notice]).to eq('Invalid email/password combination')
		end
    end
    
    describe 'log-out' do
        it 'goes to the log out page' do
			get :destroy
			expect(response).to render_template(:destroy)
		end
    end
end
