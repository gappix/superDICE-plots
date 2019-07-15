#You have to open the python console in qgis and run the following program from a layer containing a map of countries (like https://www.naturalearthdata.com/downloads/110m-cultural-vectors/)
#geom = geom.combine( currentFeature.geometry() )

import time
import csv
import os
from PyQt5.QtCore import *
from qgis.core import *

prjfi = QFileInfo(QgsProject.instance().fileName())
crs = QgsCoordinateReferenceSystem(4326,QgsCoordinateReferenceSystem.PostgisCrsId)

rmap = dict()
with open( "C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-plots/qgis/iso3_ene35.csv", mode='r') as infile:
    reader = csv.reader(infile)
    rmap = {rows[0]:rows[1] for rows in reader}

cLayer = iface.mapCanvas().currentLayer()
if len(QgsProject.instance().mapLayersByName('ene35')) != 0:
    for id in [vl.id() for vl in QgsProject.instance().mapLayersByName('ene35')]:
        QgsProject.instance().removeMapLayer(id)
    
nlayer =  QgsVectorLayer('Polygon', 'ene35' , "memory")
pr = nlayer.dataProvider() 
pr.addAttributes([QgsField("REG_NAME", QVariant.String)])
nlayer.updateFields()

allreg = [    
    "arg",
    "aus",
    "bra",
    "can",
    "chl",
    "chn",
    "cor",
    "egy",
     "eu",
 "golf57",
    "idn",
    "jpn",
   "meme",
    "mex",
    "mys",
    "nde",
   "noan",
   "noap",
    "nor",
    "oeu",
   "osea",
   "rcam",
    "ris",
 "rjan57",
   "rsaf",
   "rsam",
   "rsas",
    "rus",
    "sui",
    "tha",
    "tur",
    "ukr",
    "usa",
    "vnm",
    "zaf" ]

for reg in allreg:

    geom =  None
    for iso3 in rmap:
        if rmap[iso3] == reg:
            print(iso3)
            expr = QgsExpression( " \"ADM0_A3\" = '{}' ".format(iso3) )
            it = cLayer.getFeatures( QgsFeatureRequest( expr ) )
            for i in it:
                    if geom == None:
                        geom = i.geometry()
                    else:
                        geom = geom.combine(i.geometry() )
    print(geom)

    curreg = QgsFeature()
    curreg.setGeometry(geom)
    curreg.setFields(nlayer.fields())
    curreg['REG_NAME'] = reg
    pr.addFeatures([curreg])
    nlayer.updateExtents()

QgsProject.instance().addMapLayers([nlayer])

QgsVectorFileWriter.writeAsVectorFormat(nlayer,"C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-plots/qgis/shape_outfile/geo_ene35.geojson", 'utf-8', crs, 'GeoJson',layerOptions=['COORDINATE_PRECISION=1,GEOMETRY_AS_COLLECTION=NO'])
QgsVectorFileWriter.writeAsVectorFormat(nlayer,"C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-plots/qgis/shape_outfile/geo_ene35.shp", 'utf-8', crs, 'ESRI Shapefile')

