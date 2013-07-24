require 'spec_helper'

describe Donation do
  it { should ensure_inclusion_of(:amount_option).in_array([
    '5',
    '25',
    '50',
    'custom'
  ]) }

  it 'requires a custom value when amount option is custom' do
    donation = Donation.new(amount_option: 'custom')
    donation.should_not be_valid
    donation.errors[:custom_amount].should_not be_empty
  end

  it 'does not requires a custom value when amount option predefines it' do
    donation = Donation.new(amount_option: '5')
    donation.should be_valid
  end
end
