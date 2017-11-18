require 'simplecov'
SimpleCov.start 'rails'
require 'rails_helper'
require 'spec_helper'

describe UsersController, type: :controller do
    before :each do
        @user = FactoryGirl.create(:user)
    end
    describe 'DELETE #destroy' do
        context "success" do
            it "deletes the user" do
                login(@user)
                expect{ 
                    delete :destroy, :id => @user, :user => {:password => @user.password}
                }.to change(User, :count).by(-1)
            end
        end
    end
end