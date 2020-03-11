#!/bin/bash
#title        :vpn_connect_cisco.sh
#description  :Can be used to connect to your VPN on a MAC without opening the client application UI.
#author       :Rohan Dsouza
#usage        :bash vpn_connect_cisco.sh OR ./vpn_connect_cisco.sh
#=========================================================================================================

TOOL_PATH=`which expect`
PID_ANYCONNECT=`ps aux | grep -i "Cisco AnyConnect Secure Mobility Client.app" | grep -v grep | awk {'print $2'}`
PASSWD=="<Enter password here>"
# You can add the encrypted password here using: `echo "password" | openssl enc -base64 -e` and then use -d flag to decrypt the encrypted text
# Eg. PASSWD=`echo "asfadsgfsdg" | openssl enc -base64 -d`

if [ $? -ne 0 ]
	then
		echo "expect package is not installed. Please install it first"
	exit 2
fi

if [ -n "$PID_ANYCONNECT" ]
	then
      		kill -9 $PID_ANYCONNECT
fi

echo -e "What operation would you like to perform? \n1: Connect to VPNASA \n2: Connect to VPNDublin \n3: VPN Connection Status \n4: VPN Disconnection"

read -p "$> " response

if [ $response == 1 ]
	then
		/usr/bin/expect -c "
		set timeout 3
		spawn /opt/cisco/anyconnect/bin/vpn connect vpnasa.guidewire.com
		expect *?actor*
		send \r
		expect *?actor*
		send -- $PASSWD\r
		expect "accept?"
		send -- "y"\r
		interact
		"
elif [ $response == 2 ]
	then
		/usr/bin/expect -c "
		set timeout 3
		spawn /opt/cisco/anyconnect/bin/vpn connect vpndublin.guidewire.com
		expect *?actor*
		send \r
		expect *?actor*
		send -- $PASSWD\r
		expect "accept?"
		send -- "y"\r
		interact
		"
elif [ $response == 3 ]
	then
		/opt/cisco/anyconnect/bin/vpn status | grep -i "disconnected" >> /dev/null

		if [ $? -eq 0 ]
			then
				echo "Your VPN connect is currently disconnected"
				exit 5
			else
				echo "Hurray!! Your VPN connection is connected"
		fi

elif [ $response == 4 ]
	then
		/opt/cisco/anyconnect/bin/vpn disconnect >> /dev/null
else
	echo "Invalid Input"
fi
