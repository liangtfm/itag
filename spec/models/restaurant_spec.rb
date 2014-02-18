require 'spec_helper'

describe Restaurant do
  context "when creating a restaurant listing" do
    it "validates the presence of name" do
      FactoryGirl.build(:restaurant, name: nil).should_not be_valid
    end

    it "validates the presence of street" do
      FactoryGirl.build(:restaurant, street: nil).should_not be_valid
    end

    it "validates the uniqueness of a location" do
      FactoryGirl.create(:restaurant).should be_valid
      FactoryGirl.build(:restaurant).should_not be_valid
    end

    it "doesn't require optional fields to be filled in for user creation" do
      FactoryGirl.build(:restaurant).should be_valid
    end
  end

  context "tagging restaurants" do
    it "shows a restaurants category when tagged" do
      rest = FactoryGirl.create(:restaurant)
      cat1 = FactoryGirl.create(:category)
      tag1 = FactoryGirl.create(:tag, restaurant_id: rest.id, category_id: cat1.id)

      expect(rest.categories.first).to eq(cat1)
    end

    it "allows a restaurant to have a tag" do
      rest = FactoryGirl.create(:restaurant)
      tag1 = FactoryGirl.create(:tag, restaurant_id: rest.id)

      expect(rest.tags.count).to eq(1)
    end

    it "allows a restaurant to have more than one tag" do
      rest = FactoryGirl.create(:restaurant)
      tag1 = FactoryGirl.create(:tag, restaurant_id: rest.id)
      tag2 = FactoryGirl.create(:tag, restaurant_id: rest.id, category_id: 2)

      expect(rest.tags.count).to eq(2)
    end
  end
end