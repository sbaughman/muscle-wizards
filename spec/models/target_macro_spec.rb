require 'rails_helper'

RSpec.describe TargetMacro, :type => :model do

  it "should have a valid factory" do
    expect(FactoryGirl.build(:target_macro).save)
  end

end
