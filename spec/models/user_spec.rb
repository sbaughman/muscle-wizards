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


# describe OrderProcessor do
#   let(:transaction_id) { '1234' }
#   let(:order) { build_stubbed(:order) }
#   let(:credit_card) { build_stubbed(:credit_card) }
#
#   subject { OrderProcessor.new(order, credit_card) }
#
#   context 'when the Braintree result is valid' do
#     before do
#       MockBraintree.stub_successful_customer_sale(transaction_id: transaction_id)
#     end
#
#     it 'assigns the transaction id to the order' do
#       subject.process
#       order.transaction_id.should == transaction_id
#     end
#
#     it 'returns true for #process' do
#       subject.process.should be
#     end
#
#     it 'does not assign any errors to the credit card' do
#       subject.process
#       credit_card.errors.should be_empty
#     end
#   end
#
#   context 'when the Braintree result is invalid' do
#     before do
#       MockBraintree.stub_unsuccessful_customer_sale
#     end
#
#     it 'does not assign the transaction id to the order' do
#       subject.process
#       order.transaction_id.should be_nil
#     end
#
#     it 'returns false for #process' do
#       subject.process.should_not be
#     end
#
#     it 'assigns errors to the credit card' do
#       subject.process
#       credit_card.errors.should_not be_empty
#     end
#   end
# end
