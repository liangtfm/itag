require 'spec_helper'

describe Category do
  context "when creating a category" do

    it "validates the presence of name" do
      FactoryGirl.build(:category, name: nil).should_not be_valid
    end

    it "validates the uniqueness of a category" do
      FactoryGirl.create(:category).should be_valid
      FactoryGirl.build(:category).should_not be_valid
    end

  end
end
