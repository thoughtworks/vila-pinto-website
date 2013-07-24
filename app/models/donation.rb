# encoding: utf-8

class Donation
  include ActiveModel::Validations

  AMOUNT_OPTIONS = ['5', '25', '50']

  attr_accessor :amount_option, :custom_amount

  validates :amount_option, inclusion: { in: [AMOUNT_OPTIONS, 'custom'].flatten, message: 'Defina um valor para doar' }
  validates_presence_of :custom_amount, message: 'Defina um valor para doar', if: lambda { |d| d.custom_amount? }
  validates_numericality_of :custom_amount, allow_blank: true, message: 'Valor Inválido'

  def initialize(attrs = {})
    attrs.each do |key, value|
      send("#{key}=", value)
    end
  end

  def custom_amount?
    self.amount_option == 'custom'
  end

  def save
    valid?
  end

  def to_key
  end

  def checkout_payment_url
    payment = PagSeguro::Payment.new(
      ENV['PAGSEGURO_EMAIL'],
      ENV['PAGSEGURO_KEY'],
      id: SecureRandom.hex(10))
    payment.items = [
      PagSeguro::Item.new(
        id: 1,
        description: "Doacao para CEA Vila Pinto",
        amount: donation_amount,
        quantity: "1"
      )
    ]
    payment.checkout_payment_url
  end

  def donation_amount
    return amount_option unless amount_option == 'custom'
    custom_amount
  end
end
