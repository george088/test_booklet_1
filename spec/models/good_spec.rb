require "rails_helper"

describe Good, type: :model do
  describe "associations" do
    it { should have_many(:days) }
  end 
end