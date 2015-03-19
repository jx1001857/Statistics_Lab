# puts "CSV file name? (ex. data.csv)"
# csv = gets.chomp
#
# puts "Number of column with data you want to analyze?"
# column = gets.to_i
#
# file = File.new( "./#{csv}", "r")
# data_string = file.read
# file.close
#
# data_points = data_string.split("\n")
#
# f = []
# data_points.each do |s|
#   data_point_values = s.split(',')
#   data_s = data_point_values[column-1]
#   data_i = data_s.to_f
#   f.push(data_i)
# end
#
# f.shift
#
# total = 0
# f.each do |n|
#   total = total + n
# end
#
# puts "Average: "
# mean = total / f.count
# puts mean
#
# s = []
# f.each do |v|
#   each = (v - mean)**2
#   s.push(each)
# end
#
# variance_sum = 0
# s.each do |a|
#   variance_sum = variance_sum + a
# end
# variance = variance_sum / s.count
# puts "Standard deviation: "
# standard_deviation = Math.sqrt(variance)
# print standard_deviation
#
# =begin
# top_line = data_points.shift
# new_data_points = []
# data_points.each do |s|
#   data_point_values = s.split(',')
#   fahrenheit_s = data_point_values[10]
#   fahrenheit_i = fahrenheit_s.to_f
#
#   z_scores = (fahrenheit_i - mean) / standard_deviation
#   z_scores = z_scores.to_s
#
#   new_data_points.push(s + "," + z_scores)
# end
#
# new_data_points.unshift(top_line + ",Z-Scores for DryBulbFahrenheit")
#
# new_data_points = new_data_points.join("\n")
#
# zscore = File.new("./zscore.csv", "r")
# zscore.close
#
# zscore = File.new("./zscore.csv", "w")
# zscore.write new_data_points
# zscore.close
# =end
