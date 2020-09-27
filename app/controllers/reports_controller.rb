require 'json'
class ReportsController < ApplicationController
  include ActionController::DataStreaming # for send_data/send_file

  def index
  end

    # render plain: json_report.to_s
    # send_data(json_report.to_json, type: 'text/json; charset=utf-8', filename: "#{grant.name.gsub(/ /, '_')}.json")

    # respond_to do |format|
    #   format.json do
    #     :content_type => Mime::TEXT
    #     send_data json_report.to_s, filename: "#{grant.name.gsub(/ /, '_')}", mime_type: Mime::Type.lookup_by_extension('txt')
    #   end
    # end

  def new
    respond_to do |format|
      # format.html
      format.json { render json: json_report }
    end

  end

  private

  def json_report

    foo = grant

    result = {
      grant: {
        name: grant.name,
        id: grant.id,
        date: grant.date
      },
      donations: {},
      disbursements: {}
    }

    index = 0
    year = start_year
    month = start_month
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

    result
  end

  def start_year
    @grant.date.year
  end

  def start_month
    @grant.date.month
  end

  def end_year
    Time.now.year
  end

  def end_month
    Time.now.month
  end

  def grant
    @grant ||= Grant.find(params['grant_id'])
  end

end
