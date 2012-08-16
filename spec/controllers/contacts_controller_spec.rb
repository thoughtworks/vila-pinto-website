require 'spec_helper'

describe ContactsController do

  describe '#new' do
    let(:contact) { mock_model(Contact) }

    before do
      Contact.should_receive(:new).and_return(contact)
      get :new
    end

    it { should respond_with(:success) }
    it { should assign_to(:contact).with(contact) }
    it { should render_template('new') }
  end

  describe '#create' do
    let(:empty_params) { { contact: {} } } 
    let(:good_params) { { contact: {
      name: 'name',
      email: 'valid@email.com',
      subject: 'subject',
      message: 'message'
    }}}

    context 'when input is valid' do
      let (:message) { double('Message', :deliver => true) }

      before do
        ContactMailer.should_receive(:make_contact).and_return(message)
        post :create, good_params
      end

      it { should respond_with(:redirect) }
      it { should set_the_flash }
      it { should redirect_to(root_path) }
    end

    context 'when input is invalid' do
      before do
        post :create, empty_params
      end

      it { should assign_to(:contact) }
      it { should render_template(:new) }
    end

  end

 end
