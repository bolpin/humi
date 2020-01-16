module DonationsHelper
  def currency_amount(amount)
    number_to_currency(amount, precision: 2)
  end
end
