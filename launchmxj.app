#	launchmxj.app
#	Checks running services
#	Version: 1.1
#	Revision History:
#	Comments			Author		Date
#	Created v1			pm			2010-Dec-23
#	Added in variables	pm			2012-Aug-14

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOGS="$DIR/logs"
PID="$LOGS/mydaemon.pid"

running=0;
if [ -e $PID ]; then
	count=`ps -ef | grep -f $PID | grep -v grep | awk {'print $2'} | wc -l`
	if [ "$count" -gt 0 ]; then
		running=1
	fi
fi

if [ "$running" -eq 1 ]; then
	echo "Daemon service running. PID: `cat $PID`"
else
	echo "No services running."
	if [ -e $PID ] ; then
		echo "Removing file - $PID"
		rm $PID
	fi
fi

