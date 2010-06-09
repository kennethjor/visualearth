#!/bin/bash

mkdir images

echo Downloading cloud script
wget -q http://xplanet.sourceforge.net//Extras/download_clouds.pl
chmod a+x download_clouds.pl

echo Downloading NASA Blue Marble Monthlies
# http://earthobservatory.nasa.gov/Features/BlueMarble/BlueMarble_monthlies.php
for (( i=1 ; i<=12 ; i++))
do
	url=http://earthobservatory.nasa.gov/Features/BlueMarble/images_bmng/8km/world.2004`printf "%02d" $i`.3x5400x2700.jpg
	destination=images/earth_day_`printf "%02d" $i`.jpg
	echo $i/12 
	if [ -f $destination ];
	then echo skipping
	else wget -q $url -O $destination
	fi
done
echo

echo Downloading NASA topographical map
#http://visibleearth.nasa.gov/view_rec.php?id=8391
if [ -f images/earth_topo.jpg ]
then echo skipping
else wget -q http://veimages.gsfc.nasa.gov/8391/srtm_ramp2.world.5400x2700.jpg -O images/earth_topo.jpg
fi

echo Downloading NASA earth lights
# http://visibleearth.nasa.gov/view_rec.php?id=1438
if [ -f images/earth_night.jpg ]
then echo skipping
else wget -q http://veimages.gsfc.nasa.gov/1438/earth_lights_lrg.jpg -O images/earth_night.jpg
fi
