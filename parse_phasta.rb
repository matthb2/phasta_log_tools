require 'ostruct'

#infile = File.open(ARGV[0],"r")

def read_phasta_log(infile)
	lines = infile.readlines

	data = {}

	lines.each do |l|
		record = l.lstrip
		if !(record.force_encoding("UTF-8").ascii_only?) then
			$stderr.puts("Warning: Detected invalid characters")
			next
		end
		split_rec = record.match(/^([0-9]+)([\s])+([0-9Ee\+\-\.]+)([\s])+([0-9Ee\+\-\.]+)(.*)/) 
		if split_rec != nil then
			#puts split_rec.inspect
			timestep = split_rec[1]
			wctime = split_rec[3]
			residual = split_rec[5]
			data[timestep] = [] if data[timestep] == nil
			record_struct = OpenStruct.new
			record_struct.residual = residual.to_f
			record_struct.wctime = wctime.to_f
			data[timestep] << record_struct
			#puts wctime	
		end
	end
	return data
#puts data.inspect
end
