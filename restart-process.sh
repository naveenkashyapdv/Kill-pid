#!bin/bash
echo $HOSTNAME
echo "checking enter-process-name"
pid=$(ps ax | grep -i 'enter-process-name' | grep java | grep -v grep | awk '{print $1}')
if [ -n "$pid" ]
then
    echo "Stopping enter-process-name ..."
    echo "Killing pid $pid"
    kill -9 $pid
    echo "Stopped enter-process-name ..."
else
    echo "enter-process-name is not Running"
fi
echo "starting enter-process-name process"
pid=$(ps ax | grep -i 'enter-process-name' | grep java | grep -v grep | awk '{print $1}')
if [ -n "$pid" ]
then
    echo "enter-process-name was already Running"
else
    echo "Starting enter-process-name ..."
cd /app/Drools
      nohup /opt/jdk1.8.0_181/bin/java -jar /app/enter-process-name-1.0.0-SNAPSHOT.jar -Xms64m -Xmx512m > nohup.out 2>&1&
		pid=$(ps ax | grep -i 'enter-process-name' | grep java | grep -v grep | awk '{print $1}')
			if [ -n "$pid" ]
		then
			echo "enter-process-name is Running as PID: $pid"
		else
			echo "enter-process-name is not Running"
		fi   
fi
sleep 20
