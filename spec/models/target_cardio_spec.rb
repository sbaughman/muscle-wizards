require 'rails_helper'

RSpec.describe TargetCardio, :type => :model do

  it "should have a valid factory" do
    expect(FactoryGirl.build(:target_cardio).save)
  end

end
