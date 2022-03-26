#!/bin/sh
if [ ! -f "/usr/share/tachidesk/data/server.conf" ]; then
    curl "https://github.com/Takane42/docker-tachidesk/blob/nata/server.conf" -o /usr/share/tachidesk/data/server.conf
fi
echo ""
echo ""
echo "                                                                ************README***********"
echo "-> It is essential that u read readme for ghcr.io/suwayomi/tachidesk before running this container"
echo "-> Readme for ghcr.io/suwayomi/tachidesk is available at https://github.com/suwayomi/docker-tachidesk "
echo "                                                                *****************************"
echo ""
echo ""
echo "Tachidesk data location inside the container -> /usr/share/tachidesk/data"
echo ""
echo "The server is running by default configuration on  http://0.0.0.0:4567"
echo "log file location inside the container -> /usr/share/tachidesk/logfile.log"
exec java -Dsuwayomi.tachidesk.config.server.rootDir="/usr/share/tachidesk/data" -jar "/usr/share/tachidesk/tachidesk_latest.jar" > /usr/share/tachidesk/data/logfile.log 2>&1;
