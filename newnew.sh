# Test if the original zip file exists
if test ! -f "Adresse_Relationale_Tabellen-Stichtagsdaten.zip"; then
  wget "https://www.bev.gv.at/pls/portal/docs/PAGE/BEV_PORTAL_CONTENT_ALLGEMEIN/0200_PRODUKTE/UNENTGELTLICHE_PRODUKTE_DES_BEV/Adresse-Relationale_Tabellen_Stichtagsdaten.zip"
fi

# removing database if it exists
if test -f "newnew.gpkg"; then
  rm newnew.gpkg*
fi

echo "[1/10] importing adresse ..."
echo "[1/10]                   1/3 M28 ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -s_srs "EPSG:31254" -t_srs "EPSG:31255" -lco SPATIAL_INDEX=YES -nln adresse -lco IDENTIFIER=adresse /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/ADRESSE.csv -oo X_POSSIBLE_NAMES=RW -oo Y_POSSIBLE_NAMES=HW -oo KEEP_GEOM_COLUMNS=NO -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES -sql "SELECT * FROM ADRESSE WHERE EPSG = 31254"
echo "[1/10]                   2/3 M31 ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -a_srs "EPSG:31255" -nln adresse /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/ADRESSE.csv -oo X_POSSIBLE_NAMES=RW -oo Y_POSSIBLE_NAMES=HW -oo KEEP_GEOM_COLUMNS=NO -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES -sql "SELECT * FROM ADRESSE WHERE EPSG = 31255"
echo "[1/10]                   3/3 M34 ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -s_srs "EPSG:31256" -t_srs "EPSG:31255" -nln adresse /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/ADRESSE.csv -oo X_POSSIBLE_NAMES=RW -oo Y_POSSIBLE_NAMES=HW -oo KEEP_GEOM_COLUMNS=NO -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES -sql "SELECT * FROM ADRESSE WHERE EPSG = 31256"

echo "[2/10] importing gebaeude ..."
echo "[2/10]                    1/3 M28 ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -s_srs "EPSG:31254" -t_srs "EPSG:31255" -lco SPATIAL_INDEX=YES -nln gebaeude -lco IDENTIFIER=gebaeude /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/GEBAEUDE.csv -oo Y_POSSIBLE_NAMES=HW -oo X_POSSIBLE_NAMES=RW -oo KEEP_GEOM_COLUMNS=NO -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES -sql "SELECT * FROM GEBAEUDE WHERE EPSG = 31254"
echo "[2/10]                    2/3 M31 ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -a_srs "EPSG:31255" -nln gebaeude /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/GEBAEUDE.csv -oo Y_POSSIBLE_NAMES=HW -oo X_POSSIBLE_NAMES=RW -oo KEEP_GEOM_COLUMNS=NO -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES -sql "SELECT * FROM GEBAEUDE WHERE EPSG = 31255"
echo "[2/10]                    3/3 M34 ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -s_srs "EPSG:31256" -t_srs "EPSG:31255" -nln gebaeude /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/GEBAEUDE.csv -oo Y_POSSIBLE_NAMES=HW -oo X_POSSIBLE_NAMES=RW -oo KEEP_GEOM_COLUMNS=NO -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES -sql "SELECT * FROM GEBAEUDE WHERE EPSG = 31256"

echo "[3/10] importing adresse_gst ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -lco SPATIAL_INDEX=NO -nln adresse_gst -lco IDENTIFIER=adresse_gst /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/ADRESSE_GST.csv -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES
echo "[4/10] importing gebaeude_funktion ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -lco SPATIAL_INDEX=NO -nln gebaeude_funktion -lco IDENTIFIER=gebaeude_funktion /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/GEBAEUDE_FUNKTION.csv -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES
echo "[5/10] importing gemeinde ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -lco SPATIAL_INDEX=NO -nln gemeinde -lco IDENTIFIER=gemeinde /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/GEMEINDE.csv -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES
echo "[6/10] importing ortschaft ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -lco SPATIAL_INDEX=NO -nln ortschaft -lco IDENTIFIER=ortschaft /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/ORTSCHAFT.csv -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES
echo "[7/10] importing strasse ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -lco SPATIAL_INDEX=NO -nln strasse -lco IDENTIFIER=strasse /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/STRASSE.csv -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES
echo "[8/10] importing zaehlsprengel ..."
ogr2ogr -f "GPKG" newnew.gpkg -update -append -gt unlimited -lco SPATIAL_INDEX=NO -nln zaehlsprengel -lco IDENTIFIER=zaehlsprengel /vsizip/Adresse_Relationale_Tabellen-Stichtagsdaten.zip/ZAEHLSPRENGEL.csv -oo AUTODETECT_TYPE=YES -oo QUOTED_FIELDS_AS_STRING=YES -oo HEADERS=YES

echo "[9/10] creating indices ..."
echo "[9/10]                  1/2 on ADRCD ..."
ogrinfo -sql "CREATE UNIQUE INDEX idx_ADRESSE_ADRCD ON ADRESSE(ADRCD);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE INDEX idx_GEBAEUDE_ADRCD ON GEBAEUDE(ADRCD);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE INDEX idx_GEBAEUDE_SUBCD ON GEBAEUDE(SUBCD);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE INDEX idx_ADRESSE_GST_ADRCD ON ADRESSE_GST(ADRCD);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE INDEX idx_GEBAEUDE_FUNKTION_ADRCD ON GEBAEUDE_FUNKTION(ADRCD);" newnew.gpkg > /dev/null
echo "[9/10]                  2/2 on other fields ..."
ogrinfo -sql "CREATE UNIQUE INDEX idx_GEMEINDE_GKZ ON GEMEINDE(GKZ);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE UNIQUE INDEX idx_ORTSCHAFT_OKZ ON ORTSCHAFT(OKZ);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE UNIQUE INDEX idx_ORTSCHAFT_GKZ ON ORTSCHAFT(OKZ);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE UNIQUE INDEX idx_STRASSE_SKZ ON STRASSE(SKZ);" newnew.gpkg > /dev/null
ogrinfo -sql "CREATE INDEX idx_ZAEHLSPRENGEL_GKZ ON ZAEHLSPRENGEL(GKZ);" newnew.gpkg > /dev/null

echo "[10/10] performing a final vacuum ..."
ogrinfo -sql "vacuum;" newnew.gpkg > /dev/null

echo "Finished"
