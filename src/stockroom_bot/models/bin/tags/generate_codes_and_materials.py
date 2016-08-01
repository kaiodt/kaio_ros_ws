#! /usr/bin/env python

import os

for i in xrange(0,12):
	# Create the ALVAR marker, saved as MarkerData_# 
	os.system("rosrun ar_track_alvar createMarker {0}".format(i))

	# Use the ImageMagick utility to add a thick white border to the marker
	fn = "MarkerData_{0}.png".format(i)
	os.system("convert {0} -bordercolor white -border 100x100 {0}".format(fn))

	# Create the material script of the marker, including a reference to the file
	with open("product_{0}.material".format(i), 'w') as f:
		f.write("""
				material product_%d {
					receive_shadows on
					technique {
						pass {
							ambient 1.0 1.0 1.0 1.0
							diffuse 1.0 1.0 1.0 1.0
							specular 0.5 0.5 0.5 1.0
							lighting on
							shading gouraud
							texture_unit { texture MarkerData_%d.png }
						}
					}
				}
				""" 
				% (i,i))

