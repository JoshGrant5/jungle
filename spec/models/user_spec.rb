require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new( 
    first_name: 'Bim', 
    last_name: 'Jenning', 
    email: 'testemail@test.ca', 
    password: 'password', 
    password_confirmation: 'password' 
  ) } 

  describe 'Validations' do
    context 'Field Validation' do 
      it 'is not valid if password field is blank' do 
        user.password = nil
        user.save
        expect(user).not_to be_valid
      end
      it 'is not valid if password confirmation field is blank' do 
        user.password_confirmation = nil
        user.save
        expect(user).not_to be_valid
      end
      it 'is not valid if first_name field is blank' do 
        user.first_name = nil
        user.save
        expect(user).not_to be_valid
      end
      it 'is not valid if last_name field is blank' do 
        user.last_name = nil
        user.save
        expect(user).not_to be_valid
      end
      it 'is not valid if email field is blank' do 
        user.email = nil
        user.save
        expect(user).not_to be_valid
      end
    end
  
    context 'Password Matches' do
      it 'saves when the password and password confirmation match' do 
        expect(user).to be_valid
      end
      it 'does not save when the password does not match the confirmation' do
        user.password_confirmation = 'test'
        user.save
        expect(user).not_to be_valid
      end
    end
  
    context 'Email is unique and not case-sensitive' do
      it 'does not save when non case-sensitive email match exists' do
        other_user = User.new(first_name: 'JJ', last_name: 'Bean', email: 'emailtest@test.ca', password: 'password', password_confirmation: 'password') 
        other_user.email = 'TESTemail@test.ca'
        user.save
        other_user.save
        expect(other_user).not_to be_valid
      end
    end
  
    context 'Password is mimumum 6 characters long' do
      it 'does not save when password is too short' do
        user.password = 'test'
        user.password_confirmation = 'test'
        user.save
        expect(user).not_to be_valid
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns a user instance for existing email and password' do
      user.save
      expect(User.authenticate_with_credentials(user.email, user.password)).to eq(user)
    end
    it 'returns null with invalid email or password' do
      user.save
      authentication = User.authenticate_with_credentials('test@email.com', user.password)
      expect(authentication).to eq(nil)
      authentication = User.authenticate_with_credentials(user.email, 'testytesttest')
      expect(authentication).to eq(nil)
    end
  end
  
end
