require 'ostruct'
require_relative 'parse_phasta.rb'

data = read_phasta_log(File.open(ARGV[0],"r"))

wctime_start = data["2"].first.wctime

last_ts = 0
data.each_key {|k| last_ts = k.to_i if last_ts.to_i < k.to_i} #probably paranoid

#puts data[last_ts.to_s].last.inspect
puts data[last_ts.to_s].last.wctime - wctime_start
