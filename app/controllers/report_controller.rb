class ReportController < ApplicationController

  def index
    render plain: json_report.to_s
  end

  private

  def json_report
    year = start_year
    month = start_month
    index = 0
    result = {donations: {}, disbursements: {}}

    until(year >= end_year && month > end_month)
      result[:donations][index] = []
      result[:disbursements][index] = []

      grant.donations_by_year_and_month(year, month).each do |donation|
        record = {}
        record[:year] = year
        record[:month] = month
        record[:date] = donation.date.strftime("%m/%d/%Y")
        record[:donor] = donation.donor
        record[:amount] = donation.amount.format
        result[:donations][index] << record
      end

      grant.disbursements_by_year_and_month(year, month).each do |disbursement|
        record = {}
        record[:year] = year
        record[:month] = month
        record[:date] = disbursement.date.strftime("%m/%d/%Y")
        record[:name] = disbursement.name
        record[:landlord] = disbursement.landlord
        record[:number_children] = disbursement.number_children
        record[:move_in_amount] = disbursement.move_in_amount.format
        record[:prevention_amount] = disbursement.prevention_amount.format
        result[:disbursements][index] << record
      end

      month = month + 1
      index = index + 1
      if month > 12
        year = year + 1
        month = 1
      end

    end
    JSON.pretty_generate(result)
  end

  def start_year
    grant.date.year
  end
  
  def start_month
    grant.date.month
  end

  def end_year
    Time.now.year
  end

  def end_month
    Time.now.month
  end

  def grant 
    Grant.find(params['report']['grant_id'])
  end

end
