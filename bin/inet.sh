#!/bin/bash
ADDRS="192.168.100"
ENDADDR=20;
START=1;
LOGFILE="/home/vp/lessonm/inet.log"
#ADDRS=("8.8.8.8" "1.1.1.1" "208.67.222.222" "192.168.0.2")
# for MYADR in "${ADDRS[@]}"; do
#         echo "$MYADR"
#         if ping -c 1 -w 1 "$MYADR" ; then
#                echo "netisok"
#                else
#                echo "netiserror"
#         fi
# done
#for i in $(seq $START $ENDADDR); do
 #       echo "$i"
  #      ADRIP="$ADDRS.$i"
   #     echo "$ADRIP"
    #    if ping -c 1 -w 1 "$ADRIP" ; then
     #           echo "netisok" >> inet.log
      #  else 
       #         echo "neteserror" >> inet.log
        #fi
#done

i=$START
echo " ping start $(date '+%Y-%m-%d %H:%M:%S') " >> /home/vp/lessonm/inet.log
while [ $i -le $ENDADDR ]; do
         ADRIP="$ADDRS.$i"
         {
                 echo "$ADRIP"
                 echo "DEBUG: i=$i"
         }
         >> $LOGFILE
         PING_RESULT=$(ping -c 1 -w 1 "$ADRIP" 2>&1)
         if echo "$PING_RESULT" | grep -q "1 received"; then
               {
                echo "$PING_RESULT" "$ADRIP OK"
               } >> "$LOGFILE"
            else
              {
               echo "$PING_RESULT" "$ADRIP FAIL"
              } >> "$LOGFILE"
         fi
         ((i++))
done


