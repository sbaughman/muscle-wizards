require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:example) do
    # let(:user) { FactoryGirl.build(:user) } # I want to understand what the difference is between this and what I'm using
    @user = FactoryGirl.build(:user)
  end

  it "is not valid without a name" do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it "is not valid without an email" do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it "is valid if name, email, age, and height are present, age and height are numbers, if email is unique and a valid format, and if password is present and has more than four unique characters" do
    expect(@user).to be_valid
  end
end
