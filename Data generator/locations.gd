
[General]
Version=1

[Preferences]
Username=
Password=2436
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=LOCATIONS
Count=400

[Record]
Name=LOCATION_ID
Type=NUMBER
Size=
Data=
Master=

[Record]
Name=LOCATION_NAME
Type=VARCHAR2
Size=40
Data=City
Master=

[Record]
Name=AREA_ID
Type=NUMBER
Size=
Data=List(select area_id from areas)
Master=

