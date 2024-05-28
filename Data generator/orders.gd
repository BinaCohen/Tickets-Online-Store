
[General]
Version=1

[Preferences]
Username=
Password=2943
Database=
DateFormat=yyy-mm-dd
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ORDERS
Count=400

[Record]
Name=ORDER_ID
Type=NUMBER
Size=
Data=
Master=

[Record]
Name=ORDER_DATE
Type=DATE
Size=
Data=Random(1/1/2010, 28/5/2024)
Master=

[Record]
Name=CUSTOMER_ID
Type=NUMBER
Size=
Data=List(select customer_id from customers)
Master=

