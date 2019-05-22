#!/bin/bash

# Assumed to run from same directory

#XML
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/XML.asp?rpt=cpt -O cpt.xml
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/XML2.asp?rpt=cvx -O cvx.xml
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/XML2.asp?rpt=cvxvis -O cvxvis.xml
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/XML.asp?rpt=tradename -O tradename.xml
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/XML.asp?rpt=vax2vg -O vac2vg.xml

wget https://www2a.cdc.gov/vaccines/iis/iisstandards/VIS_xml.asp -O vis.xml
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/VISURL_xml.asp -O visurl.xml

#FLAT FILES
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/downloads/NDC/NDC_Unit_use.txt -O NDC_Unit_use.txt
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/downloads/NDC/NDC_Unit_sale.txt -O NDC_Unit_sale.txt
wget https://www2a.cdc.gov/vaccines/iis/iisstandards/downloads/NDC/NDC_Linker.txt -O NDC_Linker.txt

for f in *.xml; do xmllint -o $f --format $f; done

iconv -f utf-16le -t utf-8 NDC_Unit_use.txt -o NDC_Unit_use.txt.new
mv -f NDC_Unit_use.txt.new NDC_Unit_use.txt

iconv -f utf-16le -t utf-8 NDC_Unit_sale.txt -o NDC_Unit_sale.txt.new
mv -f NDC_Unit_sale.txt.new NDC_Unit_sale.txt

