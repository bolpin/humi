require 'json'
require 'rubyXL'
require 'rubyXL/convenience_methods/cell'

workbook = RubyXL::Parser.parse './humi-template.xlsx'

DISBURSEMENTS_FIRST_ROW = 19
DONATIONS_FIRST_ROW = 5 

grant = JSON.parse(File.read('rpt.json'))

# (0..12).each do |month_index|
#   new_donation_sheet = workbook.add_worksheet("donations #{month_index}")
#
#   grant['donations'][month_index.to_s].each_with_index do |donation, idx|
#     new_donation_sheet.add_cell(idx, 0, donation['donor'])
#     new_donation_sheet.add_cell(idx, 1, donation['date'])
#     new_donation_sheet.add_cell(idx, 2, donation['amount'])
#   end
#
#   new_disbursement_sheet = workbook.add_worksheet("disbursements #{month_index}")
#
#   grant['disbursements'][month_index.to_s].each_with_index do |disbursement, idx|
#     row = new_disbursement_sheet[idx]
#     new_disbursement_sheet.add_cell(idx, 0, disbursement['name'])
#     new_disbursement_sheet.add_cell(idx, 1, disbursement['date'])
#     new_disbursement_sheet.add_cell(idx, 2, disbursement['number_children'])
#     new_disbursement_sheet.add_cell(idx, 3, disbursement['landlord'])
#     new_disbursement_sheet.add_cell(idx, 4, disbursement['move_in_amount'])
#     new_disbursement_sheet.add_cell(idx, 5, disbursement['prevention_amount'])
#   end
# end

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

workbook.write './test.xlsx'

