#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: lptimer [message] [-H] (hours) [-M] (minutes) [-S] (seconds)"
    exit 1
fi

HOURS="0"
MINUTES="0"
SECS="0"
while getopts ":H:M:S:" options; do
    case "${options}" in
        H)
            HOURS=${OPTARG}
            ;;
        M)
            MINUTES=${OPTARG}
            ;;
        S)
            SECS=${OPTARG}
            ;;
        :)
            echo -e "lptimer: \e[1;31mError: ${OPTARG} requires an argument"
            exit 2
            ;;
        *)
            exit 4
            ;;
    esac
done

ITERATION=1
while true; do
    echo "lptimer: iteration = $ITERATION"
    if [ "$HOURS" != "0" ]; then
        # echo "lptimer: hours: $(($HOURS*3600))"
        sleep $(($HOURS*3600))
    fi
    if [ "$MINUTES" != "0" ]; then
        # echo "lptimer: minutes: $(($MINUTES*60))"
        sleep $(($MINUTES*60))
    fi
    if [ "$SECS" != "0" ]; then
        # echo "lptimer: seconds: $SECS"
        sleep $SECS
    fi
    
    # Your commands here (if going to use the iteration variable use here)
    
    ITERATION=$(($ITERATION+1))

    # If not, you can use here too, but here the variable is +1 forward, that's why i said the thing before
done

