class ContactMailer < ActionMailer::Base
  default from: "sistema@ceavilapinto.org.br"

  RECIPIENTS = ['medeiroscea@yahoo.com.br', 'luizhenriquecea@gmail.com']

  default to: ""

  def make_contact(contact)
    @contact = contact
    mail(subject: contact.subject, to: RECIPIENTS)
  end
end
