require 'spec_helper'

describe Review do
  context "when creating a review" do

    it "validates the presence of title" do
      FactoryGirl.build(:review, title: nil).should_not be_valid
    end

    it "validates the presence of body" do
      FactoryGirl.build(:review, body: nil).should_not be_valid
    end

    it "validates the presence of rating" do
      FactoryGirl.build(:review, rating: nil).should_not be_valid
    end

    it "only lets a user write one review for a listing" do
      FactoryGirl.create(:review).should be_valid
      FactoryGirl.build(:review).should_not be_valid
    end

  end
end
