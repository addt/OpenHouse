require 'rails_helper'
require 'spec_helper'

describe UsersController, type: :controller do
    before :each do
        @user = FactoryGirl.create(:user)
    end
    describe 'creating a user' do
        it 'does nothing' do
            expect(1).to equal(1)
        end
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