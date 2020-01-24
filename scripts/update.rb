require 'json'

require 'rubyXL'
workbook = RubyXL::Parser.parse './humi-template.xlsx'

DISBURSEMENTS_FIRST_ROW = 19
DONATIONS_FIRST_ROW = 5 

f = File.read('rpt.json')

grant = JSON.parse(f)


if false
  (0..11).each do |index|
    new_donation_sheet = workbook.add_worksheet("donations #{index}")

    grant['donations'][index.to_s].each_with_index do |donation, idx|
      new_donation_sheet.add_cell(idx, 0, donation['donor'])
      new_donation_sheet.add_cell(idx, 1, donation['date'])
      new_donation_sheet.add_cell(idx, 2, donation['amount'])
    end

    new_disbursement_sheet = workbook.add_worksheet("disbursements #{index}")

    grant['disbursements'][index.to_s].each_with_index do |disbursement, idx|
      row = new_disbursement_sheet[idx]
      new_disbursement_sheet.add_cell(idx, 0, disbursement['name'])
      new_disbursement_sheet.add_cell(idx, 1, disbursement['date'])
      new_disbursement_sheet.add_cell(idx, 2, disbursement['number_children'])
      new_disbursement_sheet.add_cell(idx, 3, disbursement['landlord'])
      new_disbursement_sheet.add_cell(idx, 4, disbursement['move_in_amount'])
      new_disbursement_sheet.add_cell(idx, 5, disbursement['prevention_amount'])
    end
  end
end

(0..11).each do |index|
  worksheet = workbook[index + 2]

  grant['donations'][index.to_s].each_with_index do |donation, idx|
    row_number = DONATIONS_FIRST_ROW + idx
    require 'pry';binding.pry
    worksheet[1][row_number].change_contents(donation['donor'], worksheet[1][row_number].formula)
    worksheet[5][row_number].change_contents(donation['date'], worksheet[5][row_number].formula)
    worksheet[7][row_number].change_contents(donation['amount'], worksheet[7][row_number].formula)
  end

  grant['disbursements'][index.to_s].each_with_index do |disbursement, idx|
    row_number = DISBURSEMENTS_FIRST_ROW + idx 
    worksheet[1][row_number].change_contents(disbursement['name'], worksheet[1][row_number].formula)
    worksheet[2][row_number].change_contents(disbursement['date'], worksheet[2][row_number].formula)
    worksheet[3][row_number].change_contents(disbursement['number_children'], worksheet[3][row_number].formula)
    worksheet[4][row_number].change_contents(disbursement['landlord'], worksheet[4][row_number].formula)
    worksheet[5][row_number].change_contents(disbursement['move_in_amount'], worksheet[5][row_number].formula)
    worksheet[6][row_number].change_contents(disbursement['prevention_amount'], worksheet[6][row_number].formula)
  end
end

workbook.write './test.xlsx'

