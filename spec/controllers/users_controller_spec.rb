require 'rails_helper'
require 'spec_helper'

describe UsersController do
	before(:each) do
        @parameters = {
            email: "sodapop@pepsi.com",
            password: "v0DK!+-a",
            first_name: "Vodka",
            last_name: "Drunkenski",
            personal_description: "Champion of the USSR. Soviet/Russian. Loves soda pops.",
		}
		@bill_params = {
		    billing_first_name: "Vodka",
            billing_last_name: "Drunkenski",
            billing_street_address: "2606 N 31st St",
            billing_city: "Boise",
            billing_state: "ID",
            billing_zip_code: "83703-5441",
            credit_card_number: "8593023748233829",
            expiration_date: "08/25",
            cvv: "734"
		}
		@host_params = {
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
            price: "100"
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
            price: "16")
	end
	describe 'Create new' do 
		it 'goes to the new user page' do
			get :new
			expect(response).to render_template(:new)
		end
		it 'creating a new profile creates that user in the database' do
			post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			expect(@user.first_name).to eq("Vodka")
			expect(@user.last_name).to eq("Drunkenski")
		end
		it 'creating a new profile takes you to billing info page' do
			post :create, :user => @parameters
			expect(response).to redirect_to(new_user_billing_path)
			expect(flash[:notice]).to eq("sodapop@pepsi.com was successfully created.")
		end
		it 'creating a new profile assigns @user to that profile' do
			post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			expect(assigns(:user)).to eq(@user)
		end
		it 'creating a new profile improperly refreshes the page' do
		    @parameters[:password] = "1234"
			post :create, :user => @parameters
			expect(response).to redirect_to(new_user_path)
			expect(flash[:notice]).not_to eq("sodapop@pepsi.com was successfully created.")
		end
		it 'creating a new profile creates that user in the database' do
			post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			expect(@user.first_name).to eq("Vodka")
			expect(@user.last_name).to eq("Drunkenski")
		end
		it 'adding billing info takes you to host info page' do
		    post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			patch :update_billing, :id => @user.id , :user => @bill_params
			expect(response).to redirect_to(new_user_host_path)
			expect(flash[:notice]).to eq("Your account has been updated.")
		end
		it 'adding billing info and continuing on assigns @user to current user' do
			post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			patch :update_billing, :id => @user.id , :user => @bill_params
			@updated_user = User.find_by(:email => "sodapop@pepsi.com")
			expect(assigns(:user)).to eq(@updated_user)
		end
		it 'adding billing info updates that info of the user' do
		    post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			patch :update_billing, :id => @user.id , :user => @bill_params
			@updated_user = User.find_by(:email => "sodapop@pepsi.com")
			expect(@updated_user.billing_first_name).to eq("Vodka")
			expect(@updated_user.billing_last_name).to eq("Drunkenski")
		end
 		it 'submitting all info takes you to the new user page' do
            post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			patch :update_host, :id => @user.id , :user => @host_params
			expect(response).to redirect_to(root_path)
			expect(flash[:notice]).to eq("Your account has been updated.")
 		end
 		it 'submitting all info updates that info of the user' do
            post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			patch :update_host, :id => @user.id , :user => @host_params
			@updated_user = User.find_by(:email => "sodapop@pepsi.com")
			expect(@updated_user.home_city).to eq("Fort Wayne")
			expect(@updated_user.home_state).to eq("IN")
		end
		it 'submitting nil images does not change profile pictures' do
			post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			put :update, :id => @user.id , :user => @host_params
			@updated_user = User.find_by(:email => "sodapop@pepsi.com")
			expect(!File.exists?(Rails.root.join('app', 'assets', 'images', 'user_images', @updated_user.email, "")))
		end
		it 'submitting nil images does not change profile pictures' do
			post :create, :user => @parameters
			@user = User.find_by(:email => "sodapop@pepsi.com")
			put :update, :id => @user.id
			@updated_user = User.find_by(:email => "sodapop@pepsi.com")
			expect(!File.exists?(Rails.root.join('app', 'assets', 'images', 'user_images', @updated_user.email, "")))
		end
	end
	describe 'Edit user' do
		it 'Sets the user' do
			@user = User.find_by(:email => "buzz@toinfinityandbeyond.yahweh.co.id")
			session[:user_id] = @user.id
			get :edit
			expect(assigns(:user)).to eq(@user)
		end
	end
	describe 'New billing' do
		it 'Sets the user' do
			@user = User.find_by(:email => "buzz@toinfinityandbeyond.yahweh.co.id")
			session[:user_id] = @user.id
			get :new_billing
			expect(assigns(:user)).to eq(@user)
		end
	end
	describe 'New host' do
		it 'Sets the user' do
			@user = User.find_by(:email => "buzz@toinfinityandbeyond.yahweh.co.id")
			session[:user_id] = @user.id
			get :new_host
			expect(assigns(:user)).to eq(@user)
		end
	end
	describe 'Show user' do
		it 'sets the user and the current user' do
			@user = User.find_by(:email => "buzz@toinfinityandbeyond.yahweh.co.id")
			@current_user = @user
			session[:user_id] = @user.id
			get :show, :id => @user.id
			expect(assigns(:user)).to eq(@user)
			expect(assigns(:current_user)).to eq(@current_user)
		end
	end
end


