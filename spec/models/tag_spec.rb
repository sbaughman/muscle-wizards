require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it "is not valid without a name" do
    tag = Tag.new(name: nil)
    expect(tag).not_to be_valid
    puts "Tag name validation test passed!" unless tag.valid?
  end
end
