class ContactMailer < ActionMailer::Base
  default from: "sistema@ceavilapinto.org.br"

  TOS = {
    'cea' => 'cea@ceavilapinto.org.br',
    'cejak' => 'cejak@ceavilapinto.org.br',
    'ctvp' => 'ctvp@ceavilapinto.org.br',
    'vovo' => 'vovo@ceavilapinto.org.br'
  }

  default to: ""

  def make_contact(contact)
    @contact = contact
    mail(subject: contact.subject, to: TOS[contact.to])
  end

end
