require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User validation checks" do

    it 'should not be valid without valid fields' do
      expect(User.new).to_not be_valid
    end

    it 'should be valid with valid fields' do
      @user1 = User.new
      @user1.name = 'dave'
      @user1.email = 'test@test.com'
      @user1.password = 'wow123'
      @user1.password_confirmation = 'wow123'
      
      expect(@user1).to be_valid
    end

    it 'should not be valid if password and password_confirmation are not equal' do
      @user1 = User.new
      @user1.name = 'dave'
      @user1.email = 'test@test.com'
      @user1.password = 'wow123'
      @user1.password_confirmation = 'notTheSame'
      
      expect(@user1).to_not be_valid
    end

    it 'should not be valid if email already exists in database' do
      @user1 = User.new
      @user1.name = 'dave'
      @user1.email = 'test@test.com'
      @user1.password = 'wow123'
      @user1.password_confirmation = 'wow123'

      @user2 = User.new
      @user1.name = 'bill'
      @user1.email = 'TEST@test.com'
      @user1.password = 'wow1234'
      @user1.password_confirmation = 'wow1234'
      
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
    end

    it 'should not be valid if no name' do
      @user1 = User.new
      @user1.name = nil
      @user1.email = 'test@test.com'
      @user1.password = 'wow123'
      @user1.password_confirmation = 'wow123'

      expect(@user1).to_not be_valid
    end

    it 'should not be valid if no email' do
      @user1 = User.new
      @user1.name = 'dave'
      @user1.email = nil
      @user1.password = '123456'
      @user1.password_confirmation = '123456'

      expect(@user1).to_not be_valid
    end

    it 'should not be valid if no password' do
      @user1 = User.new
      @user1.name = 'dave'
      @user1.email = 'test@test.com'
      @user1.password = nil
      @user1.password_confirmation = nil

      expect(@user1).to_not be_valid
    end

    it 'should not be valid if password not greater than or equal to 6 characters' do
      @user1 = User.new
      @user1.name = 'dave'
      @user1.email = 'test@test.com'
      @user1.password = '12345'
      @user1.password_confirmation = '12345'

      expect(@user1).to_not be_valid
    end

    it 'should be valid if password is greater than or equal to 6 characters' do
      @user1 = User.new
      @user1.name = 'dave'
      @user1.email = 'test@test.com'
      @user1.password = '123456'
      @user1.password_confirmation = '123456'

      expect(@user1).to be_valid
    end

  end
end
