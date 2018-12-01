require "rails_helper"

describe Day, type: :model do
  describe "associations" do
    it { should belong_to (:good) }
  end 
end