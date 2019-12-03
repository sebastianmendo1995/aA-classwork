require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET#new" do
        it "render the new template" do
            get :new
            expect(response).to be_success
            expect(response).to render_template(:new)
        end
    end 
    describe "GET#show" do
        it "renders the show template and sets a @user variable for the User matching the params id" do
            User.create!(username: 'toby', password: 'anypaswword')
            get :show, id: 1
            expect(response).to render_template(:show)
        end
    end 
end

