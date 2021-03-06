require 'spreadsheet'
require 'json'

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open './humi-template.xls'

f = File.read('rpt.json')

grant = JSON.parse(f)

(1..12).each do |month_index|
  sheet = book.worksheet(month_index + 2)
  puts "#{month_index.to_s} #{grant[month_index.to_s].size}"
  puts grant[month_index.to_s]

end

(1..24).each do |row|
  (1..4).each do |col|
    x = sheet1.row(row)
    puts "#{row}/#{col}"
    puts x[col].inspect
  end
end

r = sheet1.row(20)
r[1] = "test1"
sheet1[20,2] = 'test2'
book.write './report-edited.xls'
