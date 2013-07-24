class DonationController < ApplicationController
  def index
    @amount_options = Donation::AMOUNT_OPTIONS
    @donation = Donation.new
  end

  def create
    @amount_options = Donation::AMOUNT_OPTIONS
    @donation = Donation.new(params[:donation])
    if @donation.valid?
      redirect_to @donation.checkout_payment_url
    else
      render :index
    end
  end

  def controller_class
    'cea'
  end
end
