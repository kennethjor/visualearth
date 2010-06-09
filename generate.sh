#!/bin/bash

mkdir render

# Update clouds
./download_clouds.pl

# Copy config file
cp xplanet.config config.tmp

# Set correct image based on month
sed -i "s/earth_day.jpg/earth_day_`date +%m`.jpg/g" config.tmp

# Run xplanet
xplanet -config config.tmp -projection mercator -geometry 4800x2400 -num_times 1 -body earth -output render.jpg

# remove tmp config
rm config.tmp

# Crop and resize
# You may want to change the resize to fit your purposes
convert -crop 4800x1940+0+230 -resize 1920x1080\! render.jpg render/earth.jpg
rm render.jpg
