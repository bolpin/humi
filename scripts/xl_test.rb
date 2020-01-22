require 'spreadsheet'
Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open './humi-template.xls'
sheet1 = book.worksheet(3)

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
book.write './edited.xls'
