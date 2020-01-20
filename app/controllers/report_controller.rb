class ReportController < ApplicationController
  def index
    render plain: json_report.to_s
  end

  private

  def csv_report
    result = "month, year, move_in_amount, prevention_amount, name, landlord, number_children\n"
    year = start_year
    month = start_month
    index = 0

    until(year >= end_year && month > end_month) # Do we want to capture the current month?
      grant.disbursements_by_year_and_month(year, month).each do |disbursement|
        result << "#{index},#{year},#{month},#{disbursement.move_in_amount},#{disbursement.prevention_amount},#{disbursement.name},#{disbursement.landlord},#{disbursement.number_children}\n"
      end

      month = month + 1
      index = index + 1
      if month > 12
        year = year + 1
        month = 1
      end

    end
    result
  end

  def json_report
    year = start_year
    month = start_month
    index = 0
    result = Hash.new([])

    until(year >= end_year && month > end_month) # Do we want to capture the current month?
      result[index] = []
      
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
        result[index] << record
      end

      month = month + 1
      index = index + 1
      if month > 12
        year = year + 1
        month = 1
      end

    end
    result
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
    current_user.partner.default_grant
  end

end
