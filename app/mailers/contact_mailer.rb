class ContactMailer < ActionMailer::Base
  default from: "sistema@ceavilapinto.org.br"
  default to: "contato@ceavilapinto.org.br"

  def make_contact(contact)
    @contact = contact
    mail(subject: contact.subject)
  end

end
