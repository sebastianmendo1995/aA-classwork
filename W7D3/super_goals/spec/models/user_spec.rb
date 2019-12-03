require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { FactoryBot.build(:user) } # .create or .build works here

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6).allow_nil }
  end

  describe "class methods" do
    describe "User::find_by_credentials" do
      it "should receive a username and password as parameters" do
        expect(User).to receive(:find_by_credentials)
        User.find_by_credentials("fakeuser", "fakepassword")
      end

      it "should find the user by their username and password" do
        FactoryBot.create(:user, username: "Toby", password: "testpassword")
        toby = User.find_by(username: "Toby")
        toby2 = User.find_by_credentials("Toby", "testpassword")
        expect(toby2).to eq(toby)
      end

    end
  end


end
