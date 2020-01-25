#!/usr/bin/env ruby

require 'json'
require 'rubyXL'
require 'rubyXL/convenience_methods/cell'

puts ARGV.inspect

if ARGV.length != 1
  puts "Example usage: ruby json_to_excel.rb <partner1.json>"
  exit
end

json_filename = ARGV[0]

workbook = RubyXL::Parser.parse './humi-template.xlsx'

DISBURSEMENTS_FIRST_ROW = 19
DONATIONS_FIRST_ROW = 5 

grant = JSON.parse(File.read(json_filename))

new_donation_sheet = workbook.add_worksheet("donations")
new_disbursement_sheet = workbook.add_worksheet("disbursements")

row = 0
disbursements_row = 0
(0..12).each do |month_index|

  grant['donations'][month_index.to_s].each_with_index do |donation, idx|
    new_donation_sheet.add_cell(row, 0, donation['donor'])
    new_donation_sheet.add_cell(row, 1, donation['date'])
    new_donation_sheet.add_cell(row, 2, donation['amount'].gsub(/\$/, ""))
    row += 1
  end

  grant['disbursements'][month_index.to_s].each_with_index do |disbursement, idx|
    new_disbursement_sheet.add_cell(disbursements_row, 0, disbursement['name'])
    new_disbursement_sheet.add_cell(disbursements_row, 1, disbursement['date'])
    new_disbursement_sheet.add_cell(disbursements_row, 2, disbursement['number_children'])
    new_disbursement_sheet.add_cell(disbursements_row, 3, disbursement['landlord'])
    new_disbursement_sheet.add_cell(disbursements_row, 4, disbursement['move_in_amount'].gsub(/\$/, ""))
    new_disbursement_sheet.add_cell(disbursements_row, 5, disbursement['prevention_amount'].gsub(/\$/, ""))
    disbursements_row += 1
  end
end


(0..11).each do |month_index|
  worksheet = workbook[month_index + 2]

  grant['donations'][month_index.to_s].each_with_index do |donation, idx|
    row = DONATIONS_FIRST_ROW + idx
    { 'donor' => 1,
      'date' => 5,
      'amount' => 7
    }.each do |field, column|
      if worksheet[row][column].nil?
        worksheet.add_cell(row, column, donation[field])
      else
        worksheet[row][column].change_contents(donation[field])
      end
    end
  end

  grant['disbursements'][month_index.to_s].each_with_index do |disbursement, idx|
    row = DISBURSEMENTS_FIRST_ROW + idx 
    { 'name' => 1,
      'date' => 2,
      'number_children' => 3,
      'landlord' => 4,
      'move_in_amount' => 5,
      'prevention_amount' => 6,
    }.each do |field, column|
      if worksheet[row][column].nil?
        worksheet.add_cell(row, column, disbursement[field])
      else
        worksheet[row][column].change_contents(disbursement[field])
      end
    end
  end
end

workbook.write "./#{json_filename.gsub /\.json/, ""}.xlsx"

