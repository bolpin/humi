class Grant < ApplicationRecord
  belongs_to :partner
  has_many :disbursements
  has_many :donations
  
  monetize :amount_cents

  def name
    "#{partner.name} #{date.year} HUMI Grant"
  end

  def scoped_user
    partner.user unless partner.user.admin?
  end

  def total_move_in_amount_formatted
    Money.new(move_in_total_cents, "USD").format
  end

  def total_prevention_amount_formatted
    Money.new(prevention_total_cents, "USD").format
  end

  def total_community_donations_formatted
    Money.new(donation_total_cents, "USD").format
  end

  def total_children_helped
    disbursements.reduce(0){|sum, d| sum + d.number_children }
  end
  
  private

  def move_in_total_cents
    disbursements.reduce(0){|sum, d| sum + d.move_in_amount_cents }
  end

  def prevention_total_cents
    disbursements.reduce(0){|sum, d| sum + d.prevention_amount_cents }
  end

  def donation_total_cents
    donations.reduce(0){|sum, d| sum + d.amount_cents }
  end
end
