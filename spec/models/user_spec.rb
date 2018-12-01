require "rails_helper"

describe User, type: :model do

  describe 'Setting up model' do
    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:password) }

    it "check default role" do
    # User.new(email: 'admin@admin', password: 'sdf')
      expect(User.new.role).to eq "admin"
    end
  end

end