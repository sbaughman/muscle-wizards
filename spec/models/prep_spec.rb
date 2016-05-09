require 'rails_helper'

RSpec.describe Prep, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.build(:prep).save)
  end
end
