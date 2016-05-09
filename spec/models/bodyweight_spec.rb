require 'rails_helper'

RSpec.describe Bodyweight, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.build(:bodyweight).save)
  end
end
