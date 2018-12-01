require "rails_helper"

describe User, type: :model do

  describe 'Setting up model' do

    it 'checking email validation' do 
      should validate_presence_of(:email) 
    end

    it 'checking email on uniq' do
      should validate_uniqueness_of(:email)
    end

    it 'checking password validation' do
      should validate_presence_of(:password)
    end
    
    it "checking default role" do
      expect(User.new.role).to eq 'admin'
    end
  end
end