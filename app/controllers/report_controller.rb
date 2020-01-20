class ReportController < ApplicationController
  def index
    render plain: csv_report
  end

  private

  def csv_report
    result = "month, year, move_in_amount, prevention_amount, name, landlord, number_children\n"
    year = start_year
    month = start_month

    until(year >= end_year && month > end_month) # Do we want to capture the current month?
      puts "================"
      puts year
      puts end_year
      puts month
      puts end_month
      puts "================"

      grant.disbursements_by_year_and_month(year, month).each do |disbursement|
        result << "#{year},#{month},#{disbursement.move_in_amount},#{disbursement.prevention_amount},#{disbursement.name},#{disbursement.landlord},#{disbursement.number_children}\n"
      end

      month = month + 1
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
