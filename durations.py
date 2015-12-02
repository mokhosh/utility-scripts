# safir187
# i couldn't get ruby to read the duration of my 46 mp4 files
# from FFPROBE so i swiched to python for this (that's how lazy i am)
# to be fair i did google before i do this
# this script reads the durations and stores them with some other
# stuff in a txt file that i then edit with a multiline editor like
# sublime text or atom (cause multiline editors are for lazy people)

import subprocess


def getLength(filename):
    result = subprocess.Popen(["c:/ffmpeg/bin/ffprobe.exe", filename],
                              stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return [x for x in result.stdout.readlines() if b'Duration' in x]


def getName(i):
    name = "Java0"
    if i < 10:
        name += "0"
    name += str(i)
    name += ".mp4"
    return name

file = open("durations.txt", mode="w")
for i in range(0, 46):
    film = getName(i)
    print(film)
    length = getLength(film)[0].decode("utf-8")
    file.write(length)
