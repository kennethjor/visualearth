#!/bin/bash
# requires imagemagick and ffmpeg

size=1280x720
# size=960x540
tmpdir=video_tmp
output=visualearth_timelapse.mp4

mkdir $tmpdir

echo ==== Processing files ...
i=0
for f in render/earth_*;
do
	name=`basename $f`
	out=$tmpdir/img_`printf "%03d" $i`.jpg
	echo $name
	convert $f \
		-resize $size\! \
		-fill black -draw "rectangle 5,5,187,25" \
		-fill white -annotate +10+20 "$name" \
		$out
	((i=$i+1))
done

if [ -f $output ]
then rm $output
fi

echo ==== Encoding video ...
ffmpeg -b 10000000 -r 12 -i $tmpdir/img_%03d.jpg $output

rm -R $tmpdir
