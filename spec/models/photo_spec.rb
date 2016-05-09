require 'rails_helper'

RSpec.describe Photo, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.build(:photo).save)
  end
end
