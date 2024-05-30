
[General]
Version=1

[Preferences]
Username=
Password=2200
Database=
DateFormat=
CommitCount=100
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=TICKETS
Count=400

[Record]
Name=TICKET_ID
Type=NUMBER
Size=
Data=
Master=

[Record]
Name=PRICE
Type=FLOAT
Size=22
Data=Random(20.5, 100)
Master=

[Record]
Name=VALID_FROM
Type=DATE
Size=
Data=Random(1/1/2024,1/2/2024)
Master=

[Record]
Name=VALID_UNTIL
Type=DATE
Size=
Data=Random(1/1/2026,1/2/2026)
Master=

[Record]
Name=CATEGORY_ID
Type=NUMBER
Size=
Data=List(categor_id field from categories)
Master=

[Record]
Name=ATTRACTION_ID
Type=NUMBER
Size=
Data=List(attraction_id field from attractions)
Master=

