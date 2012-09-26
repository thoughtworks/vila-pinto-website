# encoding: utf-8
class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :message, :to

  validates_presence_of :name, :email, :subject, :message, :to
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_length_of :content, :maximum => 500

  INSTITUTIONS = {
    'CEA' => 'cea',
    'CTVP' => 'ctvp',
    'Cejak' => 'cejak',
    'Vovó Belinha' => 'vovo'
  }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def content
  end
end
