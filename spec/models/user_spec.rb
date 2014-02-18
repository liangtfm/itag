require 'spec_helper'

describe User do

  context "when creating a user" do
    it "validates the presence of username" do
      FactoryGirl.build(:user, username: nil).should_not be_valid
    end

    it "validates the presence of email" do
      FactoryGirl.build(:user, email: nil).should_not be_valid
    end

    it "validates the uniqueness of username and email" do
      FactoryGirl.create(:user).should be_valid
      FactoryGirl.build(:user).should_not be_valid
    end

    it "doesn't require optional fields to be filled in for user creation" do
      FactoryGirl.build(:user).should be_valid
    end
  end

  it "finds a user by credentials" do
    user = FactoryGirl.create(:user)
    User.find_by_credentials("ant", "123123").should eq(user)
  end

end
