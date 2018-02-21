#!/bin/bash
REQUESTS_AMOUNT=2;
USERS_AMOUNT=2;
COUNTER=1;

while [  $COUNTER -lt $USERS_AMOUNT ];
do
	echo "User $COUNTER in action:";
	curl -s -w "$REQUESTS_AMOUNT parallel /pages requests executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages?[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /login requests executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages/?l_by_uuid=a8e95706-3d10-4038-8359-adabdb8bb470&login_state=login&[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /pages/hlutverk requests executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages/hlutverk?[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /pages/notandi/sidanmin requests request executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages/notandi/sidanmin/?[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /pages/umsoknir requests request executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages/umsoknir/?[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /pages/umsoknir/?prm_app_application_pk=29 requests request executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages/umsoknir/?prm_app_application_pk=29&[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /pages/umsoknir/?prm_app_application_pk=1741 requests request executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages/umsoknir/?prm_app_application_pk=1741&[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /pages/umsokni requests request executed in: %{time_total}s\\n" -o /dev/null  "https://rafraen.reykjavik.is/pages/umsoknir/?[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	curl -s -w "$REQUESTS_AMOUNT parallel /pages/login requests request executed in: %{time_total}s\\n" -o /dev/null "https://rafraen.reykjavik.is/pages/?l_by_uuid=a8e95706-3d10-4038-8359-adabdb8bb470&login_state=logoff&[1-$REQUESTS_AMOUNT]" & pidlist="$pidlist $!" 
	let COUNTER=COUNTER+1;
done;