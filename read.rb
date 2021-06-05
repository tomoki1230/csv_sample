require "csv"
require "pry"

list = CSV.read("okinawa_area.csv", headers: true).map do |row|
  { id: row["id"].to_i, county: row["郡"], city: row["市区町村"], area: row["面積"].to_f }
end

p list.find { |data| data[:id] == 6 }
p list.find { |data| data[:city] == "南大東村" }
p list.find_all { |data| data[:area] >= 100 }
nakagami_list = list.select { |data| data[:county] == "中頭郡" }
p nakagami_list
p nakagami_list.map { |data| data[:city] }
puts nakagami_list.sum { |data| data[:area] }
