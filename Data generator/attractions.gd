
[General]
Version=1

[Preferences]
Username=
Password=2641
Database=
DateFormat=
CommitCount=100
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ATTRACTIONS
Count=400

[Record]
Name=ATTRACTION_ID
Type=NUMBER
Size=
Data=
Master=

[Record]
Name=ATTRACTION_NAME
Type=VARCHAR2
Size=40
Data=List('Luna Park','Disneyland','Universal Studio','Aquarium','Zoo','National Park','Botanical Garden','Amusement Park','Beach','Museum','Water Park','Historic Landmark','Observation Deck','Wildlife Sanctuary','Science Center','Art Gallery','Adventure Park','Cultural Festival','Famous Bridge','Public Garden'
=)
Master=

[Record]
Name=DESCRIPTION
Type=VARCHAR2
Size=100
Data=Components.Description
Master=

[Record]
Name=OPENING_HOURS
Type=VARCHAR2
Size=40
Data=List('9:00 AM - 6:00 PM', '10:00 AM - 8:00 PM', '8:30 AM - 5:00 PM', '11:00 AM - 7:00 PM', '10:30 AM - 6:30 PM', '9:30 AM - 5:30 PM', '10:00 AM - 5:00 PM', '11:30 AM - 8:30 PM', '8:00 AM - 4:00 PM', '9:00 AM - 8:00 PM', '10:00 AM - 7:00 PM', '9:30 AM - 6:30 PM', '10:30 AM - 7:30 PM', '9:00 AM - 5:00 PM', '11:00 AM - 6:00 PM', '10:00 AM - 9:00 PM', '9:30 AM - 7:30 PM', '10:30 AM - 8:30 PM', '8:00 AM - 5:00 PM', '10:00 AM - 6:00 PM'
=)
Master=

[Record]
Name=LOCATION_ID
Type=NUMBER
Size=
Data=List(select location_id from locations)
Master=

