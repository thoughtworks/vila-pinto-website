require "spec_helper"

describe ContactMailer do
  describe "make contact" do
    it "should render successfully" do
      contact = double(:email => 'contact@example.com', :name => 'contact', :subject => 'subject', :message => 'message', :to => 'target@example.com')

      expect { ContactMailer.make_contact(contact) }.
        to_not raise_error
    end
  end
end
