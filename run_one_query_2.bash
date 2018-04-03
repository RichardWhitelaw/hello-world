#!/bin/bash
      Q=$1
    # Q='select from_unixtime(vmttimesecs, "yyyy-MM-dd HH:mm:ss"),vmttimesecs,flbytecount 
    #           from vmtperiodic_datarate where year=2018 and month=2 and day=2 and vmtid="19.152" order by vmttimesecs;'
   #  Q='select vmttimesecs, vmtlatitudedegree, vmtlongitudedegree
   #            from vmtperiodic where year=2018 and month=2 and day=4 and vmtid="19.139" order by vmttimesecs;'
      Q='select from_unixtime(vmttimesecs, "yyyy-MM-dd HH:mm:ss"), hubname, vmtlatitudedegree, vmtlongitudedegree
                from vmtperiodic where year=2018 and month=2 and day=4 and vmtid="19.139" order by vmttimesecs;'
   #  Q='select vmtid, sum(flbytecount) as flsum, 
   #                   sum(rlbytecount) as rlsum, 
   #                   sum(flsum,rlsum) as gtotal 
   #            from vmtperiodic_datarate_deduped where year=2016 and month=6 and day=8 group by vmtid;'
   #  Q='select vmtid, sum(flbytecount) as flsum, 
   #                   sum(rlbytecount) as rlsum  
   #            from vmtperiodic_datarate_deduped where year=2016 and month=6 and day=8 group by vmtid;'
   #  F=multiple_sum_query.sql
      echo $Q
    # /usr/bin/impala-shell --quiet -B --output_delimiter=',' -d arclight \
      #         -q "$Q" \
    # /usr/bin/impala-shell         -B --output_delimiter=',' -d arclight \
      /usr/bin/impala-shell                                   -d arclight \
                -q "$Q" \
                -o           "test_output_3" -i impala.emerald.atg.viasat.io             
              #                            -i impala.emerald.atg.viasat.io             
              # -o           "test_output" -i impala.emerald.atg.viasat.io              > stdout_capture 2>&1
     #          -o "$HOME/bin/test_output" -i dn-1.hadoop.arclight.viasat.io -d datagw  > stdout_capture 2>&1
  #          #     +++++++++++++ ----------> Store query output here.
  #   cat $HOME/bin/test_output
  #   XCODE=$?
  #   if [ $XCODE -ne 0 ];then  # If impala SQL query fails:
  #      echo "Query on vmtperiodic_4 failed with exit code=${XCODE}. Details follow" > msg_body.txt
  #      cat  stdout_capture                                                         >> msg_body.txt
  #      echo "XCODE=$XCODE"                                                         >> msg_body.txt
  #   fi
# alias impala-shell='impala-shell -i impala.emerald.atg.viasat.io'
