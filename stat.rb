# read in data as string
file = File.new("./data.csv", "r")
data_string = file.read
file.close

#convert string of data into an array of data
data_points = data_string.split("\n")

# go through each data point and fetch the needed values by splitting it into an array of data values
f = []
data_points.each do |s|
  data_point_values = s.split(',')
  fahrenheit_s = data_point_values[10]
  fahrenheit_i = fahrenheit_s.to_f
  f.push(fahrenheit_i)
end

# remove the header
f.shift

# find sum
total = f.inject(0,&:+)

# find/puts average
puts "Average temperatures in October 2014: "
mean = total / f.count #903
print mean.round(2); puts "°F"

# find variance
s = []
f.each do |v|
  each = (v - mean)**2
  s.push(each)
end
variance_sum = s.inject(0,&:+)
variance = variance_sum / s.count

#find/puts standard deviation
puts "Standard deviation of temperatures in October 2014: "
standard_deviation = Math.sqrt(variance)
print standard_deviation.round(2); puts "°F"

# find z-scores and add them to original data points
top_line = data_points.shift
new_data_points = []
data_points.each do |s|
  data_point_values = s.split(',')
  fahrenheit_s = data_point_values[10]
  fahrenheit_i = fahrenheit_s.to_f

  z_scores = (fahrenheit_i - mean) / standard_deviation
  z_scores = z_scores.to_s

  new_data_points.push(s + "," + z_scores)
end

new_data_points.unshift(top_line + ",Z-Scores for DryBulbFahrenheit")

new_data_points = new_data_points.join("\n")

# write into z-score file
zscore = File.new("./zscore.csv", "r")
zscore.close

zscore = File.new("./zscore.csv", "w")
zscore.write new_data_points
zscore.close