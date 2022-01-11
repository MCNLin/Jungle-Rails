require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before do 
      @user = User.create(first_name: "Minnie", last_name: "Mouse", email: "m.mouse@disney.com", password: "mickey", password_confirmation: "mickey")
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "should have a valid first name" do
      @user.first_name = nil
      @user.valid? 
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have a valid last name" do
      @user.last_name = nil
      @user.valid? 
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have a valid email" do
      @user.email = nil
      @user.valid? 
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have a unique email" do
      @user2 = User.create(first_name: "Mickey", last_name: "House", email: "M.MOUSE@disney.com", password: "mickey", password_confirmation: "mickey") 
      @user2.valid? 
      expect(@user2.errors.full_messages).to_not be_empty
    end

    it "should have an inputted password" do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid? 
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should match password with password confirmation" do
      @user.password_confirmation = "micckkeeyy"
      @user.valid? 
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have at least 5 characters in the password" do
      @user.password = "haha"
      @user.password_confirmation = "haha"
      @user.valid? 
      expect(@user.errors.full_messages).to_not be_empty
    end

  end

end

