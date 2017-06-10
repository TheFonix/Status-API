#!/bin/bash
#==============10/6/2017===============#
#Created By Fonix: https://fonix.online#
#Status Script for the Digital Hazards #
#           status system              #
#======================================#

source "/home/scripts/spinner.sh" #Conection to Loader

			 #=========#
			 #Variables:
			 #=========#
SERVER='http://discordapp.com' #Server Address: (IP or HTTP)
OFF="Could no be contacted, but it was pinged" # Message if the server didnt respond
ON="Server was pinged and got a response" #Message if the server responded
TONULL="/dev/null 2>&1" # NUll var, to send info to a place other then the console
API="Status API" #Name of the Status API
NODE="					node
          const Cachet = require('cachet-node').Cachet;
          const cachet = new Cachet({
          domain: 'https://status.digitalhazards.net/api/v1',
          token: {
            value: 'HEHE',
            headerOrQueryName: 'X-Cachet-Token'
                  }
          });
          cachet.updateComponentById({
              component: 17,
              body: {
              status: 4
              }
          });
          .exit"


	echo ""

	echo "Current Server to check is $SERVER"

	echo ""

	start_spinner 'Checking Site...'

		/usr/bin/curl -sSf $SERVER > "$TONULL"
			CS=$?

	echo ""
	stop_spinner $?

	echo "Connection Complete"


    	if [ $CS -ne 0 ]

    		then
    			start_spinner '$SERVER $OFF'
					$NODE
    sleep 12h
    echo "Waiting 12 hours until next check to prevent mail spam!"

         		 stop_spinner $?
    		elif [ $CS -eq 0 ]
    		then
    			start_spinner '$SERVER $ON'
        		sleep 2
        		 stop_spinner $?
    	fi

    echo ""

	echo "Script Complete, Information from $SERVER was sent to the $API"

	echo ""
