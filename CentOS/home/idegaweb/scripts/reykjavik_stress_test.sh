#!/bin/bash

for i in `seq 1 10`;
do
	time curl -O -s "https://rafraen.reykjavik.is/pages?[1-1000]" &
	pidlist="$pidlist $!"

	time curl -O -s "https://rafraen.reykjavik.is/pages/hlutverk?[1-1000]" &
	pidlist="$pidlist $!"

	time curl -O -s "https://rafraen.reykjavik.is/pages/notandi/sidanmin/?[1-1000]" &
	pidlist="$pidlist $!"

	time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?[1-1000]" &
	pidlist="$pidlist $!"

	time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?prm_app_application_pk=29&[1-1000]" &
	pidlist="$pidlist $!"

	time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?prm_app_application_pk=1741&[1-1000]" &
	pidlist="$pidlist $!"

	time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?[1-1000]" &
	pidlist="$pidlist $!"
done

for job in $pidlist do 
  echo $job
  wait $job || let "FAIL+=1"
done

if [ "$FAIL" == "0" ]; then
  echo "YAY!"
else 
  echo "FAIL! ($FAIL)"
fi