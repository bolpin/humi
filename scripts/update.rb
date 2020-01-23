require 'json'
require 'spreadsheet'
Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open './grant-report.xls'

DISBURSEMENTS_FIRST_ROW = 19
DONATIONS_FIRST_ROW = 5 

f = File.read('rpt.json')

grant = JSON.parse(f)


(0..11).each do |index|
  sheet = book.worksheet(2+index)

  grant['donations'][index.to_s].each_with_index do |donation, idx|
    row = sheet.row(DONATIONS_FIRST_ROW + idx) 
    row[1] = donation['donor']
    row[5] = donation['date']
    row[7] = donation['amount']
  end

  grant['disbursements'][index.to_s].each_with_index do |disbursement, idx|
    row = sheet.row(DISBURSEMENTS_FIRST_ROW + idx) 
    row[1] = disbursement['name']
    row[2] = disbursement['date']
    row[3] = disbursement['number_children']
    row[4] = disbursement['landlord']
    row[5] = disbursement['move_in_amount']
    row[6] = disbursement['prevention_amount']
  end
end

book.write './foo.xls'

