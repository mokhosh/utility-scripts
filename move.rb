# safir187
# i had 46 mp4 files each in a folder and
# i wanted them all in one folder and
# i was too lazy to move them one at a time so...

require 'fileutils'

Dir.glob("*/*.mp4") do |file|
	FileUtils.mv(file, file[file.index('/') + 1 , file.length])
end