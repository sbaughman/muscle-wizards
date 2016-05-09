require 'rails_helper'

RSpec.describe Tagging, :type => :model do

  it "should have a valid factory" do
    expect(FactoryGirl.build(:tagging).save)
  end

end
