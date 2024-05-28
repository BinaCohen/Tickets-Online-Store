
[General]
Version=1

[Preferences]
Username=
Password=2466
Database=
DateFormat=
CommitCount=100
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ORDER_ITEMS
Count=400

[Record]
Name=TICKET_ID
Type=NUMBER
Size=
Data=List(select ticket_id from tickets)
Master=

[Record]
Name=ORDER_ID
Type=NUMBER
Size=
Data=List(select order_id from orders)
Master=

