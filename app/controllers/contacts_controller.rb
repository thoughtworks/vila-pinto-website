class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @contact.to = params[:to] if params[:to]
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.make_contact(@contact).deliver
      flash[:notice] = I18n.t('contact.notices.success')
      @contact = Contact.new
      render :action => 'new'
    else
      flash[:notice] = nil
      render :action => 'new'
    end
  end

  def controller_class
    if params[:to]
      @contact.to 
    else "cea"
    end
  end
end
