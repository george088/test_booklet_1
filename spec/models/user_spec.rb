require "rails_helper"

describe User, type: :model do

  describe 'Setting up model' do
    describe "validation email" do
      it { should validate_presence_of(:email) }
    end 

    describe "uniq email" do
      it { should validate_uniqueness_of(:email) }
    end

    describe "validation password" do
      it { should validate_presence_of(:password) }
    end
  end
end