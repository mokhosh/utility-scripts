# safir187
# i had 46 mp4 files that i made a few years ago for
# a website that is no longer mine so i wanted to
# cut the name from the beginning and end of each file
# and i was too lazy to cut them in premiere or other
# video editing software so...

FFMPEG    = "c:/ffmpeg/bin/ffmpeg.exe"

in_dir = "."
out_dir = "./cut"

def getDiff(i, o)
	
	i_parts = i[0,i.index('.')].split(':')
	o_parts = o[0,o.index('.')].split(':')

	i_sec = i_parts[1].to_i * 60 + i_parts[2].to_i
	o_sec = o_parts[1].to_i * 60 + o_parts[2].to_i

	diff_i = o_sec - i_sec
	diff_m = diff_i / 60
	diff_s = diff_i - (diff_m * 60)

	if diff_m < 10
		min = "0" + String(diff_m)
	else
		min = "" + String(diff_m)
	end

	if diff_s < 10
		sec = "0" + String(diff_s)
	else
		sec = "" + String(diff_s)
	end

	"00:#{min}:#{sec}.0"

end

durations = File.readlines('durations.txt')

Dir.glob("*.mp4") do |file|
	input     = file
	output    = input.chomp(".mp4")
	inpoint   = "00:00:05.0"

	index = file[5,file.length].chomp(".mp4").to_i
	
	outpoint  = durations[index]
	diff      = getDiff(inpoint, outpoint)

	command = "#{FFMPEG} -n -ss #{inpoint} -i \"#{in_dir}/#{input}\" -c copy -t #{diff} \"#{out_dir}/#{output}.#{EXT}\""
	system(command)
	
end
