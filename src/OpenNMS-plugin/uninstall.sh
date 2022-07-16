#!/bin/sh
#####################################################
# Filename:        uninstall.sh
# Version:         v1.2
# Created:         09.21.2017
# Author:          y
# Description:     The OpenNMS plugin uninstaller
# History:			
# ---------------------------------------------------

opennmsdir=/opt/opennms

echo "Please enter the OpenNMS installation directory[/opt/opennms]:"
read ONMS_DIR

if [ "x${ONMS_DIR}" != "x" ] ; then
    opennmsdir=${ONMS_DIR}
fi

if [ ! -d "${opennmsdir}" ] ; then
    echo ""
    echo "Installed of OpenNMS does not exist or is not executable."
    echo ""
    exit 1;
fi


rm -f $opennmsdir/etc/events/XFUSION-Server-HMM.events.xml
rm -f $opennmsdir/etc/events/XFUSION-Server-IBMC.events.xml
rm -f $opennmsdir/etc/events/XFUSION-V5-Server-IBMC.events.xml

rm -f $opennmsdir/etc/datacollection/XFUSION-server-hmm.xml
rm -f $opennmsdir/etc/datacollection/XFUSION-server-ibmc.xml
rm -f $opennmsdir/etc/datacollection/XFUSION-V5-server-ibmc.xml

rm -f $opennmsdir/etc/snmp-graph.properties.d/XFUSION-server-hmm-graph.properties
rm -f $opennmsdir/etc/snmp-graph.properties.d/XFUSION-server-ibmc-graph.properties
rm -f $opennmsdir/etc/snmp-graph.properties.d/XFUSION-V5-server-ibmc-graph.properties

sed -i '/<event-file>events\/XFUSION-Server-IBMC.events.xml<\/event-file>/d ; /<event-file>events\/XFUSION-V5-Server-IBMC.events.xml<\/event-file>/d ; /<event-file>events\/XFUSION-Server-HMM.events.xml<\/event-file>/d' $opennmsdir/etc/eventconf.xml

sed -i '/<include-collection dataCollectionGroup="XFUSION-V5-SERVER-IBMC-MIB"\/>/d ; /<include-collection dataCollectionGroup="XFUSION-SERVER-IBMC-MIB"\/>/d ; /<include-collection dataCollectionGroup="HWSMM-MIB"\/>/d' $opennmsdir/etc/datacollection-config.xml

echo ""
echo "Uninstall the OpenNMS plugin successfully."
