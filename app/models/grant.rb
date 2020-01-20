class Grant < ApplicationRecord
  belongs_to :partner
  has_many :disbursements
  has_many :donations

  validates_presence_of :date, :amount_cents
  
  monetize :amount_cents

  def name
    "#{partner.name} #{date.year} HUMI Grant"
  end

  # is this needed?
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

  def donations_by_year_and_month(desired_year, desired_month)
    Donation.where('grant_id = ?', id).where('extract(year  from date) = ?', desired_year).where('extract(month from date) = ?', desired_month)
  end

  def disbursements_by_year_and_month(desired_year, desired_month)
    Disbursement.where('grant_id = ?', id).where('extract(year  from date) = ?', desired_year).where('extract(month from date) = ?', desired_month)
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
