require 'spec_helper'

describe DonationController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :locale => 'pt-BR'
      response.should be_success
    end
  end

end
