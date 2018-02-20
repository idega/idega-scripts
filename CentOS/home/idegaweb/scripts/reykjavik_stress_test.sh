#!/bin/bash
REQUESTS_AMOUNT=100;
USERS_AMOUNT=500;
COUNTER=1;

echo "$REQUESTS_AMOUNT requests are used:";
while [  $COUNTER -lt $USERS_AMOUNT ];
do
	echo "User $COUNTER in action:";
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages?[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/?l_by_uuid=a8e95706-3d10-4038-8359-adabdb8bb470&login_state=login&[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/hlutverk?[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/notandi/sidanmin/?[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?prm_app_application_pk=29&[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?prm_app_application_pk=1741&[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/umsoknir/?[1-$REQUESTS_AMOUNT]"
	/usr/bin/time curl -O -s "https://rafraen.reykjavik.is/pages/?l_by_uuid=a8e95706-3d10-4038-8359-adabdb8bb470&login_state=logoff&[1-$REQUESTS_AMOUNT]"
	let COUNTER=COUNTER+1;
done;