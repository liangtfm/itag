require 'spec_helper'

describe Tag do
  context "when creating a tag" do
    it "validates the presence of restaurant_id" do
      FactoryGirl.build(:tag, restaurant_id: nil).should_not be_valid
    end

    it "validates the presence of category_id" do
      FactoryGirl.build(:tag, category_id: nil).should_not be_valid
    end

    it "validates the uniqueness of a tag" do
      FactoryGirl.create(:tag).should be_valid
      FactoryGirl.build(:tag).should_not be_valid
    end
  end
end
