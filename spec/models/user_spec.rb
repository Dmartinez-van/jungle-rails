require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before :each do
      @user1 = User.create(
        name: 'dave',
        email: 'test33@test.com',
        password: 'wow123',
        password_confirmation: 'wow123',
      )
    end

    it 'should not be valid without valid fields' do
      expect(User.new).to_not be_valid
    end

    it 'should be valid with valid fields' do
      expect(@user1).to be_valid
    end

    it 'should not be valid if password and password_confirmation are not equal' do
      @user1.password_confirmation = 'notTheSame'
      
      expect(@user1).to_not be_valid
    end

    it 'should not be valid if email already exists in database' do
      user2 = User.create(
        name: 'Sally',
        email: 'TEST33@test.com',
        password: 'wow123',
        password_confirmation: 'wow123',
      )
      expect(@user1).to be_valid
      expect(user2).to_not be_valid
      p user2.errors.full_messages

    end

    it 'should not be valid if no name' do
      @user1.name = nil
      expect(@user1).to_not be_valid
    end

    it 'should not be valid if no email' do
      @user1.email = nil
      

      expect(@user1).to_not be_valid
    end

    it 'should not be valid if no password' do
      @user1.password = nil
      @user1.password_confirmation = nil

      expect(@user1).to_not be_valid
    end

    it 'should not be valid if password not greater than or equal to 6 characters' do
      @user1.password = '12345'
      @user1.password_confirmation = '12345'

      expect(@user1).to_not be_valid
    end

  end


  describe '.authenticate_with_credentials' do

    

  end

end
