class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.make_contact(@contact).deliver
      flash[:notice] = I18n.t('contact.notices.success')
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
