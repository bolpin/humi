require 'json'
f = File.read('rpt.json')

grant = JSON.parse(f)

(1..12).each do |index|
  puts "#{index.to_s} #{grant[index.to_s].size}"
  puts grant[index.to_s]
end
