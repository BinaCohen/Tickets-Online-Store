﻿prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by Moshe Cohen on יום שלישי 02 יולי 2024
set feedback off
set define off

prompt Creating AREAS...
create table AREAS
(
  area_id   NUMBER ,
  area_name VARCHAR2(50)
)
;
alter table AREAS
  add primary key (AREA_ID);

prompt Creating LOCATIONS...
create table LOCATIONS
(
  location_id   NUMBER ,
  location_name VARCHAR2(40) not null,
  area_id       INTEGER not null
)
;
alter table LOCATIONS
  add primary key (LOCATION_ID);
alter table LOCATIONS
  add foreign key (AREA_ID)
  references AREAS (AREA_ID);

prompt Creating ATTRACTIONS...
create table ATTRACTIONS
(
  attraction_id   NUMBER ,
  attraction_name VARCHAR2(40) not null,
  description     VARCHAR2(100) not null,
  opening_hours   VARCHAR2(40) not null,
  location_id     INTEGER not null
)
;
alter table ATTRACTIONS
  add primary key (ATTRACTION_ID);
alter table ATTRACTIONS
  add foreign key (LOCATION_ID)
  references LOCATIONS (LOCATION_ID);

prompt Creating CATEGORIES...
create table CATEGORIES
(
  category_id   NUMBER ,
  category_name VARCHAR2(40) not null,
  min_age       INTEGER not null
)
;
alter table CATEGORIES
  add primary key (CATEGORY_ID);

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  customer_id     NUMBER ,
  customer_name   VARCHAR2(40) not null,
  old_phone_numer NUMBER(10) not null,
  address_line_1  VARCHAR2(40) not null,
  address_line_2  VARCHAR2(40),
  phone_number    VARCHAR2(10)
)
;
alter table CUSTOMERS
  add primary key (CUSTOMER_ID);
alter table CUSTOMERS
  add constraint UNIQUE_PHONE_NUMBER unique (PHONE_NUMBER);

prompt Creating ORDERS...
create table ORDERS
(
  order_id    NUMBER ,
  order_date  DATE default SYSDATE not null,
  customer_id INTEGER not null,
  discount    NUMBER
)
;
alter table ORDERS
  add primary key (ORDER_ID);
alter table ORDERS
  add foreign key (CUSTOMER_ID)
  references CUSTOMERS (CUSTOMER_ID);

prompt Creating TICKETS...
create table TICKETS
(
  ticket_id     NUMBER ,
  price         FLOAT not null,
  valid_from    DATE default SYSDATE not null,
  valid_until   DATE not null,
  category_id   INTEGER not null,
  attraction_id INTEGER not null
)
;
alter table TICKETS
  add primary key (TICKET_ID);
alter table TICKETS
  add foreign key (CATEGORY_ID)
  references CATEGORIES (CATEGORY_ID);
alter table TICKETS
  add foreign key (ATTRACTION_ID)
  references ATTRACTIONS (ATTRACTION_ID);
alter table TICKETS
  add constraint POSITIVE_PRICE
  check (price > 0);

prompt Creating ORDER_ITEMS...
create table ORDER_ITEMS
(
  ticket_id INTEGER not null,
  order_id  INTEGER not null
)
;
alter table ORDER_ITEMS
  add foreign key (TICKET_ID)
  references TICKETS (TICKET_ID);
alter table ORDER_ITEMS
  add foreign key (ORDER_ID)
  references ORDERS (ORDER_ID);

prompt Loading AREAS...
insert into AREAS (area_id, area_name)
values (1206, 'Nevada');
insert into AREAS (area_id, area_name)
values (1207, 'FL');
insert into AREAS (area_id, area_name)
values (1208, 'Kentucky');
insert into AREAS (area_id, area_name)
values (1209, 'Washington');
insert into AREAS (area_id, area_name)
values (1210, 'Minnesota');
insert into AREAS (area_id, area_name)
values (1211, 'FL');
insert into AREAS (area_id, area_name)
values (1212, 'VT');
insert into AREAS (area_id, area_name)
values (1213, 'AR');
insert into AREAS (area_id, area_name)
values (1214, 'DE');
insert into AREAS (area_id, area_name)
values (1215, 'PA');
insert into AREAS (area_id, area_name)
values (1216, 'Florida');
insert into AREAS (area_id, area_name)
values (1217, 'Wyoming');
insert into AREAS (area_id, area_name)
values (1218, 'IN');
insert into AREAS (area_id, area_name)
values (1219, 'Hawaii');
insert into AREAS (area_id, area_name)
values (1220, 'ME');
insert into AREAS (area_id, area_name)
values (1221, 'Oregon');
insert into AREAS (area_id, area_name)
values (1222, 'Kansas');
insert into AREAS (area_id, area_name)
values (1223, 'AK');
insert into AREAS (area_id, area_name)
values (1224, 'PA');
insert into AREAS (area_id, area_name)
values (1225, 'LA');
insert into AREAS (area_id, area_name)
values (1226, 'OK');
insert into AREAS (area_id, area_name)
values (1227, 'Oregon');
insert into AREAS (area_id, area_name)
values (1228, 'AL');
insert into AREAS (area_id, area_name)
values (1229, 'Kansas');
insert into AREAS (area_id, area_name)
values (1230, 'WY');
insert into AREAS (area_id, area_name)
values (1231, 'GA');
insert into AREAS (area_id, area_name)
values (1232, 'LA');
insert into AREAS (area_id, area_name)
values (1233, 'Minnesota');
insert into AREAS (area_id, area_name)
values (1234, 'Tennessee');
insert into AREAS (area_id, area_name)
values (1235, 'California');
insert into AREAS (area_id, area_name)
values (1236, 'Nevada');
insert into AREAS (area_id, area_name)
values (1237, 'Hawaii');
insert into AREAS (area_id, area_name)
values (1238, 'Utah');
insert into AREAS (area_id, area_name)
values (1239, 'Tennessee');
insert into AREAS (area_id, area_name)
values (1240, 'IN');
insert into AREAS (area_id, area_name)
values (1241, 'California');
insert into AREAS (area_id, area_name)
values (1242, 'LA');
insert into AREAS (area_id, area_name)
values (1243, 'NV');
insert into AREAS (area_id, area_name)
values (1244, 'Massachusetts');
insert into AREAS (area_id, area_name)
values (1245, 'Arkansas');
insert into AREAS (area_id, area_name)
values (1246, 'NE');
insert into AREAS (area_id, area_name)
values (1247, 'Vermont');
insert into AREAS (area_id, area_name)
values (1248, 'Virginia');
insert into AREAS (area_id, area_name)
values (1249, 'OR');
insert into AREAS (area_id, area_name)
values (1250, 'ME');
insert into AREAS (area_id, area_name)
values (1251, 'KY');
insert into AREAS (area_id, area_name)
values (1252, 'Nebraska');
insert into AREAS (area_id, area_name)
values (1253, 'Alaska');
insert into AREAS (area_id, area_name)
values (1254, 'LA');
insert into AREAS (area_id, area_name)
values (1255, 'WY');
insert into AREAS (area_id, area_name)
values (1256, 'Delaware');
insert into AREAS (area_id, area_name)
values (1257, 'Oklahoma');
insert into AREAS (area_id, area_name)
values (1258, 'PA');
insert into AREAS (area_id, area_name)
values (1259, 'ID');
insert into AREAS (area_id, area_name)
values (1260, 'Vermont');
insert into AREAS (area_id, area_name)
values (1261, 'Hawaii');
insert into AREAS (area_id, area_name)
values (1262, 'VA');
insert into AREAS (area_id, area_name)
values (1263, 'Florida');
insert into AREAS (area_id, area_name)
values (1264, 'CO');
insert into AREAS (area_id, area_name)
values (1265, 'Kansas');
insert into AREAS (area_id, area_name)
values (1266, 'IN');
insert into AREAS (area_id, area_name)
values (1267, 'IL');
insert into AREAS (area_id, area_name)
values (1268, 'IA');
insert into AREAS (area_id, area_name)
values (1269, 'AL');
insert into AREAS (area_id, area_name)
values (1270, 'California');
insert into AREAS (area_id, area_name)
values (1271, 'Maryland');
insert into AREAS (area_id, area_name)
values (1272, 'VA');
insert into AREAS (area_id, area_name)
values (1273, 'Kentucky');
insert into AREAS (area_id, area_name)
values (1274, 'UT');
insert into AREAS (area_id, area_name)
values (1275, 'Utah');
insert into AREAS (area_id, area_name)
values (1276, 'ME');
insert into AREAS (area_id, area_name)
values (1277, 'Nebraska');
insert into AREAS (area_id, area_name)
values (1278, 'Ohio');
insert into AREAS (area_id, area_name)
values (1279, 'Montana');
insert into AREAS (area_id, area_name)
values (1280, 'WI');
insert into AREAS (area_id, area_name)
values (1281, 'LA');
insert into AREAS (area_id, area_name)
values (1282, 'NV');
insert into AREAS (area_id, area_name)
values (1283, 'Indiana');
insert into AREAS (area_id, area_name)
values (1284, 'WA');
insert into AREAS (area_id, area_name)
values (1285, 'Michigan');
insert into AREAS (area_id, area_name)
values (1286, 'Mississippi');
insert into AREAS (area_id, area_name)
values (1287, 'MT');
insert into AREAS (area_id, area_name)
values (1288, 'Connecticut');
insert into AREAS (area_id, area_name)
values (1289, 'Pennsylvania');
insert into AREAS (area_id, area_name)
values (1290, 'HI');
insert into AREAS (area_id, area_name)
values (1291, 'OK');
insert into AREAS (area_id, area_name)
values (1292, 'Louisiana');
insert into AREAS (area_id, area_name)
values (1293, 'Louisiana');
insert into AREAS (area_id, area_name)
values (1294, 'PA');
insert into AREAS (area_id, area_name)
values (1295, 'Louisiana');
insert into AREAS (area_id, area_name)
values (1296, 'California');
insert into AREAS (area_id, area_name)
values (1297, 'Connecticut');
insert into AREAS (area_id, area_name)
values (1298, 'Wisconsin');
insert into AREAS (area_id, area_name)
values (1299, 'IA');
insert into AREAS (area_id, area_name)
values (1300, 'Oregon');
insert into AREAS (area_id, area_name)
values (1301, 'CA');
insert into AREAS (area_id, area_name)
values (1302, 'MN');
insert into AREAS (area_id, area_name)
values (1303, 'Mississippi');
insert into AREAS (area_id, area_name)
values (1304, 'Washington');
insert into AREAS (area_id, area_name)
values (1305, 'Utah');
commit;
prompt 100 records committed...
insert into AREAS (area_id, area_name)
values (1306, 'WI');
insert into AREAS (area_id, area_name)
values (1307, 'DE');
insert into AREAS (area_id, area_name)
values (1308, 'WI');
insert into AREAS (area_id, area_name)
values (1309, 'AZ');
insert into AREAS (area_id, area_name)
values (1310, 'NE');
insert into AREAS (area_id, area_name)
values (1311, 'Connecticut');
insert into AREAS (area_id, area_name)
values (1312, 'IA');
insert into AREAS (area_id, area_name)
values (1313, 'Delaware');
insert into AREAS (area_id, area_name)
values (1314, 'UT');
insert into AREAS (area_id, area_name)
values (1315, 'Indiana');
insert into AREAS (area_id, area_name)
values (1316, 'Colorado');
insert into AREAS (area_id, area_name)
values (1317, 'Oregon');
insert into AREAS (area_id, area_name)
values (1318, 'Idaho');
insert into AREAS (area_id, area_name)
values (1319, 'Montana');
insert into AREAS (area_id, area_name)
values (1320, 'NV');
insert into AREAS (area_id, area_name)
values (1321, 'IN');
insert into AREAS (area_id, area_name)
values (1322, 'Michigan');
insert into AREAS (area_id, area_name)
values (1323, 'Georgia');
insert into AREAS (area_id, area_name)
values (1324, 'Mississippi');
insert into AREAS (area_id, area_name)
values (1325, 'Arizona');
insert into AREAS (area_id, area_name)
values (1326, 'WY');
insert into AREAS (area_id, area_name)
values (1327, 'Tennessee');
insert into AREAS (area_id, area_name)
values (1328, 'Arkansas');
insert into AREAS (area_id, area_name)
values (1329, 'PA');
insert into AREAS (area_id, area_name)
values (1330, 'MN');
insert into AREAS (area_id, area_name)
values (1331, 'Arkansas');
insert into AREAS (area_id, area_name)
values (1332, 'Virginia');
insert into AREAS (area_id, area_name)
values (1333, 'CA');
insert into AREAS (area_id, area_name)
values (1334, 'UT');
insert into AREAS (area_id, area_name)
values (1335, 'AL');
insert into AREAS (area_id, area_name)
values (1336, 'DE');
insert into AREAS (area_id, area_name)
values (1337, 'Wyoming');
insert into AREAS (area_id, area_name)
values (1338, 'Arkansas');
insert into AREAS (area_id, area_name)
values (1339, 'TN');
insert into AREAS (area_id, area_name)
values (1340, 'Michigan');
insert into AREAS (area_id, area_name)
values (1341, 'Wisconsin');
insert into AREAS (area_id, area_name)
values (1342, 'Georgia');
insert into AREAS (area_id, area_name)
values (1343, 'Nebraska');
insert into AREAS (area_id, area_name)
values (1344, 'HI');
insert into AREAS (area_id, area_name)
values (1345, 'UT');
insert into AREAS (area_id, area_name)
values (1346, 'MD');
insert into AREAS (area_id, area_name)
values (1347, 'Georgia');
insert into AREAS (area_id, area_name)
values (1348, 'Arkansas');
insert into AREAS (area_id, area_name)
values (1349, 'Virginia');
insert into AREAS (area_id, area_name)
values (1350, 'IA');
insert into AREAS (area_id, area_name)
values (1351, 'NE');
insert into AREAS (area_id, area_name)
values (1352, 'AK');
insert into AREAS (area_id, area_name)
values (1353, 'AR');
insert into AREAS (area_id, area_name)
values (1354, 'CT');
insert into AREAS (area_id, area_name)
values (1355, 'Wyoming');
insert into AREAS (area_id, area_name)
values (1356, 'California');
insert into AREAS (area_id, area_name)
values (1357, 'TN');
insert into AREAS (area_id, area_name)
values (1358, 'AR');
insert into AREAS (area_id, area_name)
values (1359, 'Utah');
insert into AREAS (area_id, area_name)
values (1360, 'Hawaii');
insert into AREAS (area_id, area_name)
values (1361, 'OR');
insert into AREAS (area_id, area_name)
values (1362, 'IN');
insert into AREAS (area_id, area_name)
values (1363, 'Pennsylvania');
insert into AREAS (area_id, area_name)
values (1364, 'MT');
insert into AREAS (area_id, area_name)
values (1365, 'HI');
insert into AREAS (area_id, area_name)
values (1366, 'NV');
insert into AREAS (area_id, area_name)
values (1367, 'Wyoming');
insert into AREAS (area_id, area_name)
values (1368, 'CA');
insert into AREAS (area_id, area_name)
values (1369, 'Louisiana');
insert into AREAS (area_id, area_name)
values (1370, 'Delaware');
insert into AREAS (area_id, area_name)
values (1371, 'Connecticut');
insert into AREAS (area_id, area_name)
values (1372, 'Pennsylvania');
insert into AREAS (area_id, area_name)
values (1373, 'FL');
insert into AREAS (area_id, area_name)
values (1374, 'Kansas');
insert into AREAS (area_id, area_name)
values (1375, 'VT');
insert into AREAS (area_id, area_name)
values (1376, 'Maryland');
insert into AREAS (area_id, area_name)
values (1377, 'MD');
insert into AREAS (area_id, area_name)
values (1378, 'Florida');
insert into AREAS (area_id, area_name)
values (1379, 'MT');
insert into AREAS (area_id, area_name)
values (1380, 'FL');
insert into AREAS (area_id, area_name)
values (1381, 'IL');
insert into AREAS (area_id, area_name)
values (1382, 'Alabama');
insert into AREAS (area_id, area_name)
values (1383, 'LA');
insert into AREAS (area_id, area_name)
values (1384, 'Massachusetts');
insert into AREAS (area_id, area_name)
values (1385, 'Virginia');
insert into AREAS (area_id, area_name)
values (1386, 'OH');
insert into AREAS (area_id, area_name)
values (1387, 'Wisconsin');
insert into AREAS (area_id, area_name)
values (1388, 'Vermont');
insert into AREAS (area_id, area_name)
values (1389, 'Arkansas');
insert into AREAS (area_id, area_name)
values (1390, 'Kansas');
insert into AREAS (area_id, area_name)
values (1391, 'Pennsylvania');
insert into AREAS (area_id, area_name)
values (1392, 'AK');
insert into AREAS (area_id, area_name)
values (1393, 'Maryland');
insert into AREAS (area_id, area_name)
values (1394, 'Florida');
insert into AREAS (area_id, area_name)
values (1395, 'Michigan');
insert into AREAS (area_id, area_name)
values (1396, 'Alaska');
insert into AREAS (area_id, area_name)
values (1397, 'FL');
insert into AREAS (area_id, area_name)
values (1398, 'ME');
insert into AREAS (area_id, area_name)
values (1399, 'ME');
insert into AREAS (area_id, area_name)
values (1400, 'KY');
insert into AREAS (area_id, area_name)
values (1401, 'DE');
insert into AREAS (area_id, area_name)
values (1402, 'WY');
insert into AREAS (area_id, area_name)
values (1403, 'Kansas');
insert into AREAS (area_id, area_name)
values (1404, 'Texas');
insert into AREAS (area_id, area_name)
values (1405, 'MT');
commit;
prompt 200 records committed...
insert into AREAS (area_id, area_name)
values (1406, 'Florida');
insert into AREAS (area_id, area_name)
values (1407, 'Minnesota');
insert into AREAS (area_id, area_name)
values (1408, 'Georgia');
insert into AREAS (area_id, area_name)
values (1409, 'Hawaii');
insert into AREAS (area_id, area_name)
values (1410, 'Oklahoma');
insert into AREAS (area_id, area_name)
values (1411, 'DE');
insert into AREAS (area_id, area_name)
values (1412, 'WA');
insert into AREAS (area_id, area_name)
values (1413, 'PA');
insert into AREAS (area_id, area_name)
values (1414, 'AZ');
insert into AREAS (area_id, area_name)
values (1415, 'Virginia');
insert into AREAS (area_id, area_name)
values (1416, 'WY');
insert into AREAS (area_id, area_name)
values (1417, 'Colorado');
insert into AREAS (area_id, area_name)
values (1418, 'Montana');
insert into AREAS (area_id, area_name)
values (1419, 'OR');
insert into AREAS (area_id, area_name)
values (1420, 'Mississippi');
insert into AREAS (area_id, area_name)
values (1421, 'Texas');
insert into AREAS (area_id, area_name)
values (1422, 'Georgia');
insert into AREAS (area_id, area_name)
values (1423, 'KS');
insert into AREAS (area_id, area_name)
values (1424, 'Georgia');
insert into AREAS (area_id, area_name)
values (1425, 'Washington');
insert into AREAS (area_id, area_name)
values (1426, 'HI');
insert into AREAS (area_id, area_name)
values (1427, 'Nebraska');
insert into AREAS (area_id, area_name)
values (1428, 'MT');
insert into AREAS (area_id, area_name)
values (1429, 'VA');
insert into AREAS (area_id, area_name)
values (1430, 'Vermont');
insert into AREAS (area_id, area_name)
values (1431, 'MT');
insert into AREAS (area_id, area_name)
values (1432, 'Massachusetts');
insert into AREAS (area_id, area_name)
values (1433, 'Nevada');
insert into AREAS (area_id, area_name)
values (1434, 'Kentucky');
insert into AREAS (area_id, area_name)
values (1435, 'VT');
insert into AREAS (area_id, area_name)
values (1436, 'Utah');
insert into AREAS (area_id, area_name)
values (1437, 'Kentucky');
insert into AREAS (area_id, area_name)
values (1438, 'VT');
insert into AREAS (area_id, area_name)
values (1439, 'AZ');
insert into AREAS (area_id, area_name)
values (1440, 'LA');
insert into AREAS (area_id, area_name)
values (1441, 'Washington');
insert into AREAS (area_id, area_name)
values (1442, 'FL');
insert into AREAS (area_id, area_name)
values (1443, 'Wyoming');
insert into AREAS (area_id, area_name)
values (1444, 'LA');
insert into AREAS (area_id, area_name)
values (1445, 'NE');
insert into AREAS (area_id, area_name)
values (1446, 'Mississippi');
insert into AREAS (area_id, area_name)
values (1447, 'California');
insert into AREAS (area_id, area_name)
values (1448, 'Utah');
insert into AREAS (area_id, area_name)
values (1449, 'Tennessee');
insert into AREAS (area_id, area_name)
values (1450, 'Kansas');
insert into AREAS (area_id, area_name)
values (1451, 'Wisconsin');
insert into AREAS (area_id, area_name)
values (1452, 'MN');
insert into AREAS (area_id, area_name)
values (1453, 'MN');
insert into AREAS (area_id, area_name)
values (1454, 'Louisiana');
insert into AREAS (area_id, area_name)
values (1455, 'OK');
insert into AREAS (area_id, area_name)
values (1456, 'MN');
insert into AREAS (area_id, area_name)
values (1457, 'LA');
insert into AREAS (area_id, area_name)
values (1458, 'ID');
insert into AREAS (area_id, area_name)
values (1459, 'GA');
insert into AREAS (area_id, area_name)
values (1460, 'Maine');
insert into AREAS (area_id, area_name)
values (1461, 'AL');
insert into AREAS (area_id, area_name)
values (1462, 'Colorado');
insert into AREAS (area_id, area_name)
values (1463, 'Illinois');
insert into AREAS (area_id, area_name)
values (1464, 'DE');
insert into AREAS (area_id, area_name)
values (1465, 'Louisiana');
insert into AREAS (area_id, area_name)
values (1466, 'TN');
insert into AREAS (area_id, area_name)
values (1467, 'Washington');
insert into AREAS (area_id, area_name)
values (1468, 'ME');
insert into AREAS (area_id, area_name)
values (1469, 'AR');
insert into AREAS (area_id, area_name)
values (1470, 'Arkansas');
insert into AREAS (area_id, area_name)
values (1471, 'MD');
insert into AREAS (area_id, area_name)
values (1472, 'Mississippi');
insert into AREAS (area_id, area_name)
values (1473, 'Oregon');
insert into AREAS (area_id, area_name)
values (1474, 'Alabama');
insert into AREAS (area_id, area_name)
values (1475, 'Arizona');
insert into AREAS (area_id, area_name)
values (1476, 'UT');
insert into AREAS (area_id, area_name)
values (1477, 'MS');
insert into AREAS (area_id, area_name)
values (1478, 'ME');
insert into AREAS (area_id, area_name)
values (1479, 'MA');
insert into AREAS (area_id, area_name)
values (1480, 'Maine');
insert into AREAS (area_id, area_name)
values (1481, 'Idaho');
insert into AREAS (area_id, area_name)
values (1482, 'DE');
insert into AREAS (area_id, area_name)
values (1483, 'VT');
insert into AREAS (area_id, area_name)
values (1484, 'Mississippi');
insert into AREAS (area_id, area_name)
values (1485, 'WA');
insert into AREAS (area_id, area_name)
values (1486, 'Maine');
insert into AREAS (area_id, area_name)
values (1487, 'IN');
insert into AREAS (area_id, area_name)
values (1488, 'Tennessee');
insert into AREAS (area_id, area_name)
values (1489, 'MT');
insert into AREAS (area_id, area_name)
values (1490, 'Illinois');
insert into AREAS (area_id, area_name)
values (1491, 'NV');
insert into AREAS (area_id, area_name)
values (1492, 'FL');
insert into AREAS (area_id, area_name)
values (1493, 'AR');
insert into AREAS (area_id, area_name)
values (1494, 'Texas');
insert into AREAS (area_id, area_name)
values (1495, 'Minnesota');
insert into AREAS (area_id, area_name)
values (1496, 'Maine');
insert into AREAS (area_id, area_name)
values (1497, 'Kansas');
insert into AREAS (area_id, area_name)
values (1498, 'Maryland');
insert into AREAS (area_id, area_name)
values (1499, 'AR');
insert into AREAS (area_id, area_name)
values (1500, 'MT');
insert into AREAS (area_id, area_name)
values (1501, 'AK');
insert into AREAS (area_id, area_name)
values (1502, 'MD');
insert into AREAS (area_id, area_name)
values (1503, 'PA');
insert into AREAS (area_id, area_name)
values (1504, 'CA');
insert into AREAS (area_id, area_name)
values (1505, 'Colorado');
commit;
prompt 300 records committed...
insert into AREAS (area_id, area_name)
values (1506, 'Kentucky');
insert into AREAS (area_id, area_name)
values (1507, 'Louisiana');
insert into AREAS (area_id, area_name)
values (1508, 'AK');
insert into AREAS (area_id, area_name)
values (1509, 'Arizona');
insert into AREAS (area_id, area_name)
values (1510, 'Illinois');
insert into AREAS (area_id, area_name)
values (1511, 'KS');
insert into AREAS (area_id, area_name)
values (1512, 'MA');
insert into AREAS (area_id, area_name)
values (1513, 'MI');
insert into AREAS (area_id, area_name)
values (1514, 'Wyoming');
insert into AREAS (area_id, area_name)
values (1515, 'LA');
insert into AREAS (area_id, area_name)
values (1516, 'CO');
insert into AREAS (area_id, area_name)
values (1517, 'KS');
insert into AREAS (area_id, area_name)
values (1518, 'MN');
insert into AREAS (area_id, area_name)
values (1519, 'Ohio');
insert into AREAS (area_id, area_name)
values (1520, 'Tennessee');
insert into AREAS (area_id, area_name)
values (1521, 'Oklahoma');
insert into AREAS (area_id, area_name)
values (1522, 'California');
insert into AREAS (area_id, area_name)
values (1523, 'NE');
insert into AREAS (area_id, area_name)
values (1524, 'MO');
insert into AREAS (area_id, area_name)
values (1525, 'OH');
insert into AREAS (area_id, area_name)
values (1526, 'Arizona');
insert into AREAS (area_id, area_name)
values (1527, 'Nebraska');
insert into AREAS (area_id, area_name)
values (1528, 'ME');
insert into AREAS (area_id, area_name)
values (1529, 'AZ');
insert into AREAS (area_id, area_name)
values (1530, 'MI');
insert into AREAS (area_id, area_name)
values (1531, 'Hawaii');
insert into AREAS (area_id, area_name)
values (1532, 'FL');
insert into AREAS (area_id, area_name)
values (1533, 'OK');
insert into AREAS (area_id, area_name)
values (1534, 'Georgia');
insert into AREAS (area_id, area_name)
values (1535, 'MO');
insert into AREAS (area_id, area_name)
values (1536, 'CO');
insert into AREAS (area_id, area_name)
values (1537, 'Colorado');
insert into AREAS (area_id, area_name)
values (1538, 'TN');
insert into AREAS (area_id, area_name)
values (1539, 'Virginia');
insert into AREAS (area_id, area_name)
values (1540, 'ME');
insert into AREAS (area_id, area_name)
values (1541, 'OR');
insert into AREAS (area_id, area_name)
values (1542, 'VA');
insert into AREAS (area_id, area_name)
values (1543, 'KY');
insert into AREAS (area_id, area_name)
values (1544, 'ID');
insert into AREAS (area_id, area_name)
values (1545, 'Pennsylvania');
insert into AREAS (area_id, area_name)
values (1546, 'MT');
insert into AREAS (area_id, area_name)
values (1547, 'MI');
insert into AREAS (area_id, area_name)
values (1548, 'CT');
insert into AREAS (area_id, area_name)
values (1549, 'TX');
insert into AREAS (area_id, area_name)
values (1550, 'Illinois');
insert into AREAS (area_id, area_name)
values (1551, 'KS');
insert into AREAS (area_id, area_name)
values (1552, 'Maryland');
insert into AREAS (area_id, area_name)
values (1553, 'OH');
insert into AREAS (area_id, area_name)
values (1554, 'Alaska');
insert into AREAS (area_id, area_name)
values (1555, 'Alaska');
insert into AREAS (area_id, area_name)
values (1556, 'Indiana');
insert into AREAS (area_id, area_name)
values (1557, 'California');
insert into AREAS (area_id, area_name)
values (1558, 'Indiana');
insert into AREAS (area_id, area_name)
values (1559, 'Pennsylvania');
insert into AREAS (area_id, area_name)
values (1560, 'MA');
insert into AREAS (area_id, area_name)
values (1561, 'MO');
insert into AREAS (area_id, area_name)
values (1562, 'OR');
insert into AREAS (area_id, area_name)
values (1563, 'TN');
insert into AREAS (area_id, area_name)
values (1564, 'MS');
insert into AREAS (area_id, area_name)
values (1565, 'MN');
insert into AREAS (area_id, area_name)
values (1566, 'KY');
insert into AREAS (area_id, area_name)
values (1567, 'KS');
insert into AREAS (area_id, area_name)
values (1568, 'Oregon');
insert into AREAS (area_id, area_name)
values (1569, 'Massachusetts');
insert into AREAS (area_id, area_name)
values (1570, 'MI');
insert into AREAS (area_id, area_name)
values (1571, 'Illinois');
insert into AREAS (area_id, area_name)
values (1572, 'Nevada');
insert into AREAS (area_id, area_name)
values (1573, 'Virginia');
insert into AREAS (area_id, area_name)
values (1574, 'IL');
insert into AREAS (area_id, area_name)
values (1575, 'Virginia');
insert into AREAS (area_id, area_name)
values (1576, 'Utah');
insert into AREAS (area_id, area_name)
values (1577, 'MA');
insert into AREAS (area_id, area_name)
values (1578, 'Washington');
insert into AREAS (area_id, area_name)
values (1579, 'MT');
insert into AREAS (area_id, area_name)
values (1580, 'PA');
insert into AREAS (area_id, area_name)
values (1581, 'Oregon');
insert into AREAS (area_id, area_name)
values (1582, 'AK');
insert into AREAS (area_id, area_name)
values (1583, 'ID');
insert into AREAS (area_id, area_name)
values (1584, 'CO');
insert into AREAS (area_id, area_name)
values (1585, 'AZ');
insert into AREAS (area_id, area_name)
values (1586, 'Connecticut');
insert into AREAS (area_id, area_name)
values (1587, 'MA');
insert into AREAS (area_id, area_name)
values (1588, 'MS');
insert into AREAS (area_id, area_name)
values (1589, 'FL');
insert into AREAS (area_id, area_name)
values (1590, 'Michigan');
insert into AREAS (area_id, area_name)
values (1591, 'OK');
insert into AREAS (area_id, area_name)
values (1592, 'CO');
insert into AREAS (area_id, area_name)
values (1593, 'California');
insert into AREAS (area_id, area_name)
values (1594, 'MN');
insert into AREAS (area_id, area_name)
values (1595, 'Kentucky');
insert into AREAS (area_id, area_name)
values (1596, 'WY');
insert into AREAS (area_id, area_name)
values (1597, 'Minnesota');
insert into AREAS (area_id, area_name)
values (1598, 'IL');
insert into AREAS (area_id, area_name)
values (1599, 'MT');
insert into AREAS (area_id, area_name)
values (1600, 'TN');
insert into AREAS (area_id, area_name)
values (1601, 'Wyoming');
insert into AREAS (area_id, area_name)
values (1602, 'OR');
insert into AREAS (area_id, area_name)
values (1603, 'MO');
insert into AREAS (area_id, area_name)
values (1604, 'Florida');
insert into AREAS (area_id, area_name)
values (1605, 'Alaska');
commit;
prompt 400 records loaded
prompt Loading LOCATIONS...
insert into LOCATIONS (location_id, location_name, area_id)
values (1, 'Germantown', 1313);
insert into LOCATIONS (location_id, location_name, area_id)
values (2, 'Bruxelles', 1552);
insert into LOCATIONS (location_id, location_name, area_id)
values (3, 'Toronto', 1595);
insert into LOCATIONS (location_id, location_name, area_id)
values (4, 'Santana do parnaíba', 1562);
insert into LOCATIONS (location_id, location_name, area_id)
values (5, 'Waalwijk', 1359);
insert into LOCATIONS (location_id, location_name, area_id)
values (6, 'Kagoshima', 1403);
insert into LOCATIONS (location_id, location_name, area_id)
values (7, 'Dreieich', 1405);
insert into LOCATIONS (location_id, location_name, area_id)
values (8, 'Birkenhead', 1247);
insert into LOCATIONS (location_id, location_name, area_id)
values (9, 'Samrand', 1221);
insert into LOCATIONS (location_id, location_name, area_id)
values (10, 'São paulo', 1485);
insert into LOCATIONS (location_id, location_name, area_id)
values (11, 'Tadley', 1309);
insert into LOCATIONS (location_id, location_name, area_id)
values (12, 'Rotterdam', 1336);
insert into LOCATIONS (location_id, location_name, area_id)
values (13, 'Niigata', 1515);
insert into LOCATIONS (location_id, location_name, area_id)
values (14, 'Netanya', 1225);
insert into LOCATIONS (location_id, location_name, area_id)
values (15, 'Oldwick', 1595);
insert into LOCATIONS (location_id, location_name, area_id)
values (16, 'Berwyn', 1295);
insert into LOCATIONS (location_id, location_name, area_id)
values (17, 'Bismarck', 1214);
insert into LOCATIONS (location_id, location_name, area_id)
values (18, 'Sale', 1545);
insert into LOCATIONS (location_id, location_name, area_id)
values (19, 'Aberdeen', 1212);
insert into LOCATIONS (location_id, location_name, area_id)
values (20, 'Milwaukee', 1385);
insert into LOCATIONS (location_id, location_name, area_id)
values (21, 'Burr Ridge', 1257);
insert into LOCATIONS (location_id, location_name, area_id)
values (22, 'Bretzfeld-Waldbach', 1400);
insert into LOCATIONS (location_id, location_name, area_id)
values (23, 'Campinas', 1538);
insert into LOCATIONS (location_id, location_name, area_id)
values (24, 'Eindhoven', 1567);
insert into LOCATIONS (location_id, location_name, area_id)
values (25, 'Ankara', 1410);
insert into LOCATIONS (location_id, location_name, area_id)
values (26, 'Wellington', 1213);
insert into LOCATIONS (location_id, location_name, area_id)
values (27, 'Regensburg', 1280);
insert into LOCATIONS (location_id, location_name, area_id)
values (28, 'Calcutta', 1514);
insert into LOCATIONS (location_id, location_name, area_id)
values (29, 'El Masnou', 1341);
insert into LOCATIONS (location_id, location_name, area_id)
values (30, 'Bolton', 1322);
insert into LOCATIONS (location_id, location_name, area_id)
values (31, 'Ashland', 1417);
insert into LOCATIONS (location_id, location_name, area_id)
values (32, 'Reno', 1586);
insert into LOCATIONS (location_id, location_name, area_id)
values (33, 'Lahr', 1542);
insert into LOCATIONS (location_id, location_name, area_id)
values (34, 'Alessandria', 1474);
insert into LOCATIONS (location_id, location_name, area_id)
values (35, 'Peachtree City', 1471);
insert into LOCATIONS (location_id, location_name, area_id)
values (36, 'Ricardson', 1395);
insert into LOCATIONS (location_id, location_name, area_id)
values (37, 'Princeton', 1335);
insert into LOCATIONS (location_id, location_name, area_id)
values (38, 'Webster Groves', 1250);
insert into LOCATIONS (location_id, location_name, area_id)
values (39, 'Koppl', 1328);
insert into LOCATIONS (location_id, location_name, area_id)
values (40, 'Nantes', 1296);
insert into LOCATIONS (location_id, location_name, area_id)
values (41, 'Thames Ditton', 1433);
insert into LOCATIONS (location_id, location_name, area_id)
values (42, 'Samrand', 1513);
insert into LOCATIONS (location_id, location_name, area_id)
values (43, 'Moorestown', 1208);
insert into LOCATIONS (location_id, location_name, area_id)
values (44, 'Itu', 1418);
insert into LOCATIONS (location_id, location_name, area_id)
values (45, 'Takapuna', 1599);
insert into LOCATIONS (location_id, location_name, area_id)
values (46, 'Bergen', 1217);
insert into LOCATIONS (location_id, location_name, area_id)
values (47, 'Bernex', 1440);
insert into LOCATIONS (location_id, location_name, area_id)
values (48, 'Victoria', 1278);
insert into LOCATIONS (location_id, location_name, area_id)
values (49, 'Algermissen', 1368);
insert into LOCATIONS (location_id, location_name, area_id)
values (50, 'Edenbridge', 1334);
insert into LOCATIONS (location_id, location_name, area_id)
values (51, 'Caguas', 1261);
insert into LOCATIONS (location_id, location_name, area_id)
values (52, 'Amherst', 1597);
insert into LOCATIONS (location_id, location_name, area_id)
values (53, 'Springfield', 1324);
insert into LOCATIONS (location_id, location_name, area_id)
values (54, 'Täby', 1470);
insert into LOCATIONS (location_id, location_name, area_id)
values (55, 'Duesseldorf', 1316);
insert into LOCATIONS (location_id, location_name, area_id)
values (56, 'Cambridge', 1582);
insert into LOCATIONS (location_id, location_name, area_id)
values (57, 'Stone Mountain', 1445);
insert into LOCATIONS (location_id, location_name, area_id)
values (58, 'Gauteng', 1414);
insert into LOCATIONS (location_id, location_name, area_id)
values (59, 'Traralgon', 1557);
insert into LOCATIONS (location_id, location_name, area_id)
values (60, 'Coldmeece', 1389);
insert into LOCATIONS (location_id, location_name, area_id)
values (61, 'Herndon', 1385);
insert into LOCATIONS (location_id, location_name, area_id)
values (62, 'Moreno Valley', 1444);
insert into LOCATIONS (location_id, location_name, area_id)
values (63, 'Sendai', 1460);
insert into LOCATIONS (location_id, location_name, area_id)
values (64, 'Colorado Springs', 1231);
insert into LOCATIONS (location_id, location_name, area_id)
values (65, 'Or-yehuda', 1401);
insert into LOCATIONS (location_id, location_name, area_id)
values (66, 'Hanover', 1251);
insert into LOCATIONS (location_id, location_name, area_id)
values (67, 'Coburg', 1344);
insert into LOCATIONS (location_id, location_name, area_id)
values (68, 'L''union', 1247);
insert into LOCATIONS (location_id, location_name, area_id)
values (69, 'Norderstedt', 1215);
insert into LOCATIONS (location_id, location_name, area_id)
values (70, 'Menlo Park', 1388);
insert into LOCATIONS (location_id, location_name, area_id)
values (71, 'Lubbock', 1554);
insert into LOCATIONS (location_id, location_name, area_id)
values (72, 'Southend on Sea', 1376);
insert into LOCATIONS (location_id, location_name, area_id)
values (73, 'Mainz-kastel', 1553);
insert into LOCATIONS (location_id, location_name, area_id)
values (74, 'New York City', 1529);
insert into LOCATIONS (location_id, location_name, area_id)
values (75, 'Nynäshamn', 1240);
insert into LOCATIONS (location_id, location_name, area_id)
values (76, 'Vantaa', 1599);
insert into LOCATIONS (location_id, location_name, area_id)
values (77, 'Gelsenkirchen', 1288);
insert into LOCATIONS (location_id, location_name, area_id)
values (78, 'Essex', 1499);
insert into LOCATIONS (location_id, location_name, area_id)
values (79, 'Mount Olive', 1518);
insert into LOCATIONS (location_id, location_name, area_id)
values (80, 'Rancho Palos Verdes', 1487);
insert into LOCATIONS (location_id, location_name, area_id)
values (81, 'Uden', 1536);
insert into LOCATIONS (location_id, location_name, area_id)
values (82, 'Dalmine', 1568);
insert into LOCATIONS (location_id, location_name, area_id)
values (83, 'Bozeman', 1431);
insert into LOCATIONS (location_id, location_name, area_id)
values (84, 'Olsztyn', 1324);
insert into LOCATIONS (location_id, location_name, area_id)
values (85, 'Fambach', 1261);
insert into LOCATIONS (location_id, location_name, area_id)
values (86, 'Antwerpen', 1358);
insert into LOCATIONS (location_id, location_name, area_id)
values (87, 'Neuquen', 1226);
insert into LOCATIONS (location_id, location_name, area_id)
values (88, 'Melrose park', 1487);
insert into LOCATIONS (location_id, location_name, area_id)
values (89, 'Colorado Springs', 1480);
insert into LOCATIONS (location_id, location_name, area_id)
values (90, 'Hong Kong', 1488);
insert into LOCATIONS (location_id, location_name, area_id)
values (91, 'Hillerød', 1318);
insert into LOCATIONS (location_id, location_name, area_id)
values (92, 'Lisbon', 1605);
insert into LOCATIONS (location_id, location_name, area_id)
values (93, 'Lake worth', 1289);
insert into LOCATIONS (location_id, location_name, area_id)
values (94, 'Springfield', 1333);
insert into LOCATIONS (location_id, location_name, area_id)
values (95, 'San Francisco', 1559);
insert into LOCATIONS (location_id, location_name, area_id)
values (96, 'Eiksmarka', 1547);
insert into LOCATIONS (location_id, location_name, area_id)
values (97, 'Westfield', 1261);
insert into LOCATIONS (location_id, location_name, area_id)
values (98, 'Libertyville', 1474);
insert into LOCATIONS (location_id, location_name, area_id)
values (99, 'Bischofshofen', 1398);
insert into LOCATIONS (location_id, location_name, area_id)
values (100, 'Toyama', 1441);
commit;
prompt 100 records committed...
insert into LOCATIONS (location_id, location_name, area_id)
values (101, 'Marlboro', 1313);
insert into LOCATIONS (location_id, location_name, area_id)
values (102, 'Luzern', 1604);
insert into LOCATIONS (location_id, location_name, area_id)
values (103, 'Cuiabá', 1255);
insert into LOCATIONS (location_id, location_name, area_id)
values (104, 'Jacksonville', 1521);
insert into LOCATIONS (location_id, location_name, area_id)
values (105, 'Neuchâtel', 1456);
insert into LOCATIONS (location_id, location_name, area_id)
values (106, 'El Masnou', 1495);
insert into LOCATIONS (location_id, location_name, area_id)
values (107, 'Brampton', 1455);
insert into LOCATIONS (location_id, location_name, area_id)
values (108, 'Swarthmore', 1560);
insert into LOCATIONS (location_id, location_name, area_id)
values (109, 'Torino', 1321);
insert into LOCATIONS (location_id, location_name, area_id)
values (110, 'Minneapolis', 1371);
insert into LOCATIONS (location_id, location_name, area_id)
values (111, 'Sao roque', 1590);
insert into LOCATIONS (location_id, location_name, area_id)
values (112, 'Flushing', 1501);
insert into LOCATIONS (location_id, location_name, area_id)
values (113, 'New Hyde Park', 1561);
insert into LOCATIONS (location_id, location_name, area_id)
values (114, 'Alleroed', 1420);
insert into LOCATIONS (location_id, location_name, area_id)
values (115, 'Changwon-si', 1507);
insert into LOCATIONS (location_id, location_name, area_id)
values (116, 'Mount Olive', 1333);
insert into LOCATIONS (location_id, location_name, area_id)
values (117, 'Golden', 1554);
insert into LOCATIONS (location_id, location_name, area_id)
values (118, 'Pasadena', 1301);
insert into LOCATIONS (location_id, location_name, area_id)
values (119, 'Santa Cruz', 1400);
insert into LOCATIONS (location_id, location_name, area_id)
values (120, 'Bergara', 1310);
insert into LOCATIONS (location_id, location_name, area_id)
values (121, 'Archbold', 1276);
insert into LOCATIONS (location_id, location_name, area_id)
values (122, 'Kagoshima', 1484);
insert into LOCATIONS (location_id, location_name, area_id)
values (123, 'S. Bernardo do Campo', 1393);
insert into LOCATIONS (location_id, location_name, area_id)
values (124, 'Goteborg', 1264);
insert into LOCATIONS (location_id, location_name, area_id)
values (125, 'Tallahassee', 1285);
insert into LOCATIONS (location_id, location_name, area_id)
values (126, 'Sulzbach', 1410);
insert into LOCATIONS (location_id, location_name, area_id)
values (127, 'Long Island City', 1301);
insert into LOCATIONS (location_id, location_name, area_id)
values (128, 'Northampton', 1303);
insert into LOCATIONS (location_id, location_name, area_id)
values (129, 'Reading', 1517);
insert into LOCATIONS (location_id, location_name, area_id)
values (130, 'Lakewood', 1241);
insert into LOCATIONS (location_id, location_name, area_id)
values (131, 'Nanaimo', 1421);
insert into LOCATIONS (location_id, location_name, area_id)
values (132, 'Los Alamos', 1403);
insert into LOCATIONS (location_id, location_name, area_id)
values (133, 'Paderborn', 1288);
insert into LOCATIONS (location_id, location_name, area_id)
values (134, 'Dietikon', 1380);
insert into LOCATIONS (location_id, location_name, area_id)
values (135, 'Saint Paul', 1389);
insert into LOCATIONS (location_id, location_name, area_id)
values (136, 'Oldham', 1361);
insert into LOCATIONS (location_id, location_name, area_id)
values (137, 'Laguna Bbeach', 1282);
insert into LOCATIONS (location_id, location_name, area_id)
values (138, 'Northbrook', 1301);
insert into LOCATIONS (location_id, location_name, area_id)
values (139, 'Cle Elum', 1366);
insert into LOCATIONS (location_id, location_name, area_id)
values (140, 'West Chester', 1527);
insert into LOCATIONS (location_id, location_name, area_id)
values (141, 'San Francisco', 1371);
insert into LOCATIONS (location_id, location_name, area_id)
values (142, 'Allen', 1514);
insert into LOCATIONS (location_id, location_name, area_id)
values (143, 'Albuquerque', 1264);
insert into LOCATIONS (location_id, location_name, area_id)
values (144, 'Tokyo', 1260);
insert into LOCATIONS (location_id, location_name, area_id)
values (145, 'Bad Oeynhausen', 1273);
insert into LOCATIONS (location_id, location_name, area_id)
values (146, 'Harrisburg', 1477);
insert into LOCATIONS (location_id, location_name, area_id)
values (147, 'Guelph', 1518);
insert into LOCATIONS (location_id, location_name, area_id)
values (148, 'Trumbull', 1448);
insert into LOCATIONS (location_id, location_name, area_id)
values (149, 'Oshkosh', 1410);
insert into LOCATIONS (location_id, location_name, area_id)
values (150, 'Lublin', 1539);
insert into LOCATIONS (location_id, location_name, area_id)
values (151, 'Essen', 1227);
insert into LOCATIONS (location_id, location_name, area_id)
values (152, 'Kagoshima', 1358);
insert into LOCATIONS (location_id, location_name, area_id)
values (153, 'Durham', 1295);
insert into LOCATIONS (location_id, location_name, area_id)
values (154, 'Orleans', 1548);
insert into LOCATIONS (location_id, location_name, area_id)
values (155, 'Brussel', 1258);
insert into LOCATIONS (location_id, location_name, area_id)
values (156, 'Powell River', 1435);
insert into LOCATIONS (location_id, location_name, area_id)
values (157, 'Middleburg Heights', 1466);
insert into LOCATIONS (location_id, location_name, area_id)
values (158, 'Sundsvall', 1380);
insert into LOCATIONS (location_id, location_name, area_id)
values (159, 'Kagoshima', 1309);
insert into LOCATIONS (location_id, location_name, area_id)
values (160, 'Jacksonville', 1597);
insert into LOCATIONS (location_id, location_name, area_id)
values (161, 'Vienna', 1337);
insert into LOCATIONS (location_id, location_name, area_id)
values (162, 'Oldwick', 1543);
insert into LOCATIONS (location_id, location_name, area_id)
values (163, 'Ben-Gurion', 1332);
insert into LOCATIONS (location_id, location_name, area_id)
values (164, 'Charleston', 1479);
insert into LOCATIONS (location_id, location_name, area_id)
values (165, 'Steyr', 1258);
insert into LOCATIONS (location_id, location_name, area_id)
values (166, 'Portsmouth', 1487);
insert into LOCATIONS (location_id, location_name, area_id)
values (167, 'Ribeirao preto', 1218);
insert into LOCATIONS (location_id, location_name, area_id)
values (168, 'Caracas', 1450);
insert into LOCATIONS (location_id, location_name, area_id)
values (169, 'Kagoshima', 1264);
insert into LOCATIONS (location_id, location_name, area_id)
values (170, 'Daejeon', 1234);
insert into LOCATIONS (location_id, location_name, area_id)
values (171, 'Carlingford', 1485);
insert into LOCATIONS (location_id, location_name, area_id)
values (172, 'London', 1327);
insert into LOCATIONS (location_id, location_name, area_id)
values (173, 'Lublin', 1470);
insert into LOCATIONS (location_id, location_name, area_id)
values (174, 'Genève', 1537);
insert into LOCATIONS (location_id, location_name, area_id)
values (175, 'Burgess Hill', 1300);
insert into LOCATIONS (location_id, location_name, area_id)
values (176, 'Des Plaines', 1537);
insert into LOCATIONS (location_id, location_name, area_id)
values (177, 'Northbrook', 1252);
insert into LOCATIONS (location_id, location_name, area_id)
values (178, 'Calgary', 1318);
insert into LOCATIONS (location_id, location_name, area_id)
values (179, 'Kungki', 1401);
insert into LOCATIONS (location_id, location_name, area_id)
values (180, 'Santa Clarita', 1447);
insert into LOCATIONS (location_id, location_name, area_id)
values (181, 'Bountiful', 1242);
insert into LOCATIONS (location_id, location_name, area_id)
values (182, 'Malmö', 1592);
insert into LOCATIONS (location_id, location_name, area_id)
values (183, 'Londrina', 1361);
insert into LOCATIONS (location_id, location_name, area_id)
values (184, 'Lublin', 1548);
insert into LOCATIONS (location_id, location_name, area_id)
values (185, 'Redmond', 1522);
insert into LOCATIONS (location_id, location_name, area_id)
values (186, 'Sevilla', 1525);
insert into LOCATIONS (location_id, location_name, area_id)
values (187, 'Spresiano', 1367);
insert into LOCATIONS (location_id, location_name, area_id)
values (188, 'Market Harborough', 1252);
insert into LOCATIONS (location_id, location_name, area_id)
values (189, 'Redondo beach', 1381);
insert into LOCATIONS (location_id, location_name, area_id)
values (190, 'Calgary', 1345);
insert into LOCATIONS (location_id, location_name, area_id)
values (191, 'Almaty', 1282);
insert into LOCATIONS (location_id, location_name, area_id)
values (192, 'Immenstaad', 1587);
insert into LOCATIONS (location_id, location_name, area_id)
values (193, 'Treviso', 1556);
insert into LOCATIONS (location_id, location_name, area_id)
values (194, 'Copenhagen', 1472);
insert into LOCATIONS (location_id, location_name, area_id)
values (195, 'Burwood East', 1441);
insert into LOCATIONS (location_id, location_name, area_id)
values (196, 'Bratislava', 1470);
insert into LOCATIONS (location_id, location_name, area_id)
values (197, 'Oakland', 1355);
insert into LOCATIONS (location_id, location_name, area_id)
values (198, 'Turku', 1410);
insert into LOCATIONS (location_id, location_name, area_id)
values (199, 'Banbury', 1420);
insert into LOCATIONS (location_id, location_name, area_id)
values (200, 'New boston', 1260);
commit;
prompt 200 records committed...
insert into LOCATIONS (location_id, location_name, area_id)
values (201, 'Indianapolis', 1227);
insert into LOCATIONS (location_id, location_name, area_id)
values (202, 'Franklin', 1420);
insert into LOCATIONS (location_id, location_name, area_id)
values (203, 'New Haven', 1469);
insert into LOCATIONS (location_id, location_name, area_id)
values (204, 'Palma de Mallorca', 1208);
insert into LOCATIONS (location_id, location_name, area_id)
values (205, 'Kingston', 1582);
insert into LOCATIONS (location_id, location_name, area_id)
values (206, 'Kanazawa', 1488);
insert into LOCATIONS (location_id, location_name, area_id)
values (207, 'Chambersburg', 1311);
insert into LOCATIONS (location_id, location_name, area_id)
values (208, 'Zagreb', 1231);
insert into LOCATIONS (location_id, location_name, area_id)
values (209, 'El Masnou', 1451);
insert into LOCATIONS (location_id, location_name, area_id)
values (210, 'Lancaster', 1283);
insert into LOCATIONS (location_id, location_name, area_id)
values (211, 'Narrows', 1539);
insert into LOCATIONS (location_id, location_name, area_id)
values (212, 'Bolzano', 1537);
insert into LOCATIONS (location_id, location_name, area_id)
values (213, 'Milano', 1262);
insert into LOCATIONS (location_id, location_name, area_id)
values (214, 'Adamstown', 1572);
insert into LOCATIONS (location_id, location_name, area_id)
values (215, 'Balmoral', 1350);
insert into LOCATIONS (location_id, location_name, area_id)
values (216, 'Ebersdorf', 1289);
insert into LOCATIONS (location_id, location_name, area_id)
values (217, 'Kopavogur', 1206);
insert into LOCATIONS (location_id, location_name, area_id)
values (218, 'Hartford', 1554);
insert into LOCATIONS (location_id, location_name, area_id)
values (219, 'Stoneham', 1413);
insert into LOCATIONS (location_id, location_name, area_id)
values (220, 'Ft. Leavenworth', 1393);
insert into LOCATIONS (location_id, location_name, area_id)
values (221, 'Mississauga', 1472);
insert into LOCATIONS (location_id, location_name, area_id)
values (222, 'Flushing', 1457);
insert into LOCATIONS (location_id, location_name, area_id)
values (223, 'Barnegat', 1442);
insert into LOCATIONS (location_id, location_name, area_id)
values (224, 'Or-yehuda', 1379);
insert into LOCATIONS (location_id, location_name, area_id)
values (225, 'Paal Beringen', 1404);
insert into LOCATIONS (location_id, location_name, area_id)
values (226, 'Bay Shore', 1504);
insert into LOCATIONS (location_id, location_name, area_id)
values (227, 'Sugar Land', 1272);
insert into LOCATIONS (location_id, location_name, area_id)
values (228, 'Barnegat', 1373);
insert into LOCATIONS (location_id, location_name, area_id)
values (229, 'Carmichael', 1533);
insert into LOCATIONS (location_id, location_name, area_id)
values (230, 'Hillerød', 1299);
insert into LOCATIONS (location_id, location_name, area_id)
values (231, 'Brno', 1512);
insert into LOCATIONS (location_id, location_name, area_id)
values (232, 'Rheinfelden', 1446);
insert into LOCATIONS (location_id, location_name, area_id)
values (233, 'Richmond', 1542);
insert into LOCATIONS (location_id, location_name, area_id)
values (234, 'Kerava', 1591);
insert into LOCATIONS (location_id, location_name, area_id)
values (235, 'Genève', 1477);
insert into LOCATIONS (location_id, location_name, area_id)
values (236, 'Americana', 1362);
insert into LOCATIONS (location_id, location_name, area_id)
values (237, 'Oxford', 1232);
insert into LOCATIONS (location_id, location_name, area_id)
values (238, 'New Hope', 1466);
insert into LOCATIONS (location_id, location_name, area_id)
values (239, 'Genève', 1360);
insert into LOCATIONS (location_id, location_name, area_id)
values (240, 'Stony Point', 1484);
insert into LOCATIONS (location_id, location_name, area_id)
values (241, 'West Lafayette', 1490);
insert into LOCATIONS (location_id, location_name, area_id)
values (242, 'Anières', 1273);
insert into LOCATIONS (location_id, location_name, area_id)
values (243, 'Lexington', 1422);
insert into LOCATIONS (location_id, location_name, area_id)
values (244, 'Granada Hills', 1269);
insert into LOCATIONS (location_id, location_name, area_id)
values (245, 'El Segundo', 1379);
insert into LOCATIONS (location_id, location_name, area_id)
values (246, 'Udine', 1571);
insert into LOCATIONS (location_id, location_name, area_id)
values (247, 'Eiksmarka', 1405);
insert into LOCATIONS (location_id, location_name, area_id)
values (248, 'Walnut Creek', 1383);
insert into LOCATIONS (location_id, location_name, area_id)
values (249, 'Alessandria', 1461);
insert into LOCATIONS (location_id, location_name, area_id)
values (250, 'Nagoya', 1549);
insert into LOCATIONS (location_id, location_name, area_id)
values (251, 'Karlstad', 1450);
insert into LOCATIONS (location_id, location_name, area_id)
values (252, 'Aurora', 1581);
insert into LOCATIONS (location_id, location_name, area_id)
values (253, 'Summerside', 1601);
insert into LOCATIONS (location_id, location_name, area_id)
values (254, 'New Castle', 1435);
insert into LOCATIONS (location_id, location_name, area_id)
values (255, 'Buffalo', 1352);
insert into LOCATIONS (location_id, location_name, area_id)
values (256, 'Kristiansand', 1594);
insert into LOCATIONS (location_id, location_name, area_id)
values (257, 'New Fairfield', 1229);
insert into LOCATIONS (location_id, location_name, area_id)
values (258, 'Eisenhüttenstadt', 1370);
insert into LOCATIONS (location_id, location_name, area_id)
values (259, 'Nagoya', 1367);
insert into LOCATIONS (location_id, location_name, area_id)
values (260, 'Sao paulo', 1565);
insert into LOCATIONS (location_id, location_name, area_id)
values (261, 'Slmea', 1277);
insert into LOCATIONS (location_id, location_name, area_id)
values (262, 'Lengdorf', 1318);
insert into LOCATIONS (location_id, location_name, area_id)
values (263, 'Verwood', 1331);
insert into LOCATIONS (location_id, location_name, area_id)
values (264, 'Anières', 1434);
insert into LOCATIONS (location_id, location_name, area_id)
values (265, 'Copenhagen', 1337);
insert into LOCATIONS (location_id, location_name, area_id)
values (266, 'Leinfelden-Echterdin', 1434);
insert into LOCATIONS (location_id, location_name, area_id)
values (267, 'Brisbane', 1567);
insert into LOCATIONS (location_id, location_name, area_id)
values (268, 'Santiago', 1359);
insert into LOCATIONS (location_id, location_name, area_id)
values (269, 'Stocksbridge', 1302);
insert into LOCATIONS (location_id, location_name, area_id)
values (270, 'Lummen', 1396);
insert into LOCATIONS (location_id, location_name, area_id)
values (271, 'Fort Lewis', 1498);
insert into LOCATIONS (location_id, location_name, area_id)
values (272, 'New Hyde Park', 1231);
insert into LOCATIONS (location_id, location_name, area_id)
values (273, 'Ferraz  vasconcelos', 1371);
insert into LOCATIONS (location_id, location_name, area_id)
values (274, 'Paraju', 1410);
insert into LOCATIONS (location_id, location_name, area_id)
values (275, 'Burwood East', 1359);
insert into LOCATIONS (location_id, location_name, area_id)
values (276, 'Kungki', 1522);
insert into LOCATIONS (location_id, location_name, area_id)
values (277, 'Delafield', 1322);
insert into LOCATIONS (location_id, location_name, area_id)
values (278, 'Salem', 1244);
insert into LOCATIONS (location_id, location_name, area_id)
values (279, 'Oxford', 1401);
insert into LOCATIONS (location_id, location_name, area_id)
values (280, 'Wakayama', 1520);
insert into LOCATIONS (location_id, location_name, area_id)
values (281, 'Winterthur', 1484);
insert into LOCATIONS (location_id, location_name, area_id)
values (282, 'Di Savigliano', 1211);
insert into LOCATIONS (location_id, location_name, area_id)
values (283, 'Adamstown', 1383);
insert into LOCATIONS (location_id, location_name, area_id)
values (284, 'Neuquen', 1437);
insert into LOCATIONS (location_id, location_name, area_id)
values (285, 'Chaam', 1288);
insert into LOCATIONS (location_id, location_name, area_id)
values (286, 'Cypress', 1549);
insert into LOCATIONS (location_id, location_name, area_id)
values (287, 'Bartlesville', 1567);
insert into LOCATIONS (location_id, location_name, area_id)
values (288, 'Highton', 1588);
insert into LOCATIONS (location_id, location_name, area_id)
values (289, 'O''fallon', 1589);
insert into LOCATIONS (location_id, location_name, area_id)
values (290, 'Nagoya', 1605);
insert into LOCATIONS (location_id, location_name, area_id)
values (291, 'Kristiansand', 1255);
insert into LOCATIONS (location_id, location_name, area_id)
values (292, 'Huntsville', 1370);
insert into LOCATIONS (location_id, location_name, area_id)
values (293, 'Sevilla', 1338);
insert into LOCATIONS (location_id, location_name, area_id)
values (294, 'Bergara', 1322);
insert into LOCATIONS (location_id, location_name, area_id)
values (295, 'Slmea', 1561);
insert into LOCATIONS (location_id, location_name, area_id)
values (296, 'Virginia Beach', 1549);
insert into LOCATIONS (location_id, location_name, area_id)
values (297, 'Brisbane', 1240);
insert into LOCATIONS (location_id, location_name, area_id)
values (298, 'Rimini', 1431);
insert into LOCATIONS (location_id, location_name, area_id)
values (299, 'Knutsford', 1257);
insert into LOCATIONS (location_id, location_name, area_id)
values (300, 'Antwerpen', 1274);
commit;
prompt 300 records committed...
insert into LOCATIONS (location_id, location_name, area_id)
values (301, 'South Jordan', 1594);
insert into LOCATIONS (location_id, location_name, area_id)
values (302, 'Brisbane', 1446);
insert into LOCATIONS (location_id, location_name, area_id)
values (303, 'Rosario', 1604);
insert into LOCATIONS (location_id, location_name, area_id)
values (304, 'Mechelen', 1516);
insert into LOCATIONS (location_id, location_name, area_id)
values (305, 'Dublin', 1475);
insert into LOCATIONS (location_id, location_name, area_id)
values (306, 'Slough', 1393);
insert into LOCATIONS (location_id, location_name, area_id)
values (307, 'Redondo beach', 1605);
insert into LOCATIONS (location_id, location_name, area_id)
values (308, 'Batavia', 1425);
insert into LOCATIONS (location_id, location_name, area_id)
values (309, 'Overland park', 1588);
insert into LOCATIONS (location_id, location_name, area_id)
values (310, 'Haverhill', 1214);
insert into LOCATIONS (location_id, location_name, area_id)
values (311, 'Avon', 1381);
insert into LOCATIONS (location_id, location_name, area_id)
values (312, 'Sugar Land', 1344);
insert into LOCATIONS (location_id, location_name, area_id)
values (313, 'New York City', 1563);
insert into LOCATIONS (location_id, location_name, area_id)
values (314, 'Springfield', 1548);
insert into LOCATIONS (location_id, location_name, area_id)
values (315, 'Hilversum', 1347);
insert into LOCATIONS (location_id, location_name, area_id)
values (316, 'Douala', 1562);
insert into LOCATIONS (location_id, location_name, area_id)
values (317, 'Boucherville', 1393);
insert into LOCATIONS (location_id, location_name, area_id)
values (318, 'West Point', 1356);
insert into LOCATIONS (location_id, location_name, area_id)
values (319, 'Curitiba', 1548);
insert into LOCATIONS (location_id, location_name, area_id)
values (320, 'Hanover', 1496);
insert into LOCATIONS (location_id, location_name, area_id)
values (321, 'Goiania', 1514);
insert into LOCATIONS (location_id, location_name, area_id)
values (322, 'Hjallerup', 1366);
insert into LOCATIONS (location_id, location_name, area_id)
values (323, 'Mumbai', 1386);
insert into LOCATIONS (location_id, location_name, area_id)
values (324, 'Alleroed', 1418);
insert into LOCATIONS (location_id, location_name, area_id)
values (325, 'Sapporo', 1382);
insert into LOCATIONS (location_id, location_name, area_id)
values (326, 'Melbourne', 1359);
insert into LOCATIONS (location_id, location_name, area_id)
values (327, 'Nancy', 1323);
insert into LOCATIONS (location_id, location_name, area_id)
values (328, 'Breda', 1402);
insert into LOCATIONS (location_id, location_name, area_id)
values (329, 'Buffalo', 1567);
insert into LOCATIONS (location_id, location_name, area_id)
values (330, 'Salt Lake City', 1523);
insert into LOCATIONS (location_id, location_name, area_id)
values (331, 'Cedar Park', 1221);
insert into LOCATIONS (location_id, location_name, area_id)
values (332, 'Brampton', 1579);
insert into LOCATIONS (location_id, location_name, area_id)
values (333, 'Coburg', 1414);
insert into LOCATIONS (location_id, location_name, area_id)
values (334, 'Sao roque', 1553);
insert into LOCATIONS (location_id, location_name, area_id)
values (335, 'Melrose park', 1272);
insert into LOCATIONS (location_id, location_name, area_id)
values (336, 'Manchester', 1421);
insert into LOCATIONS (location_id, location_name, area_id)
values (337, 'Regensburg', 1400);
insert into LOCATIONS (location_id, location_name, area_id)
values (338, 'Verwood', 1453);
insert into LOCATIONS (location_id, location_name, area_id)
values (339, 'Radovljica', 1502);
insert into LOCATIONS (location_id, location_name, area_id)
values (340, 'Brno', 1549);
insert into LOCATIONS (location_id, location_name, area_id)
values (341, 'Santa Clarat', 1262);
insert into LOCATIONS (location_id, location_name, area_id)
values (342, 'East Providence', 1304);
insert into LOCATIONS (location_id, location_name, area_id)
values (343, 'The Woodlands', 1343);
insert into LOCATIONS (location_id, location_name, area_id)
values (344, 'Melrose', 1365);
insert into LOCATIONS (location_id, location_name, area_id)
values (345, 'Dublin', 1523);
insert into LOCATIONS (location_id, location_name, area_id)
values (346, 'Allen', 1417);
insert into LOCATIONS (location_id, location_name, area_id)
values (347, 'Snoqualmie', 1366);
insert into LOCATIONS (location_id, location_name, area_id)
values (348, 'Cary', 1525);
insert into LOCATIONS (location_id, location_name, area_id)
values (349, 'Columbus', 1302);
insert into LOCATIONS (location_id, location_name, area_id)
values (350, 'Kyoto', 1323);
insert into LOCATIONS (location_id, location_name, area_id)
values (351, 'Durban', 1294);
insert into LOCATIONS (location_id, location_name, area_id)
values (352, 'Bolzano', 1261);
insert into LOCATIONS (location_id, location_name, area_id)
values (353, 'El Masnou', 1462);
insert into LOCATIONS (location_id, location_name, area_id)
values (354, 'Barnegat', 1403);
insert into LOCATIONS (location_id, location_name, area_id)
values (355, 'Bradenton', 1373);
insert into LOCATIONS (location_id, location_name, area_id)
values (356, 'Fairview Heights', 1252);
insert into LOCATIONS (location_id, location_name, area_id)
values (357, 'La Plata', 1252);
insert into LOCATIONS (location_id, location_name, area_id)
values (358, 'Moscow', 1274);
insert into LOCATIONS (location_id, location_name, area_id)
values (359, 'Fukuoka', 1547);
insert into LOCATIONS (location_id, location_name, area_id)
values (360, 'Tucson', 1538);
insert into LOCATIONS (location_id, location_name, area_id)
values (361, 'Nantes', 1489);
insert into LOCATIONS (location_id, location_name, area_id)
values (362, 'Mechanicsburg', 1433);
insert into LOCATIONS (location_id, location_name, area_id)
values (363, 'Barksdale afb', 1241);
insert into LOCATIONS (location_id, location_name, area_id)
values (364, 'West Lafayette', 1235);
insert into LOCATIONS (location_id, location_name, area_id)
values (365, 'Buenos Aires', 1232);
insert into LOCATIONS (location_id, location_name, area_id)
values (366, 'Lubbock', 1561);
insert into LOCATIONS (location_id, location_name, area_id)
values (367, 'Swarthmore', 1519);
insert into LOCATIONS (location_id, location_name, area_id)
values (368, 'Toledo', 1263);
insert into LOCATIONS (location_id, location_name, area_id)
values (369, 'Alpharetta', 1340);
insert into LOCATIONS (location_id, location_name, area_id)
values (370, 'Mainz-kastel', 1244);
insert into LOCATIONS (location_id, location_name, area_id)
values (371, 'Lecanto', 1572);
insert into LOCATIONS (location_id, location_name, area_id)
values (372, 'Mississauga', 1561);
insert into LOCATIONS (location_id, location_name, area_id)
values (373, 'Westport', 1511);
insert into LOCATIONS (location_id, location_name, area_id)
values (374, 'Milan', 1499);
insert into LOCATIONS (location_id, location_name, area_id)
values (375, 'Reykjavik', 1470);
insert into LOCATIONS (location_id, location_name, area_id)
values (376, 'Heiligenhaus', 1360);
insert into LOCATIONS (location_id, location_name, area_id)
values (377, 'Villata', 1515);
insert into LOCATIONS (location_id, location_name, area_id)
values (378, 'Monroe', 1343);
insert into LOCATIONS (location_id, location_name, area_id)
values (379, 'Cambridge', 1594);
insert into LOCATIONS (location_id, location_name, area_id)
values (380, 'Louisville', 1463);
insert into LOCATIONS (location_id, location_name, area_id)
values (381, 'Wellington', 1253);
insert into LOCATIONS (location_id, location_name, area_id)
values (382, 'Frankfurt am Main', 1327);
insert into LOCATIONS (location_id, location_name, area_id)
values (383, 'Dietikon', 1504);
insert into LOCATIONS (location_id, location_name, area_id)
values (384, 'Sale', 1353);
insert into LOCATIONS (location_id, location_name, area_id)
values (385, 'Elche', 1355);
insert into LOCATIONS (location_id, location_name, area_id)
values (386, 'Hartford', 1293);
insert into LOCATIONS (location_id, location_name, area_id)
values (387, 'Fountain Hills', 1482);
insert into LOCATIONS (location_id, location_name, area_id)
values (388, 'Antwerpen', 1216);
insert into LOCATIONS (location_id, location_name, area_id)
values (389, 'Traralgon', 1221);
insert into LOCATIONS (location_id, location_name, area_id)
values (390, 'Fairfax', 1387);
insert into LOCATIONS (location_id, location_name, area_id)
values (391, 'Kyoto', 1564);
insert into LOCATIONS (location_id, location_name, area_id)
values (392, 'Tadley', 1568);
insert into LOCATIONS (location_id, location_name, area_id)
values (393, 'Mason', 1319);
insert into LOCATIONS (location_id, location_name, area_id)
values (394, 'Cannock', 1588);
insert into LOCATIONS (location_id, location_name, area_id)
values (395, 'Cape town', 1572);
insert into LOCATIONS (location_id, location_name, area_id)
values (396, 'Petach-Tikva', 1350);
insert into LOCATIONS (location_id, location_name, area_id)
values (397, 'Shoreline', 1464);
insert into LOCATIONS (location_id, location_name, area_id)
values (398, 'Sursee', 1244);
insert into LOCATIONS (location_id, location_name, area_id)
values (399, 'Tualatin', 1481);
insert into LOCATIONS (location_id, location_name, area_id)
values (400, 'Toledo', 1499);
commit;
prompt 400 records loaded
prompt Loading ATTRACTIONS...
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (1, 'Observation Deck', 'Gigabyte GA-8IRXP ATA133 + onboard Raid + USB2.0 + Lan', '10:00 AM - 9:00 PM', 38);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (2, 'Water Park', 'Linksys Wireless Access Point (WAP11)', '9:00 AM - 5:00 PM', 121);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (3, 'Observation Deck', 'Iomega Internal EIDE 250MB Zip Drive - OEM Version .', '11:30 AM - 8:30 PM', 95);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (4, 'Wildlife Sanctuary', 'Combo AMD Duron 1.1Ghz CPU and Cooler Fan w/Biostar M7VKQ-Pro M/b (Support DDR) and (Free Modem.)', '8:00 AM - 4:00 PM', 351);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (5, 'Botanical Garden', 'Combo Intel P4 2.0Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.', '09:00 AM - 06:00 PM', 173);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (6, 'Public Garden', 'Mitsumi 1.44 Floppy Drive', '10:00 AM - 9:00 PM', 386);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (7, 'Adventure Park', 'AMD XP 1900+ & Gigabyte GA-7VKML MB w/ 313M case', '10:00 AM - 9:00 PM', 356);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (8, 'Public Garden', 'AMD XP 1700+ & Gigabyte GA-7VKMLS MB w/ 313N Color Case. W/ Free PS2 Mouse.', '9:30 AM - 5:30 PM', 66);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (9, 'Universal Studio', 'AMD XP 2100+ Box w/Fan & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.', '10:00 AM - 8:00 PM', 92);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (10, 'Science Center', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8IE800 M/B + Fan.', '10:30 AM - 6:30 PM', 390);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (11, 'Famous Bridge', 'Black OptoRite 48X16X48X CD-RW Retail Box(Includes Nero 5.5 software and audio & IDE Cable ).', '10:00 AM - 7:00 PM', 121);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (12, 'Wildlife Sanctuary', 'Intel Celeron 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', '10:30 AM - 8:30 PM', 18);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (13, 'Zoo', 'SVA-USA VR-17S 17" TFT LCD Display.', '10:00 AM - 8:00 PM', 138);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (14, 'Water Park', 'Windows 2000 w/Service Pack 3(NEW) OEM Full Version LICENCED', '8:00 AM - 5:00 PM', 289);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (15, 'Historic Landmark', 'SVA-USA VR-17S 17" TFT LCD Display.', '10:30 AM - 7:30 PM', 175);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (16, 'Water Park', 'Serial ATA IDE Connector.', '10:30 AM - 7:30 PM', 365);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (17, 'Adventure Park', 'Black Complete Computer System w/ Mouse KeyBoard and Speakers(Free AMR Moden). (Duron 1.3)', '8:00 AM - 5:00 PM', 107);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (18, 'Zoo', '10ft Cat 5 network cable w/RJ45 connectors', '9:00 AM - 8:00 PM', 107);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (19, 'Science Center', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '11:00 AM - 6:00 PM', 92);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (20, 'Universal Studio', '313K 300W P4/AMD and Free Case Fan and 2 Front USB.', '10:30 AM - 7:30 PM', 270);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (21, 'Observation Deck', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B.', '11:30 AM - 8:30 PM', 321);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (22, 'Botanical Garden', 'Intel P4 1;8Ghz (478)pin 512K 3 Year MFG warr.', '09:00 AM - 06:00 PM', 19);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (23, 'Zoo', 'Biostar M6VLR skt 370 Motherboard', '8:00 AM - 5:00 PM', 111);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (24, 'Amusement Park', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', '9:00 AM - 5:00 PM', 181);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (25, 'Beach', 'AMD 1.3Ghz BareBone System Free Mouse', '8:00 AM - 4:00 PM', 304);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (26, 'National Park', 'ADS USB Turbo 2.0 WebCam.', '11:30 AM - 8:30 PM', 215);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (27, 'Aquarium', '256MB DDR 400 (PC3200) Kingston(KVR400X64C3/256)', '10:00 AM - 9:00 PM', 210);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (28, 'Public Garden', 'Combo Intel P4 1.8ghz Gigabyte GA-8LS533 m/b + fan.', '11:00 AM - 7:00 PM', 105);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (29, 'Beach', 'Removeable ATA100 hard drive tray', '9:30 AM - 7:30 PM', 258);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (30, 'Public Garden', 'PCI 56K V.92 Fax Modem', '10:00 AM - 8:00 PM', 385);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (31, 'National Park', 'CoolerMaster Thermal Compound High Performance. HTK-001', '9:30 AM - 5:30 PM', 383);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (32, 'Science Center', 'AMD XP 2500+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', '8:00 AM - 5:00 PM', 281);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (33, 'Adventure Park', 'LG 48x24x40 and 16x CD-RW/DVD OEM.', '10:30 AM - 6:30 PM', 135);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (34, 'National Park', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .', '9:00 AM - 8:00 PM', 387);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (35, 'Water Park', 'GA-8LD533 Intel®845GL Chipset VC/SC/Lan.', '9:30 AM - 7:30 PM', 111);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (36, 'Disneyland', 'MITSUMI 54X CD-Rom Black.', '10:00 AM - 5:00 PM', 256);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (37, 'Aquarium', 'Benwin S54 Surround Sound Speakers.', '11:00 AM - 7:00 PM', 315);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (38, 'Beach', 'Pentiume 4 1.8Ghz/128M/30G Black Complete System.', '10:00 AM - 6:00 PM', 126);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (39, 'Amusement Park', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7VA M/B.', '9:00 AM - 6:00 PM', 241);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (40, 'Water Park', 'MITSUMI 54X CD-Rom Black.', '9:00 AM - 6:00 PM', 362);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (41, 'Science Center', 'Combo Intel Celeron 1.1 Ghz (Box)w/Fan + Biostar M6VLQ skt 370 M/B (With / Video;sound)', '10:30 AM - 8:30 PM', 281);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (42, 'National Park', 'LG 52x24x52x CD-RW (OEM).', '10:00 AM - 5:00 PM', 228);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (43, 'Botanical Garden', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '09:00 AM - 06:00 PM', 59);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (44, 'Disneyland', 'Biostar M6TSU M/B(30 day D.O.A Warranty)', '8:30 AM - 5:00 PM', 387);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (45, 'Luna Park', 'Antec PlusView1000AMG Metallic Gray SOHO File Server without PowerSupply.', '9:30 AM - 5:30 PM', 91);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (46, 'Public Garden', 'Mitsumi Win 2000 Internet Keyboard', '9:30 AM - 6:30 PM', 314);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (47, 'National Park', 'Biostar M7VKQ Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '8:00 AM - 5:00 PM', 366);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (48, 'Wildlife Sanctuary', 'Antec PlusView1000AMG Metallic Gray SOHO File Server without PowerSupply.', '8:00 AM - 5:00 PM', 253);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (49, 'National Park', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.', '8:00 AM - 5:00 PM', 257);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (50, 'Beach', 'AMD XP 1900+ OEM', '9:00 AM - 6:00 PM', 76);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (51, 'Disneyland', 'AMD XP 2500+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', '9:00 AM - 5:00 PM', 152);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (52, 'Historic Landmark', 'AMD XP 2800+ Retail box.', '10:30 AM - 8:30 PM', 290);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (53, 'Adventure Park', 'Combo AMD Duron 1.2Ghz + Biostar M7VKQ mb & fan (Free AMR Modem.)', '10:00 AM - 6:00 PM', 15);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (54, 'Museum', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.', '11:00 AM - 7:00 PM', 351);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (55, 'Cultural Festival', 'Antec Plus 660 ATX Mid tower 330w Power Supply', '10:30 AM - 6:30 PM', 70);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (56, 'Famous Bridge', 'Mitsumi 1.44 Floppy Drive', '10:00 AM - 9:00 PM', 313);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (57, 'Beach', 'Combo AMD XP 1900+ cpu Gigabyte GA-7DXE Motherboard + Fan', '10:00 AM - 6:00 PM', 7);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (58, 'Water Park', 'AMD XP 2500+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', '9:30 AM - 6:30 PM', 198);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (59, 'Water Park', '128Mb SDRam PC133 Kingston', '10:00 AM - 7:00 PM', 316);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (60, 'Disneyland', 'Combo AMD XP 1800+ Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '10:30 AM - 6:30 PM', 293);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (61, 'Famous Bridge', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7VA M/B.', '8:30 AM - 5:00 PM', 148);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (62, 'Public Garden', 'Combo AMD XP 1800+ Gigabyte GA-7VKML M/B + Fan', '10:30 AM - 8:30 PM', 370);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (63, 'Aquarium', '128Mb RDRam 800Mhz Kingston', '11:00 AM - 6:00 PM', 97);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (64, 'Public Garden', 'Combo Intel Celeron 1.2Ghz Biostar M6VLR m/b fan (Free AMR Modem.)', '10:00 AM - 8:00 PM', 234);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (65, 'Historic Landmark', 'AMD Duron 1.1Ghz (1100 Mhz) OEM', '11:00 AM - 6:00 PM', 308);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (66, 'Historic Landmark', 'AMD Duron 1.2MHz & Biostar M7VIG-Pro MB w/ 312J case. Free PS2 Mouse.', '11:00 AM - 6:00 PM', 392);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (67, 'Water Park', 'AMD XP 3000+ Barton Box. (with 333Mhz Front Side Bus w/ 512k Cache).', '9:30 AM - 6:30 PM', 312);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (68, 'Cultural Festival', 'Logitech Smart Click 310 Camera', '10:00 AM - 6:00 PM', 51);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (69, 'Museum', 'LG 32x10x40 and 16x CD-RW/DVD OEM', '9:30 AM - 6:30 PM', 182);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (70, 'Luna Park', 'Combo AMD XP 2100+ (Box CPU); Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '9:30 AM - 6:30 PM', 35);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (71, 'Amusement Park', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B(W/8X AGP;DDR333 up to 3GB/ATA133 ) +Fan.', '11:00 AM - 6:00 PM', 222);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (72, 'Amusement Park', '6072-1 case with side window 400W Powersupply.', '9:30 AM - 6:30 PM', 239);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (73, 'Public Garden', 'Western Digital 20GB 5400RPM ATA100', '9:00 AM - 5:00 PM', 368);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (74, 'Universal Studio', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)', '10:30 AM - 8:30 PM', 390);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (75, 'Disneyland', 'GeForceFX 5200 128MB DDR (Light Version) DVI + TV-out and software DVD.', '9:30 AM - 6:30 PM', 129);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (76, 'National Park', 'USB to Parallel Printer Cable.', '9:30 AM - 5:30 PM', 152);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (77, 'Aquarium', 'GA-7VA VIA KT400 chipset 8X AGP DDR400 onboard Sound.', '10:30 AM - 6:30 PM', 240);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (78, 'Water Park', 'Combo Intel Celeron 1.7ghz Gigabyte GA-8LD533 m/b onboard sound;video ;10/100 Lan USB2.0 + fan.', '10:30 AM - 8:30 PM', 143);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (79, 'Cultural Festival', '313B Black 300W P4/AMD Fan&USB .', '8:30 AM - 5:00 PM', 50);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (80, 'Historic Landmark', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', '10:00 AM - 5:00 PM', 280);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (81, 'Amusement Park', 'Maxtor 40G 7200RPM ATA133', '10:00 AM - 7:00 PM', 225);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (82, 'Public Garden', 'AMD Duron 1.3 Ghz (Oem)', '8:00 AM - 4:00 PM', 252);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (83, 'Botanical Garden', 'AMD XP 2000+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.', '09:00 AM - 06:00 PM', 389);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (84, 'Amusement Park', 'AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.', '10:00 AM - 7:00 PM', 117);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (85, 'Amusement Park', 'Combo Intel Celeron 1.3ghz Biostar M6VLQ m/b + fan.', '9:00 AM - 6:00 PM', 77);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (86, 'Art Gallery', 'Iomega Internal EIDE 250MB Zip Drive - OEM Version .', '8:30 AM - 5:00 PM', 220);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (87, 'Luna Park', 'Intel Pentium4 2.4ghz & Gigabyte 8IRX MB w/ 313M Case.', '11:00 AM - 7:00 PM', 218);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (88, 'Famous Bridge', 'LG Goldstar 16X DVD with audio cable OEM', '9:00 AM - 8:00 PM', 43);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (89, 'Zoo', 'AMD XP 1600+ CPU (OEM)', '10:00 AM - 6:00 PM', 350);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (90, 'Amusement Park', 'MITSUMI 54X CD-Rom FX5401W .', '10:30 AM - 6:30 PM', 371);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (91, 'Historic Landmark', 'Boka 2000 Sub Woofer Speaker System', '9:00 AM - 8:00 PM', 346);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (92, 'National Park', 'Combo AMD XP 2500+ Gigabyte GA-7VA M/B.', '10:00 AM - 5:00 PM', 395);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (93, 'Aquarium', 'ASUS A7N8X Deluxe NVIDIA Force2 .', '9:30 AM - 7:30 PM', 277);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (94, 'Water Park', '312D ATX color case translucent blue(No PowerSupply).', '10:00 AM - 7:00 PM', 125);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (95, 'Museum', 'Intel Celeron 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', '9:30 AM - 7:30 PM', 396);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (96, 'Observation Deck', '2 Year Warranty On Combo''s.', '10:30 AM - 7:30 PM', 144);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (97, 'Historic Landmark', 'Intel P3 1.13 GMhz FC-PGA 256KB PC133 OEM', '9:00 AM - 5:00 PM', 43);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (98, 'Public Garden', 'Allied 300watt Powersupply; Intel P4 and AMD XP and Barton approved.', '10:30 AM - 6:30 PM', 272);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (99, 'Zoo', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply', '9:30 AM - 6:30 PM', 282);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (100, 'Adventure Park', 'ANTEC Performance PLUS Model PLUS1080 w/ Antec Original TRUE 430W P4 Power Supply.', '9:30 AM - 6:30 PM', 368);
commit;
prompt 100 records committed...
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (101, 'Universal Studio', 'SVA-USA VR-15B 15" TFT LCD Display.', '9:30 AM - 6:30 PM', 259);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (102, 'Adventure Park', 'Combo AMD Duron 1.3Ghz cpu Gigabyte GA-7VKMLS m/b fan.', '10:00 AM - 6:00 PM', 48);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (103, 'Luna Park', 'Creative Inspire 2.1 2500 surround sound', '11:30 AM - 8:30 PM', 83);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (104, 'Adventure Park', 'Combo Intel P4 2.0Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.', '10:30 AM - 7:30 PM', 130);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (105, 'Aquarium', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV', '9:30 AM - 5:30 PM', 238);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (106, 'Adventure Park', 'Black Complete Computer System w/ Mouse KeyBoard and Speakers(Free AMR Moden). (Duron 1.3)', '10:30 AM - 8:30 PM', 209);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (107, 'Cultural Festival', 'Gigabyte GA-8IPE1000 Pro (intel 865PE Chipset) Pentium 4 ;DDR400 and FSB 800.', '10:00 AM - 8:00 PM', 314);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (108, 'Famous Bridge', 'HP 1300 Laser Jet New.', '10:00 AM - 7:00 PM', 350);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (109, 'Water Park', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '10:30 AM - 6:30 PM', 270);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (110, 'Universal Studio', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.', '11:00 AM - 7:00 PM', 109);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (111, 'Museum', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.', '10:00 AM - 9:00 PM', 209);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (112, 'Water Park', 'AMD XP 2000+ Box/with AMD Fan', '8:00 AM - 4:00 PM', 80);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (113, 'Beach', 'LG 32x10x40 and 16x CD-RW/DVD OEM', '10:00 AM - 7:00 PM', 297);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (114, 'Amusement Park', 'GA-8LD533 Intel®845GL Chipset VC/SC/Lan.', '10:00 AM - 7:00 PM', 369);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (115, 'Zoo', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)', '9:00 AM - 8:00 PM', 389);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (116, 'National Park', 'ADS USB2000 USB Turbo 2.0 pci Controller card', '10:30 AM - 7:30 PM', 384);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (117, 'Botanical Garden', 'Combo AMD XP 2500+ Gigabyte GA-7VA M/B.', '09:00 AM - 06:00 PM', 189);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (118, 'Botanical Garden', 'AMD XP 2000+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.', '09:00 AM - 06:00 PM', 360);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (119, 'Cultural Festival', 'Sony 16X DVD-CDRom (OEM)', '11:30 AM - 8:30 PM', 338);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (120, 'Observation Deck', 'Intel P4 3.0Ghz FSB 800MHZ (478)pin(HT) 3 Year MFG Warr.', '9:00 AM - 8:00 PM', 205);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (121, 'Zoo', 'Mitsumi DW-7801TE DVD Duplicator/Burner.', '8:30 AM - 5:00 PM', 17);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (122, 'Botanical Garden', 'Combo Intel Celeron 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .', '09:00 AM - 06:00 PM', 70);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (123, 'Luna Park', '512Mb SDRam PC133', '9:30 AM - 6:30 PM', 283);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (124, 'Amusement Park', 'Combo AMD Duron 1.3Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '10:00 AM - 7:00 PM', 246);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (125, 'Disneyland', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', '11:00 AM - 7:00 PM', 329);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (126, 'Wildlife Sanctuary', '14"/15" Filter Screen', '11:30 AM - 8:30 PM', 385);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (127, 'Beach', 'Combo AMD Duron 1.3Ghz cpu Gigabyte GA-7VKMLS m/b fan.', '8:30 AM - 5:00 PM', 263);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (128, 'Famous Bridge', 'AMD XP 2200+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.', '9:30 AM - 5:30 PM', 44);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (129, 'National Park', 'AMD XP 2600+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.', '9:30 AM - 7:30 PM', 24);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (130, 'Luna Park', 'hp deskjet 3820 printer - specifications and warranty.', '10:30 AM - 8:30 PM', 160);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (131, 'Beach', 'Seagate Baraccuda 40Gb 7200rpm', '10:30 AM - 8:30 PM', 7);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (132, 'Adventure Park', 'Intel P4 1.8 Ghz CPU BOX (533Mhz)', '10:30 AM - 6:30 PM', 243);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (133, 'Luna Park', 'AMD Duron 1.2Ghz OEM', '8:00 AM - 4:00 PM', 229);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (134, 'Cultural Festival', 'Combo Intel Celeron 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .', '9:30 AM - 6:30 PM', 98);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (135, 'Beach', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.', '8:00 AM - 4:00 PM', 8);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (136, 'Universal Studio', 'ATI Radeon 9800 Pro 128MB Gold Edition.', '11:00 AM - 6:00 PM', 71);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (137, 'Cultural Festival', 'ATA 100 RAID controller card', '8:00 AM - 4:00 PM', 174);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (138, 'Public Garden', 'Combo AMD XP 1700+ Gigabyte GA-7VKML M/B + Fan', '10:00 AM - 8:00 PM', 220);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (139, 'Beach', 'Gigabyte GA-8IRXP ATA133 + onboard Raid + USB2.0 + Lan', '9:30 AM - 5:30 PM', 200);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (140, 'Public Garden', 'AMDXP2400/128M/30G Black Complete System.', '10:00 AM - 6:00 PM', 13);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (141, 'Luna Park', 'Intel Pentium4 3.0ghz & Asus P4C800 MB w/ Antec Performance Plus II 1040B Case.', '10:00 AM - 7:00 PM', 264);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (142, 'Cultural Festival', 'Headphone & Mic', '10:30 AM - 8:30 PM', 146);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (143, 'National Park', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.', '10:00 AM - 5:00 PM', 230);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (144, 'Art Gallery', 'GA-8LD533 Intel®845GL Chipset VC/SC/Lan.', '8:00 AM - 5:00 PM', 89);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (145, 'Cultural Festival', 'Western Digital 20GB 5400RPM ATA100', '9:30 AM - 6:30 PM', 357);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (146, 'Aquarium', 'Logitech Quick Cam W/Free Headset', '11:00 AM - 7:00 PM', 162);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (147, 'Botanical Garden', 'AMD XP 2000+ (OEM)', '09:00 AM - 06:00 PM', 135);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (148, 'Luna Park', '6066-C10 ATX Black Mid case 350W w/ 2 Front USB; 1 Mic; 1 Headset.', '9:30 AM - 5:30 PM', 126);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (149, 'Water Park', 'Intel P4 2.4ghz', '10:00 AM - 7:00 PM', 38);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (150, 'Universal Studio', 'Intel Pentium4 2.0ghz & Gigabyte 8IRX MB w/ 313N Case.', '10:30 AM - 8:30 PM', 304);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (151, 'Observation Deck', 'Combo Intel P4 2.0ghz Gigabyte GA-8LD533 m/b + fan.', '10:30 AM - 6:30 PM', 216);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (152, 'Amusement Park', 'Intel Celeron 1.1Ghz CPU Box (256K cache)PPGA2', '10:00 AM - 5:00 PM', 33);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (153, 'Famous Bridge', '5ft Cat5 network cable w/RJ45 connectors', '11:00 AM - 7:00 PM', 94);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (154, 'Luna Park', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', '11:30 AM - 8:30 PM', 228);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (155, 'Historic Landmark', '312B ATX Case 250W P4/AMD Ready Power Supply.', '9:30 AM - 7:30 PM', 113);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (156, 'Zoo', 'Combo Intel P4 2.0Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', '8:00 AM - 5:00 PM', 81);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (157, 'Wildlife Sanctuary', '10 Pack CD-R cd''s Color pack', '8:00 AM - 4:00 PM', 387);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (158, 'Water Park', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '10:00 AM - 9:00 PM', 283);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (159, 'Aquarium', 'Seagate 40GB 5400RPM ATA100', '10:00 AM - 8:00 PM', 283);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (160, 'National Park', 'AOC 17" Monitor 7Elr .27mm Dot Pitch', '10:00 AM - 7:00 PM', 370);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (161, 'Universal Studio', '64Mb RDRam SAMSUNG Must be used in pairs', '10:00 AM - 6:00 PM', 134);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (162, 'National Park', 'Combo AMD Duron 1.2Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '9:30 AM - 6:30 PM', 191);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (163, 'Wildlife Sanctuary', '512Mb DDRam PC2100 (one piece) Micron', '8:00 AM - 4:00 PM', 270);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (164, 'Observation Deck', '128Mb PC2100 266Mhz DDR Ram ( Micron )', '10:00 AM - 6:00 PM', 310);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (165, 'Zoo', 'Combo AMD XP 2500+ Biostar M7VIK Skt A MotherBoard; KT400.', '10:00 AM - 5:00 PM', 178);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (166, 'Zoo', 'CyberDrive 40X16X48X CD-R/RW Drive.', '9:00 AM - 5:00 PM', 121);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (167, 'Adventure Park', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.', '8:00 AM - 4:00 PM', 183);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (168, 'Wildlife Sanctuary', 'AMD Server Solution YS XP2000+ 266 FSB Raid Server', '9:00 AM - 8:00 PM', 96);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (169, 'Beach', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '9:30 AM - 7:30 PM', 62);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (170, 'Disneyland', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', '11:30 AM - 8:30 PM', 158);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (171, 'Amusement Park', 'Asus P4C800 Deluxe intel 875 Chip 800FSB DDR SATA ATA133 RAID GIGABIT LAN USB2.0 ATX Retail Box + In', '10:00 AM - 8:00 PM', 171);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (172, 'Universal Studio', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM', '9:00 AM - 5:00 PM', 177);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (173, 'Observation Deck', 'Intel Pentium4 2.4ghz & Gigabyte 8IRX MB w/ 313M Case.', '10:00 AM - 5:00 PM', 308);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (174, 'Art Gallery', 'AMD XP 1900+ OEM', '10:00 AM - 5:00 PM', 188);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (175, 'Water Park', '8 inch Neon blue lamp', '10:00 AM - 5:00 PM', 296);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (176, 'Science Center', 'Logitech Cordless Elite Duo Optical Kit(KB/MS)', '11:30 AM - 8:30 PM', 340);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (177, 'Zoo', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)', '9:00 AM - 8:00 PM', 290);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (178, 'Public Garden', 'AMD XP 1900+ & Gigabyte GA-7VKML MB w/ 313M case', '10:00 AM - 5:00 PM', 165);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (179, 'Beach', 'AMD Duron 1.3 Ghz (Oem)', '10:00 AM - 5:00 PM', 11);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (180, 'Water Park', 'YS AMD XP 2000+ Performance System', '9:00 AM - 5:00 PM', 376);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (181, 'Cultural Festival', 'AMD XP 1700+ & Biostar M7VKQ w/ 313N case . W/ Free AMR 56k & PS2 Mouse.', '9:00 AM - 8:00 PM', 107);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (182, 'National Park', 'Intel Pentium4 2.0ghz & Gigabyte 8IRX MB w/ 313N Case.', '11:30 AM - 8:30 PM', 388);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (183, 'Museum', 'C Rimm', '10:30 AM - 6:30 PM', 34);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (184, 'Museum', 'Intel P4 1;6Ghz Bare Bone', '9:00 AM - 5:00 PM', 363);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (185, 'Wildlife Sanctuary', 'AMD Duron 1.3 Ghz (Oem)', '10:30 AM - 8:30 PM', 63);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (186, 'Famous Bridge', 'ADS Technologies Firewire 1394 3 Port PCI', '9:30 AM - 6:30 PM', 179);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (187, 'Cultural Festival', 'Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '11:00 AM - 7:00 PM', 220);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (188, 'Observation Deck', '6066-C10 ATX Black Mid case 350W w/ 2 Front USB; 1 Mic; 1 Headset.', '11:00 AM - 6:00 PM', 133);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (189, 'Art Gallery', 'YS Intel P4 2.0Ghz Server Solution', '9:30 AM - 7:30 PM', 137);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (190, 'Disneyland', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.', '8:30 AM - 5:00 PM', 154);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (191, 'Famous Bridge', 'Allied 300watt Powersupply; Intel P4 and AMD XP and Barton approved.', '10:30 AM - 6:30 PM', 241);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (192, 'Cultural Festival', 'Intel P4 3.0Ghz FSB 800MHZ (478)pin(HT) 3 Year MFG Warr.', '10:00 AM - 8:00 PM', 355);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (193, 'Historic Landmark', 'Combo Intel P4 2.0ghz Gigabyte GA-8LD533 m/b + fan.', '9:30 AM - 7:30 PM', 259);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (194, 'National Park', 'Combo Intel P4 1.6Ghz (512k cache) 845WN M/B & Fan (478pin)', '8:30 AM - 5:00 PM', 100);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (195, 'Art Gallery', '312D ATX color case(translucent blue) with 250Watt P4/P3/AMD Ready PS.', '10:30 AM - 6:30 PM', 256);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (196, 'Luna Park', 'PowerColor 128MB USB Portable MP3 Player.', '10:00 AM - 6:00 PM', 3);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (197, 'Water Park', 'ATI Radeon 9600 256MB DVI+CRT+TV 8X .', '10:30 AM - 7:30 PM', 189);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (198, 'Famous Bridge', 'AMD XP 1800+ Biostar M7VIG Pro m/b + Cooler Master fan', '9:00 AM - 5:00 PM', 50);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (199, 'Amusement Park', 'LABTEC Internet Keyboard (Spanish Edition).', '9:30 AM - 7:30 PM', 391);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (200, 'Wildlife Sanctuary', 'Boka 306 Sub Woofer Flat Speaker system', '9:30 AM - 6:30 PM', 238);
commit;
prompt 200 records committed...
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (201, 'National Park', 'Combo AMD Duron 1.3Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '10:30 AM - 6:30 PM', 185);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (202, 'Wildlife Sanctuary', 'Intel P4 2.4 Ghz CPU BOX (533Mhz)', '9:00 AM - 5:00 PM', 157);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (203, 'Amusement Park', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKMLE MB w/ 312D Color Case. W/ Free PS2 Mouse.', '9:00 AM - 8:00 PM', 210);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (204, 'Zoo', 'Intel Pentium4 3.0ghz & Asus P4C800 MB w/ Antec Performance Plus II 1040B Case.', '9:30 AM - 7:30 PM', 276);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (205, 'Zoo', 'Cooler Master Socket A CopperHeatSync Fan HSC-V62', '10:30 AM - 8:30 PM', 85);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (206, 'Public Garden', 'ATI Radeon 7000 VIVO 64mb DDR AGP .', '8:00 AM - 5:00 PM', 171);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (207, 'Botanical Garden', 'ADS Technologies Firewire External Drive.', '09:00 AM - 06:00 PM', 191);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (208, 'Historic Landmark', 'Biostar M6TSU M/B(30 day D.O.A Warranty)', '8:00 AM - 4:00 PM', 68);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (209, 'Cultural Festival', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '10:00 AM - 6:00 PM', 379);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (210, 'Botanical Garden', 'Mouse Pad', '09:00 AM - 06:00 PM', 112);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (211, 'Aquarium', 'Combo Intel Celeron 1.1 Ghz (Box)w/Fan + Biostar M6VLQ skt 370 M/B (With / Video;sound)', '10:30 AM - 7:30 PM', 3);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (212, 'Historic Landmark', 'Intel Pentium4 1.8ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.', '9:30 AM - 7:30 PM', 171);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (213, 'Amusement Park', '1.7Ghz Intel Celeron(box)478pin+ Biostar M7SXF M/b +fan', '9:30 AM - 7:30 PM', 81);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (214, 'Adventure Park', 'Intel Celeron 2.0Ghz 478 pin Box cpu + fan', '9:00 AM - 8:00 PM', 146);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (215, 'Historic Landmark', 'YS AMD XP 2000+ Performance System', '10:30 AM - 8:30 PM', 378);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (216, 'Zoo', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoar', '8:30 AM - 5:00 PM', 27);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (217, 'Public Garden', 'Gigabyte GA-7VAC SKT A AMD® DDR400 / KT333.', '10:00 AM - 6:00 PM', 211);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (218, 'Observation Deck', 'Cooler Master ATA133 Rounded IDE Cable . PTC-A18', '9:00 AM - 5:00 PM', 59);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (219, 'Historic Landmark', 'Intel Pentium4 2.4ghz & Gigabyte GA-8IE800 MB w/ 313N Case. W/ Free PS2 Mouse.', '9:00 AM - 5:00 PM', 188);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (220, 'Amusement Park', '128Mb PC2100 266Mhz DDR Ram ( Micron )', '10:00 AM - 6:00 PM', 237);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (221, 'Botanical Garden', 'Gigabyte GA-8SMMLP SiS650GX Chipset.', '09:00 AM - 06:00 PM', 63);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (222, 'Amusement Park', 'ATI Radeon 7000 32MB DDR TV-Out&DVI', '10:00 AM - 9:00 PM', 332);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (223, 'Cultural Festival', 'Fast Ethernet 10/100 8 port switching hub', '10:00 AM - 6:00 PM', 320);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (224, 'Disneyland', 'Combo Intel Celeron 1.3ghz Biostar M6VLQ m/b + fan.', '10:00 AM - 7:00 PM', 33);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (225, 'Luna Park', 'AMD XP 2500+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', '8:30 AM - 5:00 PM', 283);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (226, 'Historic Landmark', 'Keyboard Converter from (old) standard form to (new) PS/2.', '8:00 AM - 4:00 PM', 20);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (227, 'Botanical Garden', 'Combo Intel P4 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', '09:00 AM - 06:00 PM', 350);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (228, 'Cultural Festival', '2 Year Warranty On BareBones.', '11:30 AM - 8:30 PM', 357);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (229, 'Famous Bridge', 'Combo Intel P4 3.0ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoar', '8:00 AM - 4:00 PM', 346);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (230, 'Luna Park', 'AMD XP 2000+ Box/with AMD Fan', '8:00 AM - 5:00 PM', 220);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (231, 'National Park', 'Combo Intel Celeron 1.8ghz Gigabyte GA-8LD533 m/b + fan.', '11:00 AM - 7:00 PM', 17);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (232, 'Museum', 'Combo AMD XP 1800+ Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '9:30 AM - 6:30 PM', 133);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (233, 'Cultural Festival', 'AMD XP 1700+ & Biostar M7VKQ w/ 313N case . W/ Free AMR 56k & PS2 Mouse.', '11:30 AM - 8:30 PM', 28);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (234, 'Amusement Park', 'YS Intel P4 2.0Ghz Server Solution', '9:30 AM - 7:30 PM', 351);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (235, 'Aquarium', 'Combo Intel Celeron 1.7Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .', '9:30 AM - 6:30 PM', 303);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (236, 'Luna Park', 'Intel Celeron 2.0Ghz/128M/30G Black Complete System.', '9:00 AM - 8:00 PM', 144);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (237, 'Art Gallery', 'SVA-USA VR-15B 15" TFT LCD Display.', '9:00 AM - 8:00 PM', 81);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (238, 'Museum', 'ATI Radeon 7000 VIVO 64mb DDR AGP .', '10:00 AM - 6:00 PM', 29);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (239, 'Famous Bridge', 'SIS Xabre200 64MB DDR AGP 8X DVI+TV+CRT by Power Color', '10:00 AM - 7:00 PM', 100);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (240, 'Science Center', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', '9:00 AM - 5:00 PM', 106);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (241, 'Zoo', 'Mircosoft Ergonomic Keyboard and Mouse Set.', '10:00 AM - 9:00 PM', 109);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (242, 'Science Center', 'Cooler Master ATA133 Rounded IDE Cable . PTC-A18', '8:00 AM - 4:00 PM', 139);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (243, 'Aquarium', 'Intel Celeron 1.3GHz 256k S370 FCPGA2 (Retail Box)', '11:00 AM - 7:00 PM', 94);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (244, 'Famous Bridge', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', '10:00 AM - 6:00 PM', 143);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (245, 'Famous Bridge', 'Sony 16X DVD-CDRom (OEM)', '8:00 AM - 5:00 PM', 44);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (246, 'Adventure Park', 'Intel P4 3.06 HT CPU & Intel D845PEBT2 M/B onboard Raid and S-ATA', '10:00 AM - 7:00 PM', 312);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (247, 'Disneyland', 'AMD XP 2700+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.', '11:00 AM - 6:00 PM', 232);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (248, 'Famous Bridge', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Biostar U8668 P4 M/B Socket 478 Support SD.', '10:00 AM - 5:00 PM', 261);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (249, 'Zoo', 'ATA 100 RAID controller card', '11:00 AM - 7:00 PM', 21);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (250, 'Science Center', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B.', '9:30 AM - 6:30 PM', 1);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (251, 'Amusement Park', '256MB DDR 400 (PC3200) Kingston(KVR400X64C3/256)', '9:30 AM - 5:30 PM', 2);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (252, 'National Park', 'AMD XP 1700+ & Gigabyte GA-7VKMLS MB w/ 313N Color Case. W/ Free PS2 Mouse.', '9:30 AM - 7:30 PM', 228);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (253, 'Botanical Garden', 'Western Digital 20GB 5400RPM ATA100', '09:00 AM - 06:00 PM', 249);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (254, 'Historic Landmark', 'Mitsumi optical mouse.', '10:00 AM - 8:00 PM', 352);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (255, 'Universal Studio', 'Biostar M7VKD-Pro AMD Skt A M/B VIA KT133 / 686B 266/200 Mhz FSB SD Ram ATA100(30 day D.O.A Warranty', '8:00 AM - 5:00 PM', 305);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (256, 'Aquarium', 'AMD Duron 1.2MHz & Biostar M7VIG-Pro MB w/ 312J case. Free PS2 Mouse.', '9:00 AM - 8:00 PM', 240);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (257, 'Cultural Festival', 'AMD XP 2200+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.', '9:30 AM - 6:30 PM', 91);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (258, 'Art Gallery', '6066-C10 Black Computer case w/Window panel', '11:30 AM - 8:30 PM', 86);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (259, 'Luna Park', 'Mitsumi 1.44 Floppy Drive', '9:30 AM - 6:30 PM', 134);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (260, 'Famous Bridge', 'Intel Pentium4 2.4ghz & Gigabyte GA-8IE800 MB w/ 313N Case. W/ Free PS2 Mouse.', '9:30 AM - 5:30 PM', 6);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (261, 'Amusement Park', 'Black Mitsumi CD-RW 52x24x52x.', '10:00 AM - 8:00 PM', 336);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (262, 'Observation Deck', 'AOC 17" Monitor 7Elr .27mm Dot Pitch', '9:30 AM - 7:30 PM', 165);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (263, 'Wildlife Sanctuary', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan', '10:30 AM - 8:30 PM', 45);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (264, 'Amusement Park', 'KIT Keyboard Mouse and Speakers to match color case', '8:30 AM - 5:00 PM', 215);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (265, 'Observation Deck', 'Fast Ethernet 10/100 8 port switching hub', '10:00 AM - 8:00 PM', 275);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (266, 'Science Center', '512Mb DDRam PC2100 (one piece) Micron', '9:00 AM - 5:00 PM', 74);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (267, 'Beach', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.', '10:30 AM - 6:30 PM', 33);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (268, 'Beach', 'Intel D845PESV P4 M/B DDR-333 support.', '10:00 AM - 9:00 PM', 16);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (269, 'Aquarium', 'AMD XP 2500+ Barton (OEM). (with 333Mhz Front Side Bus w/ 512k Cache).', '9:30 AM - 5:30 PM', 378);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (270, 'Botanical Garden', 'M7SXF P4 478pin Motherboard (Suppout DDR Max 3GB)(30 day D.O.A Warranty)', '09:00 AM - 06:00 PM', 95);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (271, 'Beach', 'Combo Intel Celeron 1.8ghz Gigabyte GA-8LS533 m/b + fan.', '11:00 AM - 6:00 PM', 208);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (272, 'Amusement Park', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VA M/B.', '11:00 AM - 6:00 PM', 90);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (273, 'Wildlife Sanctuary', 'Linksys Wireless PCI card (WMP11)', '10:30 AM - 7:30 PM', 164);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (274, 'Adventure Park', 'Mitsumi DW-7801TE DVD Duplicator/Burner.', '8:30 AM - 5:00 PM', 378);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (275, 'Zoo', 'Intel Celeron 1.7Ghz/128M/30G Black Complete System.', '10:00 AM - 6:00 PM', 269);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (276, 'Amusement Park', 'M7SXF P4 478pin Motherboard (Suppout DDR Max 3GB)(30 day D.O.A Warranty)', '11:00 AM - 7:00 PM', 127);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (277, 'Museum', 'Intel Celeron 1.2Ghz & Biostar M6VLR MB w/ 312J Color Case. W/ Free AMR 56k & PS2 Mouse.', '8:00 AM - 5:00 PM', 81);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (278, 'National Park', 'Intel D 850MV P4 M/B RDRam support', '10:30 AM - 8:30 PM', 20);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (279, 'Aquarium', 'Sony Black 16X DVD .', '11:00 AM - 7:00 PM', 180);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (280, 'Cultural Festival', 'MITSUMI 54X CD-Rom FX5401W .', '8:00 AM - 5:00 PM', 300);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (281, 'Cultural Festival', 'AMD XP 2500+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', '10:30 AM - 6:30 PM', 177);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (282, 'Wildlife Sanctuary', 'AMD XP 1800+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', '8:30 AM - 5:00 PM', 139);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (283, 'Public Garden', 'Allied 300watt Powersupply; Intel P4 and AMD XP and Barton approved.', '9:00 AM - 6:00 PM', 45);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (284, 'Universal Studio', 'Biostar M6VLR skt 370 Motherboard', '11:30 AM - 8:30 PM', 339);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (285, 'Wildlife Sanctuary', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VA M/B.', '10:00 AM - 5:00 PM', 379);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (286, 'Historic Landmark', 'Benwin S54 Surround Sound Speakers.', '8:00 AM - 4:00 PM', 149);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (287, 'Famous Bridge', '512Mb SDRam PC133 Kingston', '10:00 AM - 7:00 PM', 381);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (288, 'Museum', 'AMD XP 2200+ Retail box.', '10:00 AM - 7:00 PM', 210);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (289, 'Historic Landmark', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply', '9:00 AM - 6:00 PM', 365);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (290, 'Amusement Park', 'Combo AMD XP 2000 Biostar M7VIK Skt A MotherBoard; KT400.', '10:00 AM - 9:00 PM', 32);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (291, 'Water Park', 'PowerColor 128MB USB Portable MP3 Player.', '8:30 AM - 5:00 PM', 395);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (292, 'Public Garden', 'Creative Inspire 5200 5.1 surround sound.', '10:00 AM - 9:00 PM', 385);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (293, 'Art Gallery', 'Asus P4C800 Deluxe intel 875 Chip 800FSB DDR SATA ATA133 RAID GIGABIT LAN USB2.0 ATX Retail Box + In', '10:00 AM - 9:00 PM', 241);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (294, 'Science Center', 'Case Fan 3 1/2"(80mm) 12V', '10:00 AM - 9:00 PM', 220);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (295, 'Adventure Park', 'Combo Intel P4 3.0ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoar', '9:00 AM - 8:00 PM', 260);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (296, 'Science Center', 'AMD XP 2100+ (Box) & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', '9:30 AM - 7:30 PM', 119);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (297, 'Public Garden', '512Mb DDR 333 PC2700 (samsung)', '10:00 AM - 6:00 PM', 12);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (298, 'Zoo', 'Combo AMD Duron 1.2Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', '8:30 AM - 5:00 PM', 262);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (299, 'Adventure Park', 'ATA 100 Controller Card PCI', '10:00 AM - 7:00 PM', 186);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (300, 'Aquarium', 'AMD Duron 1.1Ghz (1100 Mhz) OEM', '10:30 AM - 8:30 PM', 126);
commit;
prompt 300 records committed...
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (301, 'Beach', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B(W/8X AGP;DDR333 up to 3GB/ATA133 ) +Fan.', '10:30 AM - 7:30 PM', 263);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (302, 'Historic Landmark', 'Combo Intel Celeron 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', '10:00 AM - 6:00 PM', 305);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (303, 'Disneyland', 'LG 48x24x40 and 16x CD-RW/DVD OEM.', '9:30 AM - 5:30 PM', 298);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (304, 'Famous Bridge', 'Assembly CPU/Fan; Motherboard; Case; and Other Products.', '10:30 AM - 6:30 PM', 54);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (305, 'Art Gallery', 'AMD XP 1800+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', '9:30 AM - 5:30 PM', 30);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (306, 'Disneyland', 'Creative Inspire 2.1 2500 surround sound', '11:00 AM - 6:00 PM', 165);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (307, 'Famous Bridge', '512MB DDR400 PC3200 Kingston(KVR400X64C25/512 )', '10:00 AM - 6:00 PM', 112);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (308, 'Art Gallery', 'Combo Intel P4 2.0ghz Gigabyte GA-8LS533 m/b + fan.', '10:00 AM - 7:00 PM', 358);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (309, 'Famous Bridge', 'Headphone & Mic', '8:30 AM - 5:00 PM', 275);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (310, 'National Park', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply', '8:00 AM - 5:00 PM', 6);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (311, 'Disneyland', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', '10:00 AM - 9:00 PM', 7);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (312, 'Amusement Park', '512MB DDR400 PC3200 Kingston(KVR400X64C25/512 )', '8:00 AM - 4:00 PM', 177);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (313, 'Botanical Garden', '313B Black 300W P4/AMD Fan&USB .', '09:00 AM - 06:00 PM', 164);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (314, 'Universal Studio', 'Combo AMD XP 1900+ cpu Gigabyte GA-7ZXE Motherboard + Fan', '11:00 AM - 7:00 PM', 209);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (315, 'Disneyland', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', '9:30 AM - 7:30 PM', 303);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (316, 'Science Center', 'Combo Intel P4 3.06ghz CPU + Fan(BOx)with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard.', '10:00 AM - 9:00 PM', 6);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (317, 'National Park', 'AMD XP 1900+ OEM', '11:00 AM - 6:00 PM', 139);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (318, 'Historic Landmark', 'Biostar M7TDR P4 M/B Skt 423 (w/30 day limit warranty)', '11:00 AM - 7:00 PM', 55);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (319, 'Museum', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV', '10:30 AM - 6:30 PM', 332);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (320, 'Botanical Garden', 'Biostar M6TSU M/B(30 day D.O.A Warranty)', '09:00 AM - 06:00 PM', 377);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (321, 'Observation Deck', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', '10:00 AM - 8:00 PM', 192);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (322, 'Public Garden', 'Mouse Pad', '9:30 AM - 6:30 PM', 393);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (323, 'Historic Landmark', '256Mb SDRam PC133 Kingston', '10:30 AM - 8:30 PM', 317);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (324, 'Famous Bridge', 'Logitech Cordless Optical Mouse.', '9:00 AM - 6:00 PM', 127);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (325, 'Luna Park', 'Combo Intel Celeron 1.3ghz Biostar M6VLQ m/b + fan.', '10:00 AM - 9:00 PM', 145);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (326, 'Beach', 'Seagate 120GB Serial ATA150 7200RPM.', '9:00 AM - 6:00 PM', 319);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (327, 'Adventure Park', '313M ATX color Case blue 300W P4 w/ front USB & case fan', '9:00 AM - 8:00 PM', 46);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (328, 'Science Center', 'C Rimm', '10:00 AM - 5:00 PM', 278);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (329, 'Amusement Park', 'Sony 48x24x40 and 16x CD-RW/DVD OEM.', '10:30 AM - 8:30 PM', 321);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (330, 'Museum', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoar', '10:00 AM - 6:00 PM', 248);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (331, 'Luna Park', 'Boka 306 Sub Woofer Flat Speaker system', '11:30 AM - 8:30 PM', 345);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (332, 'Disneyland', 'Combo Intel P4 2.0Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', '9:30 AM - 7:30 PM', 308);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (333, 'Amusement Park', 'BIOSTAR M6TSL skt370 m/b (30 day D.O.A Warranty)', '10:30 AM - 7:30 PM', 218);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (334, 'National Park', 'AMD XP2000+ Biostar M7VKQ Pro', '9:00 AM - 5:00 PM', 192);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (335, 'Public Garden', 'Intel P4 2.4G BareBone System W/ Free Mouse.', '10:00 AM - 9:00 PM', 155);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (336, 'Observation Deck', 'Intel Pentium4 1.8Ghz & Biostar U8668D MB w/ 313M case. W/ Free CNR 56k & PS2 Mouse.', '10:00 AM - 9:00 PM', 32);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (337, 'Adventure Park', 'Intel Pentium4 2.0ghz & Gigabyte 8IE533 MB w/ 313N Case. W/ Free PS2 Mouse.', '9:00 AM - 8:00 PM', 389);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (338, 'Universal Studio', 'ASUS P4SDX SiS655 Chipset Dual Channel DDR333.', '11:00 AM - 7:00 PM', 34);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (339, 'Public Garden', 'AOC LM520 Flat Screen (LCD) 15" Monitor', '10:30 AM - 6:30 PM', 8);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (340, 'Cultural Festival', 'Headphone & Mic', '8:30 AM - 5:00 PM', 270);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (341, 'Zoo', 'ASUS P4C800 Deluxe Skt 478 Intel 875P (800MHZ FSB).', '11:00 AM - 6:00 PM', 312);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (342, 'Famous Bridge', '313B Black 300W P4/AMD Fan&USB .', '9:00 AM - 6:00 PM', 202);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (343, 'Public Garden', 'AMD XP 1800+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', '9:00 AM - 6:00 PM', 298);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (344, 'Art Gallery', 'Combo Intel Celeron 1.2Ghz Biostar M6VLR m/b fan (Free AMR Modem.)', '10:00 AM - 7:00 PM', 326);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (345, 'Public Garden', 'AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.', '10:00 AM - 6:00 PM', 267);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (346, 'Observation Deck', 'Combo Intel Celeron 1.1Ghz (Box)Tulatin core Biostar M6VLR m/b (Free AMR Modem.)', '9:30 AM - 6:30 PM', 345);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (347, 'National Park', 'Combo AMD XP 2100+ (Box CPU) Biostar M7VKQ Pro m/b Cooler Master Fan', '10:00 AM - 9:00 PM', 359);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (348, 'Cultural Festival', 'Combo AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2', '10:00 AM - 8:00 PM', 263);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (349, 'Disneyland', 'Gigabyte GA-7VAXP AMD Motherboard. VIA KT400 RAID ATA133 with DDR support', '9:00 AM - 8:00 PM', 12);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (350, 'Historic Landmark', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7VA M/B.', '9:00 AM - 5:00 PM', 7);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (351, 'Cultural Festival', 'Intel P4 1;8Ghz (478)pin 512K 3 Year MFG warr.', '9:30 AM - 6:30 PM', 341);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (352, 'Public Garden', 'Intel P4 1.8 Ghz CPU BOX (533Mhz)', '9:30 AM - 6:30 PM', 375);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (353, 'Botanical Garden', 'Antec Plus 660 ATX Mid tower 330w Power Supply', '09:00 AM - 06:00 PM', 255);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (354, 'Disneyland', 'SVA-USA VR-17S 17" TFT LCD Display.', '9:30 AM - 6:30 PM', 104);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (355, 'Adventure Park', 'Intel Celeron 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', '10:30 AM - 8:30 PM', 283);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (356, 'Museum', 'Combo Intel P4 1.6Ghz (512k cache) 845WN M/B & Fan (478pin)', '10:00 AM - 8:00 PM', 267);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (357, 'Disneyland', 'AMD XP 2200+ CPU Oem', '10:00 AM - 5:00 PM', 135);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (358, 'Art Gallery', 'Intel P4 3.06 HT CPU & Intel D845PEBT2 M/B onboard Raid and S-ATA', '10:00 AM - 8:00 PM', 397);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (359, 'Cultural Festival', 'Seagate 40GB 5400RPM ATA100', '10:00 AM - 5:00 PM', 386);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (360, 'Art Gallery', '4 Port USB 2.0 High-Speed PCI Card', '10:30 AM - 6:30 PM', 326);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (361, 'Aquarium', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.', '10:00 AM - 7:00 PM', 288);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (362, 'Disneyland', '14inch LCD MG-015A Xgen2 Monitor.', '11:00 AM - 7:00 PM', 167);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (363, 'Wildlife Sanctuary', 'AMD XP 2200+ & Gigabyte 7DXE w/ 313M case . W/ Free PS2 Mouse.', '10:30 AM - 8:30 PM', 94);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (364, 'Famous Bridge', '313K 300W P4/AMD and 2 Front USB.', '10:00 AM - 9:00 PM', 398);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (365, 'Public Garden', 'Microsoft Wireless Optical Desktop .', '9:00 AM - 5:00 PM', 329);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (366, 'Water Park', 'PCI 56K V.92 Fax Modem', '11:30 AM - 8:30 PM', 92);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (367, 'Beach', 'Combo Intel Celeron 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .', '10:30 AM - 7:30 PM', 364);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (368, 'Art Gallery', 'AMD XP 2200+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', '9:00 AM - 6:00 PM', 59);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (369, 'Botanical Garden', 'Combo Intel P4 1.9Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.', '09:00 AM - 06:00 PM', 327);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (370, 'Museum', 'CoolerMaster Thermal Compound Premium PTK-001.', '10:30 AM - 6:30 PM', 119);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (371, 'Disneyland', '512Mb DDR PC2100 Kingston', '11:00 AM - 6:00 PM', 340);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (372, 'Historic Landmark', 'Gigabyte GA-7VAXP AMD Motherboard. VIA KT400 RAID ATA133 with DDR support', '11:00 AM - 7:00 PM', 98);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (373, 'National Park', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.', '9:00 AM - 6:00 PM', 275);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (374, 'Zoo', '312B ATX Case with 300W P4/P3/AMD PS. USB Ready.', '10:00 AM - 7:00 PM', 144);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (375, 'Luna Park', 'Combo Intel Celeron 1.7Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .', '11:30 AM - 8:30 PM', 35);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (376, 'Botanical Garden', 'AMD XP 1800+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.', '09:00 AM - 06:00 PM', 383);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (377, 'Botanical Garden', 'Combo Intel Celeron 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .', '09:00 AM - 06:00 PM', 369);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (378, 'Observation Deck', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B(W/8X AGP;DDR333 up to 3GB/ATA133 ) +Fan.', '9:30 AM - 5:30 PM', 280);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (379, 'Botanical Garden', 'Intel Celeron 2.0Ghz/128M/30G Black Complete System.', '09:00 AM - 06:00 PM', 199);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (380, 'Amusement Park', 'Intel P4 2.4 Ghz CPU BOX (533Mhz)', '9:00 AM - 8:00 PM', 143);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (381, 'Public Garden', 'Keyboard Converter from (old) standard form to (new) PS/2.', '9:30 AM - 7:30 PM', 82);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (382, 'Historic Landmark', 'Headset with Mircophone.', '10:00 AM - 5:00 PM', 338);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (383, 'Botanical Garden', '512Mb SDRam PC133', '09:00 AM - 06:00 PM', 195);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (384, 'Science Center', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKMLE MB w/ 312D Color Case. W/ Free PS2 Mouse.', '11:00 AM - 6:00 PM', 239);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (385, 'Zoo', 'Combo AMD XP 2100+ w/ Cpu Fan & Biostar M7VKQ +', '10:30 AM - 6:30 PM', 39);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (386, 'National Park', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7VA M/B.', '9:00 AM - 5:00 PM', 98);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (387, 'Famous Bridge', 'Intel Celeron 2.2Ghz 478 pin Box cpu + fan', '10:00 AM - 8:00 PM', 278);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (388, 'Beach', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.', '8:30 AM - 5:00 PM', 240);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (389, 'Adventure Park', 'Combo Intel P4 3.0ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoar', '10:30 AM - 7:30 PM', 293);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (390, 'Art Gallery', 'Antec Plus 660 ATX Mid tower 330w Power Supply', '11:00 AM - 7:00 PM', 387);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (391, 'Aquarium', 'Intel Celeron 2.0Ghz 478 pin Box cpu + fan', '10:00 AM - 7:00 PM', 267);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (392, 'Aquarium', 'MicroSoft Windows Server 2003 W/ 10 Licenses.', '10:00 AM - 8:00 PM', 300);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (393, 'Cultural Festival', 'Intel Pentium4 1.6Ghz & Biostar M7TDB MB w/ 313M Case.', '9:30 AM - 6:30 PM', 196);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (394, 'Museum', '313H ATX 400w Case W/ case Fan P4/P3/AMD.', '9:30 AM - 6:30 PM', 152);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (395, 'Water Park', '256MB DDR 400 (PC3200) Kingston(KVR400X64C3/256)', '8:00 AM - 5:00 PM', 220);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (396, 'Historic Landmark', 'Mitsumi optical mouse.', '10:30 AM - 8:30 PM', 228);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (397, 'Aquarium', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.', '8:00 AM - 5:00 PM', 280);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (398, 'Amusement Park', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', '10:00 AM - 5:00 PM', 337);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (399, 'Museum', 'ATI Radeon 9600 256MB DVI+CRT+TV 8X .', '10:00 AM - 5:00 PM', 308);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (400, 'Science Center', 'Sony 16X DVD-CDRom (OEM)', '10:00 AM - 7:00 PM', 169);
commit;
prompt 400 records committed...
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (401, 'Golden Gate Bridge', 'It is an iconic symbol of San Francisco and California.', '24/7', 1);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (402, 'Golden Gate Bridge', 'It is an iconic symbol of San Francisco and California.', '24/7', 300);
commit;
prompt 402 records loaded
prompt Loading CATEGORIES...
insert into CATEGORIES (category_id, category_name, min_age)
values (1, 'Adult', 18);
insert into CATEGORIES (category_id, category_name, min_age)
values (2, 'Teenager', 13);
insert into CATEGORIES (category_id, category_name, min_age)
values (3, 'Child', 0);
commit;
prompt 3 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (1, 'Dorey Nacey', 1234567890, '83 Clyde Gallagher Crossing', 'Suite 21', null);
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (2, 'Rhodie Dainty', 6242738669, '747 Warbler Center', 'Suite 52', '6242738669');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (3, 'Jobey Abrahm', 4734466220, '21701 Sheridan Court', 'Suite 6', '4734466220');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (4, 'Ryley Trobridge', 2785068828, '05 Hayes Center', 'Apt 1357', '2785068828');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (5, 'Elbertina Farrah', 6706256225, '26 Monica Lane', 'Suite 27', '6706256225');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (6, 'Vale McNess', 2698846507, '377 Independence Road', 'Apt 1947', '2698846507');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (7, 'Oralla Ethridge', 5101711356, '9 Atwood Street', 'Apt 311', '5101711356');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (8, 'Sarah Caen', 2784782898, '862 Bluestem Lane', 'Room 1429', '2784782898');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (9, 'Jana Beglin', 2674184360, '5260 Badeau Park', '7th Floor', '2674184360');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (10, 'Douglass Thorington', 3439944110, '1022 Village Place', 'PO Box 33399', '3439944110');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (11, 'Ricardo Carhart', 4917941819, '116 Stuart Way', 'PO Box 47836', '4917941819');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (12, 'Charlotte Hazle', 4803922669, '8159 Farmco Crossing', '12th Floor', '4803922669');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (13, 'Kelley Itzcovich', 1482199105, '629 Gateway Lane', 'Room 162', '1482199105');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (14, 'Bronnie Ryce', 6028558674, '2493 Springview Lane', 'Apt 454', '6028558674');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (15, 'Adolf Walbridge', 2121598913, '585 East Point', '1st Floor', '2121598913');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (16, 'Dario Tythe', 4766066493, '08 Londonderry Drive', 'Apt 1069', '4766066493');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (17, 'Jocelyne Wemes', 6035333588, '533 Anniversary Trail', 'Room 1269', '6035333588');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (18, 'Renae Dybbe', 3632020470, '4836 Gina Lane', 'Suite 5', '3632020470');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (19, 'Perceval Yarranton', 3771513579, '285 Prairieview Court', 'PO Box 29149', '3771513579');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (20, 'Riannon Posnett', 2995383967, '312 Elgar Point', 'Suite 14', '2995383967');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (21, 'Virgil MacCurley', 7654257109, '248 Arkansas Plaza', 'Room 14', '7654257109');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (22, 'Madelle Comerford', 5211416319, '84428 Fordem Alley', 'Room 997', '5211416319');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (23, 'Ty Ineson', 7556760927, '0 Warner Terrace', 'PO Box 41711', '7556760927');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (24, 'Rycca Alejo', 9549349862, '1191 Packers Alley', 'PO Box 99923', '9549349862');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (25, 'Petronilla Blethyn', 4455948399, '92773 Dovetail Place', 'Suite 32', '4455948399');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (26, 'Bernita Bearward', 2476928607, '260 Ridgeway Drive', 'Room 175', '2476928607');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (27, 'Fulvia Menaul', 5835989412, '4 Bonner Terrace', 'Room 1403', '5835989412');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (28, 'Devin Dillinger', 3649416127, '14099 Bayside Alley', 'PO Box 87834', '3649416127');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (29, 'Leonid Swarbrigg', 6386129082, '84221 Pond Avenue', 'Suite 55', '6386129082');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (30, 'Orelie Daffern', 1441360604, '8272 Reinke Point', 'Apt 180', '1441360604');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (31, 'Virgie Nelmes', 9333656871, '43584 Morrow Crossing', 'Apt 924', '9333656871');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (32, 'Birdie Tremonte', 8118996638, '78469 Mitchell Center', 'PO Box 78132', '8118996638');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (33, 'Dwain Scogings', 8209817012, '559 Autumn Leaf Park', 'PO Box 28408', '8209817012');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (34, 'Ulick Pace', 9948837674, '05165 Holmberg Trail', '7th Floor', '9948837674');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (35, 'Jennica Cartmell', 7216220492, '53 Rusk Court', 'Room 1981', '7216220492');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (36, 'Estrellita Marian', 3151448581, '43 Bay Way', '1st Floor', '3151448581');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (37, 'Derward Roussell', 3948088679, '71129 School Court', 'PO Box 46480', '3948088679');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (38, 'Rene Dartnall', 2974202317, '7 Jenifer Pass', '10th Floor', '2974202317');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (39, 'Derek Gammidge', 9041356907, '82842 Troy Lane', 'Room 625', '9041356907');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (40, 'Ignace Fendley', 3715538979, '81970 Riverside Court', '19th Floor', '3715538979');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (41, 'Foss Livzey', 6348301062, '49357 Meadow Ridge Circle', 'Apt 1708', '6348301062');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (42, 'Nevsa Rodder', 2592132290, '23 Pawling Place', 'PO Box 98380', '2592132290');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (43, 'Myrvyn Bradder', 8805199017, '96 Rusk Road', 'PO Box 74246', '8805199017');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (44, 'Myrwyn Hewell', 5249426258, '26973 Chive Alley', '19th Floor', '5249426258');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (45, 'Johnette Kuschke', 4361246972, '94071 Michigan Parkway', 'Room 1972', '4361246972');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (46, 'Harley Aldersea', 5893481381, '501 Mifflin Trail', 'Room 497', '5893481381');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (47, 'Hank Blackeby', 5483682385, '2 Everett Pass', 'PO Box 88411', '5483682385');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (48, 'Rivalee Kuhnel', 1137495842, '94408 Meadow Valley Hill', 'PO Box 58065', '1137495842');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (49, 'Humfrey Hedylstone', 4546136960, '10 Mifflin Road', '12th Floor', '4546136960');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (50, 'Olenolin MacPharlain', 1292896934, '5852 Basil Alley', 'Suite 27', '1292896934');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (51, 'Harriet Saynor', 4431134949, '109 Carey Trail', 'Apt 292', '4431134949');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (52, 'Nikkie Bosch', 1083923431, '57462 Lyons Center', 'Room 922', '1083923431');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (53, 'Mirilla Shanks', 7182332937, '35015 Hudson Plaza', 'PO Box 83196', '7182332937');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (54, 'Fidelity Bake', 2028252513, '90999 Golf Point', 'Suite 12', '2028252513');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (55, 'Shadow Ruperti', 7672432622, '30 Lakewood Gardens Alley', 'PO Box 77150', '7672432622');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (56, 'Bart Whatmough', 5393822890, '4 Ryan Lane', 'Room 1664', '5393822890');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (57, 'Bobina Hindsberg', 5682669046, '11678 Alpine Way', 'PO Box 45421', '5682669046');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (58, 'Anabelle Patek', 1245112554, '61850 Grayhawk Crossing', '14th Floor', '1245112554');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (59, 'Ninnetta Batchelar', 1477505730, '420 Sullivan Parkway', 'PO Box 32931', '1477505730');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (60, 'Barri Corcoran', 3568742498, '6 Annamark Hill', 'PO Box 40512', '3568742498');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (61, 'Clair Coskerry', 4774878873, '94 Roxbury Plaza', '13th Floor', '4774878873');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (62, 'Koenraad O''Brollachain', 4836859366, '3481 Little Fleur Drive', 'Apt 1947', '4836859366');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (63, 'Leslie Learmount', 7768363568, '07 Algoma Hill', '12th Floor', '7768363568');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (64, 'Elonore Sekulla', 5866455845, '5381 Summer Ridge Street', '1st Floor', '5866455845');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (65, 'Nate Seviour', 7224808107, '706 Bartillon Park', 'Room 614', '7224808107');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (66, 'Tandy MacIllrick', 1537887654, '90 Pearson Junction', 'Suite 32', '1537887654');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (67, 'Alyosha Neeve', 2768938399, '61 Grover Pass', 'Room 1406', '2768938399');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (68, 'Essie Haseman', 2212368496, '20283 Waywood Pass', '2nd Floor', '2212368496');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (69, 'Melinde Bouts', 9149337179, '936 Dunning Plaza', '19th Floor', '9149337179');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (70, 'Amory Shellibeer', 6954427151, '46 Hanover Plaza', 'Apt 1018', '6954427151');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (71, 'Brenn Beddall', 5124245708, '628 Cordelia Park', 'PO Box 89592', '5124245708');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (72, 'Albrecht Calwell', 5315058571, '9885 Acker Trail', 'PO Box 89604', '5315058571');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (73, 'Sterne Lourenco', 3899381203, '78 Troy Terrace', 'Room 1557', '3899381203');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (74, 'Claire Auton', 5491416692, '29 Bartillon Lane', 'Suite 41', '5491416692');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (75, 'Reeta Shapter', 9274965166, '22 Cardinal Junction', 'Apt 235', '9274965166');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (76, 'Dane Stichel', 8848263416, '74877 Lukken Junction', 'Suite 77', '8848263416');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (77, 'Donavon Jerson', 3041011952, '6 Southridge Center', '10th Floor', '3041011952');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (79, 'Glyn Hazelton', 9786988289, '72745 Chinook Drive', 'Suite 30', '9786988289');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (80, 'Francisco Casarili', 2829036538, '10180 Vermont Circle', 'Suite 22', '2829036538');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (81, 'Bearnard Schohier', 5704875587, '36 Dottie Plaza', 'PO Box 13279', '5704875587');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (82, 'Gracia Sidey', 9416142382, '7312 Coolidge Circle', 'Apt 380', '9416142382');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (84, 'Kingston Brockley', 7744186651, '4456 Fuller Point', 'Apt 658', '7744186651');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (85, 'Ivan Britee', 2166844594, '640 Burning Wood Alley', 'Room 895', '2166844594');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (86, 'Willem Grichukhanov', 5914474416, '25 Rockefeller Terrace', '10th Floor', '5914474416');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (87, 'Eward Cossell', 4809086051, '7 Heffernan Alley', 'PO Box 84922', '4809086051');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (88, 'Brenn L''Amie', 8841205162, '436 Lerdahl Terrace', '20th Floor', '8841205162');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (90, 'Alexa Sparshatt', 9562025669, '584 Graceland Parkway', 'PO Box 81550', '9562025669');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (91, 'Malia Hatton', 5625503345, '72612 Carpenter Drive', 'Apt 1621', '5625503345');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (92, 'Sibeal Fernely', 3973237837, '46 Sunfield Terrace', 'Apt 901', '3973237837');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (93, 'Bobbye Scadding', 6262964299, '072 Warbler Terrace', 'Room 863', '6262964299');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (94, 'Reggie Noraway', 9149839628, '2 Reindahl Way', 'PO Box 82390', '9149839628');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (96, 'Farleigh Danilovich', 1585053646, '0868 Sage Circle', 'Suite 89', '1585053646');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (97, 'Adora Corrigan', 6149274734, '99 Maywood Avenue', 'Apt 329', '6149274734');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (98, 'Alessandro Allin', 5907795803, '210 Bobwhite Pass', 'Suite 64', '5907795803');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (100, 'Andy Permain', 4981811325, '055 Logan Center', 'Apt 1946', '4981811325');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (101, 'Ariela Emmert', 2893750708, '59384 Service Center', '12th Floor', '2893750708');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (102, 'Carlo Fee', 1568769063, '66 Browning Circle', 'PO Box 72307', '1568769063');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (103, 'Erek Ellerman', 2703657089, '81 Eggendart Hill', 'Room 1232', '2703657089');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (104, 'Hewet Condy', 7736309631, '59 Mitchell Court', 'Room 1081', '7736309631');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (106, 'Emilio Crickmore', 7766416946, '4034 Scott Center', 'Room 84', '7766416946');
commit;
prompt 100 records committed...
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (107, 'Upton Chiese', 6579884902, '3977 North Parkway', 'Suite 49', '6579884902');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (108, 'Walliw Longhorn', 5942261849, '4 Warrior Pass', 'Suite 64', '5942261849');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (109, 'Arin Smart', 8726213008, '1 Kim Way', 'Apt 1924', '8726213008');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (110, 'Irwin Millimoe', 8801766246, '3455 Mccormick Park', 'Suite 60', '8801766246');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (112, 'Guthrey Frawley', 4909039328, '77242 Maple Park', '17th Floor', '4909039328');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (113, 'Jennie Dmitriev', 1318055354, '650 Bunker Hill Center', 'Room 491', '1318055354');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (114, 'Malissa Daysh', 2559034995, '70264 Harper Terrace', 'Room 1658', '2559034995');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (115, 'Dulcea Whitbread', 9149695893, '45 Transport Park', 'Room 433', '9149695893');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (116, 'Zachary Barbosa', 5243765544, '293 Hanson Street', '1st Floor', '5243765544');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (118, 'Tarah Warbeys', 3167436173, '50103 Oakridge Lane', '5th Floor', '3167436173');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (119, 'Mauricio Geekie', 5163200774, '6 Garrison Avenue', '16th Floor', '5163200774');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (120, 'Lanny Stepney', 8177492948, '630 Ridgeway Plaza', '10th Floor', '8177492948');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (122, 'Kiley Hedger', 1211356571, '27246 Westerfield Pass', 'Room 220', '1211356571');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (123, 'Marnia Stodd', 3921158502, '96 Superior Lane', 'Suite 25', '3921158502');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (124, 'Rochelle Cowndley', 1557734644, '6310 Lakeland Court', 'PO Box 44301', '1557734644');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (125, 'Padraig Clavey', 1055823761, '722 Messerschmidt Hill', 'PO Box 10129', '1055823761');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (126, 'Ralina Sherwill', 1643744776, '3 Clyde Gallagher Pass', 'PO Box 3340', '1643744776');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (127, 'Adolphe Astall', 6589306782, '80961 Hoepker Court', 'Suite 11', '6589306782');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (128, 'Phillis Bilham', 1859215084, '5135 Dakota Pass', 'Suite 91', '1859215084');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (129, 'Merrick Verralls', 7524900440, '96 Linden Terrace', '13th Floor', '7524900440');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (130, 'Nichole Ballston', 1694878878, '69 Golf Plaza', 'Apt 1803', '1694878878');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (131, 'Tabina Limon', 6372942019, '1052 Raven Avenue', 'PO Box 69571', '6372942019');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (132, 'Russ Cordner', 5155977502, '863 Dapin Plaza', 'Room 446', '5155977502');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (133, 'Avivah Pires', 7778381944, '28 Commercial Street', 'Suite 100', '7778381944');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (134, 'Niven Dumblton', 3292830462, '11884 Brentwood Alley', 'Apt 572', '3292830462');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (135, 'Melicent Augur', 8587451262, '337 Roxbury Court', 'Suite 6', '8587451262');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (136, 'Harli Ramelot', 2595931067, '871 Mallard Road', 'Apt 1473', '2595931067');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (137, 'Aurelie California', 6436413430, '0832 Schurz Hill', 'Suite 22', '6436413430');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (138, 'Burlie Scambler', 9045174486, '31 Bay Avenue', '10th Floor', '9045174486');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (139, 'Onfre Emeny', 7875813154, '56 Hayes Road', 'Room 829', '7875813154');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (140, 'Kimmy Mattityahou', 9756496332, '568 Manufacturers Avenue', 'Apt 425', '9756496332');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (141, 'Skelly Broschek', 3138244527, '612 Sloan Avenue', 'PO Box 57047', '3138244527');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (142, 'Kennie Doers', 2884095382, '7 Graedel Point', 'Apt 476', '2884095382');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (143, 'Jade Cawsey', 8559500839, '90 Huxley Junction', '20th Floor', '8559500839');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (144, 'Marji Hachard', 7499860928, '37 Mandrake Junction', '11th Floor', '7499860928');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (145, 'Ingemar Pee', 1182193748, '6643 Kensington Circle', 'Apt 206', '1182193748');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (146, 'Kerianne Brekonridge', 7673188468, '8 Prairieview Crossing', 'Room 669', '7673188468');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (147, 'Falito Reyna', 4767760450, '842 Northview Avenue', 'PO Box 24287', '4767760450');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (148, 'Barry Galland', 4669831129, '4 Logan Park', 'Room 1426', '4669831129');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (149, 'Carlen McNiff', 1022867269, '5955 Washington Parkway', '18th Floor', '1022867269');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (150, 'Meridith Rushford', 3323368399, '7 Westridge Park', '10th Floor', '3323368399');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (151, 'Jacqui Affuso', 8795506790, '1839 Oak Parkway', 'PO Box 59623', '8795506790');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (152, 'Arni Chesswas', 3869027239, '24923 Londonderry Avenue', 'Apt 5', '3869027239');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (153, 'Annabelle Julian', 7185399496, '3 Independence Alley', 'Room 210', '7185399496');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (154, 'Kassie MacIlriach', 2473387545, '3 Talmadge Trail', '8th Floor', '2473387545');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (155, 'Brit Elsop', 5809031975, '08919 Valley Edge Avenue', 'Apt 1478', '5809031975');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (156, 'Leila Mazey', 1937754509, '158 Straubel Crossing', 'PO Box 37004', '1937754509');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (157, 'Cordie Eldon', 7636543924, '2 Texas Terrace', 'Room 831', '7636543924');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (158, 'Beitris Silverthorn', 3847265721, '33 Northwestern Avenue', 'Apt 343', '3847265721');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (159, 'Heidi Dionsetto', 3198603467, '9363 Pepper Wood Street', 'Room 19', '3198603467');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (160, 'Elayne De Giorgio', 8082617768, '8970 Graceland Park', '11th Floor', '8082617768');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (161, 'Lesley Ciobotaru', 7504525727, '3352 Reinke Pass', 'Suite 73', '7504525727');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (162, 'Brana Bilsland', 5128016150, '69716 Tennessee Avenue', '7th Floor', '5128016150');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (163, 'Anett Simao', 3497700542, '4322 Memorial Point', 'Apt 917', '3497700542');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (164, 'Blanca Roskruge', 8957244932, '7768 Sunbrook Junction', '20th Floor', '8957244932');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (165, 'Faye Schiell', 9836111271, '4712 Pine View Circle', '9th Floor', '9836111271');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (166, 'Bobby Laroze', 7802937616, '42 Hauk Alley', 'PO Box 13152', '7802937616');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (167, 'Yetty Nutting', 8576750631, '685 Scott Plaza', 'PO Box 97625', '8576750631');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (168, 'Kermie Larose', 9896643450, '6 Tennessee Terrace', 'PO Box 40681', '9896643450');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (169, 'Sofia Sharer', 9461101450, '6 Hagan Point', '19th Floor', '9461101450');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (170, 'Alikee Milan', 8339262899, '58753 Calypso Crossing', 'Suite 58', '8339262899');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (171, 'Glenda Ettritch', 7104149140, '020 Monument Alley', 'Room 1004', '7104149140');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (172, 'Dan Nizard', 2569271624, '8 Vahlen Road', '3rd Floor', '2569271624');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (173, 'Noelani Paradis', 4389805405, '0 Cascade Court', 'Apt 335', '4389805405');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (174, 'Jeremie Bulfit', 4272547303, '648 Maryland Place', 'Suite 51', '4272547303');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (175, 'Bendicty Tybalt', 3792590633, '63 Browning Point', '15th Floor', '3792590633');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (176, 'Doralyn Foxton', 7877692459, '2 Kinsman Way', 'Apt 1767', '7877692459');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (177, 'Gelya Follows', 2029784989, '1 Continental Parkway', 'PO Box 32098', '2029784989');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (178, 'Meris Chidwick', 8305256205, '78360 Knutson Crossing', 'Suite 16', '8305256205');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (179, 'Stacey McLelland', 6848656964, '4 Vera Park', '5th Floor', '6848656964');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (180, 'Ricoriki Elsby', 9614161294, '23 Bowman Point', 'Apt 51', '9614161294');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (181, 'Katrinka Bolver', 9859441622, '8 Grim Plaza', 'PO Box 95485', '9859441622');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (182, 'Pancho Worsam', 2712855765, '09 Gateway Plaza', 'Apt 872', '2712855765');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (183, 'Melinda Thurley', 5915452536, '50 New Castle Hill', 'PO Box 89127', '5915452536');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (184, 'Adina Lissemore', 2949325358, '29 Sugar Terrace', 'PO Box 89811', '2949325358');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (185, 'Beilul Napton', 5059865443, '765 Cordelia Place', 'Apt 1823', '5059865443');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (186, 'Evelyn Deane', 5996472725, '98 Rowland Parkway', 'PO Box 21382', '5996472725');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (187, 'Catharine Rapkins', 7659248554, '7 Mayfield Plaza', 'PO Box 96814', '7659248554');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (188, 'Korney Hindhaugh', 8019868854, '076 7th Lane', 'Room 947', '8019868854');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (189, 'Gaby Purser', 6722106380, '87 Saint Paul Point', '16th Floor', '6722106380');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (190, 'Reggi Wickes', 2465880579, '3064 West Park', 'Suite 8', '2465880579');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (191, 'Avis Woolaghan', 6914564018, '85731 Vahlen Plaza', 'PO Box 60662', '6914564018');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (192, 'Kimberlee Kroll', 1085213112, '2864 Bartelt Crossing', '8th Floor', '1085213112');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (193, 'Netta Sawdon', 9116716679, '9262 Ludington Hill', '5th Floor', '9116716679');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (194, 'Demetrius Quaintance', 2201285937, '712 Eastlawn Alley', 'Room 781', '2201285937');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (195, 'Ann-marie Berard', 3887025049, '229 Fordem Crossing', '20th Floor', '3887025049');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (196, 'Milty Heugle', 2126997985, '6673 Johnson Circle', 'Apt 1116', '2126997985');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (197, 'Rhiamon Lettuce', 5076559684, '01289 Schurz Street', 'Room 1406', '5076559684');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (198, 'Maybelle Malinson', 1591042396, '31 Merry Pass', 'Suite 69', '1591042396');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (199, 'Ad Chastanet', 3156242643, '9 Iowa Parkway', '7th Floor', '3156242643');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (201, 'Catlin Proschke', 7415430247, '84 Quincy Park', 'Room 880', '7415430247');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (202, 'Kassie Gambles', 8646164709, '16 Raven Hill', '13th Floor', '8646164709');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (203, 'Letta Slocomb', 5586588632, '622 Memorial Trail', 'Room 103', '5586588632');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (204, 'Marc Errett', 5796001244, '2 Harbort Park', 'Room 1073', '5796001244');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (205, 'Marianne Robe', 4359042211, '703 Redwing Point', '6th Floor', '4359042211');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (207, 'Brynna Skellion', 1103943493, '922 Caliangt Park', '9th Floor', '1103943493');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (208, 'Tedie Cordova', 1739281283, '734 Grasskamp Avenue', 'Suite 50', '1739281283');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (209, 'May Hartop', 8738012400, '6768 Maywood Terrace', 'PO Box 22594', '8738012400');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (211, 'Lonnie Mont', 5887503743, '2 Old Gate Crossing', 'PO Box 79350', '5887503743');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (212, 'Land Ughini', 5814511911, '0 Golf Course Court', '10th Floor', '5814511911');
commit;
prompt 200 records committed...
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (213, 'Brody Alesi', 3556778245, '5528 Southridge Road', '18th Floor', '3556778245');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (214, 'Cynthie Horwell', 5519677699, '1 Cascade Point', 'PO Box 89397', '5519677699');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (215, 'Genevieve Paley', 5306050626, '8085 Forest Dale Junction', 'Suite 87', '5306050626');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (217, 'Letty Dupree', 1906668785, '0 Kenwood Plaza', '12th Floor', '1906668785');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (218, 'Geoffrey Hurst', 9169804050, '187 Sherman Street', 'Apt 663', '9169804050');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (219, 'Nichole Leban', 4769523267, '5 Merchant Drive', 'PO Box 23114', '4769523267');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (220, 'Carmelita Goss', 2857097738, '7217 Larry Way', '1st Floor', '2857097738');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (222, 'Hashim Milsted', 2606073372, '05 3rd Alley', 'Room 407', '2606073372');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (223, 'Adolphe Youdell', 9491263556, '78579 Division Lane', 'Apt 1467', '9491263556');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (224, 'Millard Shoulders', 5575386217, '630 Del Mar Park', 'Apt 1068', '5575386217');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (225, 'Theodora Drews', 5432463419, '9 Donald Way', 'Apt 979', '5432463419');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (226, 'Elsi Nise', 3471175478, '6 Nelson Court', 'PO Box 85309', '3471175478');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (228, 'Clarita Errett', 2653623627, '0 Bashford Pass', 'Room 1952', '2653623627');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (229, 'Grover Tibb', 4412332433, '28935 Manufacturers Alley', '14th Floor', '4412332433');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (230, 'Linn Antonomoli', 3847387071, '7 Merrick Alley', 'PO Box 96949', '3847387071');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (231, 'Aldo Brookbank', 2605228688, '74159 Blue Bill Park Plaza', 'Room 1195', '2605228688');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (233, 'Vinnie Whyman', 3533850382, '72 Dahle Crossing', 'Apt 1977', '3533850382');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (234, 'Catharina Pitts', 1162691537, '57802 Homewood Trail', 'PO Box 54122', '1162691537');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (235, 'Auguste Loveitt', 7996850493, '85810 Hollow Ridge Plaza', 'Apt 25', '7996850493');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (236, 'Cal Biaggiotti', 1757129612, '76 Nancy Point', '13th Floor', '1757129612');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (237, 'Giff Coltart', 4314596932, '29306 Stephen Junction', 'PO Box 85801', '4314596932');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (239, 'Creight Molder', 6368698376, '4 Ludington Avenue', '11th Floor', '6368698376');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (240, 'Ruggiero Stanfield', 8766593388, '551 Cardinal Street', 'Apt 1639', '8766593388');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (241, 'Mike Birdsey', 2776844300, '87686 Buhler Way', '6th Floor', '2776844300');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (242, 'Faythe Gilbey', 9735451460, '8772 Merchant Drive', 'Suite 30', '9735451460');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (244, 'Robby Turmel', 5924600643, '3 Mosinee Terrace', 'Suite 19', '5924600643');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (245, 'Veronica Bachanski', 1316020372, '407 Monument Circle', 'PO Box 30577', '1316020372');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (246, 'Madelene Hernik', 8943346184, '8 Mockingbird Terrace', 'Suite 32', '8943346184');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (247, 'Tybie Ianni', 1992973869, '3975 Glendale Center', 'PO Box 5358', '1992973869');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (248, 'Gloriane Boscher', 7969531308, '41 Donald Parkway', 'Apt 719', '7969531308');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (249, 'Esta Bole', 1335368337, '98258 Harper Road', 'Apt 120', '1335368337');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (250, 'Jessie Kornyakov', 8686938852, '04554 Memorial Pass', 'Apt 925', '8686938852');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (251, 'Noelani Gooly', 9514848659, '8145 Summerview Pass', 'Room 1537', '9514848659');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (252, 'Lisabeth Arundale', 5785456338, '35791 Bartillon Lane', 'PO Box 14123', '5785456338');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (253, 'Ly Sanbrook', 7104460045, '53585 Sunnyside Trail', 'Suite 50', '7104460045');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (254, 'Lita Poacher', 4006867480, '95426 Vermont Court', 'PO Box 49507', '4006867480');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (255, 'Bearnard Davet', 1407151347, '81791 Victoria Trail', 'Apt 1661', '1407151347');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (256, 'Elbertine Guare', 1476647148, '93 Esker Pass', 'Apt 1399', '1476647148');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (257, 'Ollie Capey', 1099711905, '2996 Bultman Way', 'Suite 83', '1099711905');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (258, 'Pierson Esseby', 2277305114, '7315 Monterey Lane', 'Apt 613', '2277305114');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (259, 'Haslett Shalloo', 5938408720, '26 3rd Hill', 'PO Box 93394', '5938408720');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (260, 'Chadd Ambroziak', 3685170010, '55 Colorado Court', '7th Floor', '3685170010');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (261, 'Isahella Waldrum', 9062973476, '020 Annamark Way', 'Apt 100', '9062973476');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (262, 'Findley Common', 3466252309, '598 Stuart Street', 'PO Box 84272', '3466252309');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (263, 'Rooney Picard', 5857352141, '20294 Glacier Hill Junction', 'PO Box 96518', '5857352141');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (264, 'Ashleigh Kiggel', 9405424366, '8 Orin Place', 'Room 684', '9405424366');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (265, 'Damiano Lightman', 2675541693, '282 Fremont Road', '7th Floor', '2675541693');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (266, 'Lucias Rennenbach', 8171346271, '876 Northridge Crossing', '12th Floor', '8171346271');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (267, 'Tiebold Sudddard', 5313778264, '4013 Donald Place', 'Apt 174', '5313778264');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (268, 'Corty Crimp', 4532959101, '21 Esker Hill', 'PO Box 83292', '4532959101');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (269, 'Eadith Normanvill', 5159083560, '5 Prentice Center', '6th Floor', '5159083560');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (270, 'Ella Fazzioli', 1059989560, '179 Thierer Center', 'Room 531', '1059989560');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (271, 'Gawain Nappin', 7525839182, '0 Prairie Rose Junction', '14th Floor', '7525839182');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (272, 'Derry Sugg', 7321432873, '03 Loomis Plaza', '5th Floor', '7321432873');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (273, 'Shanda Beadnall', 1476992647, '12945 Loeprich Circle', 'PO Box 46091', '1476992647');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (274, 'Trev Russ', 5558890827, '51 Fremont Hill', '14th Floor', '5558890827');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (275, 'Almeria Fleckney', 6109263310, '18046 Dryden Drive', 'Suite 71', '6109263310');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (276, 'Amory Shepperd', 7523018588, '45628 Blackbird Park', 'Room 590', '7523018588');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (277, 'Calli Urey', 3238969778, '50 Hagan Avenue', 'Room 714', '3238969778');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (278, 'Christabel Somner', 7322683171, '8 Mcguire Point', 'Room 1199', '7322683171');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (279, 'Alana Kellington', 9012614231, '29 7th Junction', 'Apt 1548', '9012614231');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (280, 'Cassaundra Janodet', 1743551465, '922 Lunder Circle', 'Apt 818', '1743551465');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (281, 'Carma Fontel', 8633146247, '15966 Coleman Parkway', 'Apt 140', '8633146247');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (282, 'Wenona Folkerd', 6759967446, '22643 Straubel Pass', '20th Floor', '6759967446');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (283, 'Jerrome Alden', 9976217315, '974 Tennyson Crossing', 'Suite 23', '9976217315');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (284, 'Augustine Archbutt', 7402219398, '2 Scofield Alley', '1st Floor', '7402219398');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (285, 'Faydra Shetliff', 7987077287, '90 Cardinal Alley', 'PO Box 37229', '7987077287');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (286, 'Yanaton Mangin', 9686600378, '44 Dunning Hill', 'Suite 48', '9686600378');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (287, 'Huey Valsler', 3561899786, '915 Del Sol Point', 'PO Box 33829', '3561899786');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (288, 'Sherwood Arsnell', 9762935628, '29189 Butternut Hill', 'Apt 1214', '9762935628');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (289, 'Darn Kid', 1781842468, '5 Stang Drive', 'Apt 1316', '1781842468');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (290, 'Lilllie Kinglesyd', 7622456408, '8 Butterfield Avenue', 'Room 28', '7622456408');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (291, 'Dorthea Ciepluch', 9359952668, '427 Katie Avenue', '17th Floor', '9359952668');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (292, 'Holly Baitman', 4921006182, '9867 Manufacturers Court', '4th Floor', '4921006182');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (293, 'Hazlett Witherdon', 1069238064, '8 Stephen Street', 'Room 945', '1069238064');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (294, 'Carver Jellman', 4818270679, '78 Lyons Road', 'Suite 2', '4818270679');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (295, 'Noah Sowerby', 5968080332, '4 Dennis Plaza', 'Apt 1477', '5968080332');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (296, 'Adore Machans', 6997568304, '324 Green Point', 'Room 1919', '6997568304');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (297, 'Paige McCrostie', 8957827005, '24509 Corscot Point', 'Room 307', '8957827005');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (298, 'Tanner Franzettoini', 4143184542, '5 Dottie Avenue', 'Suite 63', '4143184542');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (299, 'Ferne Sommer', 3956864253, '094 Laurel Hill', 'Room 103', '3956864253');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (300, 'Stacia Stutte', 9678024411, '67 Independence Plaza', '10th Floor', '9678024411');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (301, 'Stefano Hamly', 7112986632, '668 Park Meadow Junction', 'Apt 542', '7112986632');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (302, 'Othelia Josephov', 3051441526, '84 Morning Hill', '5th Floor', '3051441526');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (303, 'Norrie Diano', 7828291008, '6218 Leroy Alley', 'Room 1815', '7828291008');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (304, 'Pavia Uden', 7291246274, '49240 Oriole Drive', 'PO Box 3397', '7291246274');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (305, 'Ingemar Tattam', 3533145835, '27769 Towne Terrace', 'Apt 693', '3533145835');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (306, 'Mercy Pullman', 2341582621, '9 Eagle Crest Hill', 'Suite 55', '2341582621');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (307, 'Chastity Fairlem', 7763240763, '29576 Fair Oaks Park', '3rd Floor', '7763240763');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (308, 'Jodi Riseborough', 6437404812, '67 Luster Pass', 'Room 1915', '6437404812');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (309, 'Georgeanna Praill', 4844121287, '886 Colorado Park', 'PO Box 876', '4844121287');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (310, 'Silvanus Lossman', 2474329963, '7524 Mosinee Way', 'Suite 83', '2474329963');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (311, 'Barn Collinwood', 5387290521, '4561 Northridge Terrace', 'Room 1032', '5387290521');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (312, 'Mohandas Seymark', 8252326791, '57 Autumn Leaf Parkway', '1st Floor', '8252326791');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (313, 'Millie McArthur', 2493743344, '94 Granby Place', 'Suite 61', '2493743344');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (314, 'Puff Richin', 9116800043, '7564 Coolidge Avenue', 'Room 52', '9116800043');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (315, 'Marla Mungane', 5857873160, '746 Karstens Court', 'PO Box 30675', '5857873160');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (316, 'Ninetta Maken', 2853539197, '4994 Talisman Court', 'Suite 22', '2853539197');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (317, 'Annelise Lock', 5755826044, '29 1st Road', '2nd Floor', '5755826044');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (318, 'Alano Detoile', 4945284331, '25 Golden Leaf Crossing', 'PO Box 49862', '4945284331');
commit;
prompt 300 records committed...
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (319, 'Bili Carwithim', 5506992076, '0 Tony Crossing', 'PO Box 49306', '5506992076');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (321, 'Melodee Caillou', 9975561009, '927 Di Loreto Avenue', 'Room 922', '9975561009');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (322, 'Tod Aggiss', 8591648339, '3 Stuart Road', 'PO Box 81028', '8591648339');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (323, 'Sherye Cure', 8275060340, '7 Johnson Point', 'Room 112', '8275060340');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (324, 'Mayne Stemp', 2504722745, '141 Sunnyside Place', 'Suite 26', '2504722745');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (326, 'Valma Chasemoore', 7969934947, '180 Sugar Avenue', 'PO Box 46304', '7969934947');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (327, 'Zane MacEntee', 1766794543, '9841 Springs Drive', 'Suite 56', '1766794543');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (328, 'Claudio Hallihane', 1751804648, '96812 Burning Wood Pass', 'Suite 67', '1751804648');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (329, 'Martita Jancy', 4274329311, '7 Forest Run Parkway', 'Suite 97', '4274329311');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (330, 'Jeanie Inmett', 8606642550, '90 Fairview Center', 'PO Box 47195', '8606642550');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (332, 'Justina Yeomans', 2704471932, '9 Hintze Alley', 'Room 15', '2704471932');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (333, 'Mackenzie Espinal', 9824189216, '01 Lukken Parkway', 'PO Box 89349', '9824189216');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (334, 'Winn Furmenger', 2239525623, '15 Stone Corner Pass', 'PO Box 30879', '2239525623');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (335, 'Marie Sinney', 5918266202, '96362 Twin Pines Court', 'Suite 4', '5918266202');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (337, 'Kaitlynn Coltart', 7161223223, '130 Eastwood Junction', 'Apt 945', '7161223223');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (338, 'Alice Fearnall', 8135835106, '0 Acker Way', 'Suite 66', '8135835106');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (339, 'Jordan Toffano', 3223268136, '618 Victoria Alley', 'Suite 71', '3223268136');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (340, 'Abbie Elvin', 3184793890, '0919 Messerschmidt Circle', 'Suite 11', '3184793890');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (341, 'Joby McLuckie', 5389483195, '44 Oxford Drive', 'Room 1983', '5389483195');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (343, 'Granger Thibodeaux', 8961999232, '6204 Kropf Court', 'Suite 43', '8961999232');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (344, 'Ivie Heliet', 9406672485, '4 Nelson Place', '12th Floor', '9406672485');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (345, 'Leshia Geroldini', 8194109633, '1 Nancy Point', 'Apt 1272', '8194109633');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (346, 'Bayard Kleinstern', 2866249517, '08 Bluejay Park', 'Apt 1451', '2866249517');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (347, 'Gerty Earey', 7574198355, '544 Maryland Junction', 'Room 908', '7574198355');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (349, 'Kalie Ledgerton', 3091198250, '214 High Crossing Center', 'Apt 826', '3091198250');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (350, 'Mario Dillet', 4837784209, '703 Hagan Parkway', 'Apt 223', '4837784209');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (351, 'Binny Surcomb', 9611970885, '25383 Valley Edge Lane', 'Apt 1317', '9611970885');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (352, 'Hanny Stoeckle', 7317467056, '50 Monica Terrace', '7th Floor', '7317467056');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (354, 'Jameson Andell', 8528990101, '4721 Buhler Court', 'PO Box 66515', '8528990101');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (355, 'Charmion Eliaz', 8414123485, '0330 Lighthouse Bay Center', 'Apt 1302', '8414123485');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (356, 'Kiley Masey', 6479879055, '97 Northridge Hill', 'Apt 777', '6479879055');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (357, 'Luella Chander', 3699627014, '7949 Clarendon Drive', 'Room 1147', '3699627014');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (359, 'Brannon Hacksby', 6946322868, '72952 Kipling Lane', 'Room 1805', '6946322868');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (360, 'Hurleigh Andrieu', 2699343939, '9 Mandrake Circle', 'Room 1944', '2699343939');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (361, 'Ruthanne Semor', 4101155666, '7461 Darwin Pass', '8th Floor', '4101155666');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (362, 'Paxton Beckenham', 1076110233, '28696 Westerfield Terrace', 'PO Box 58068', '1076110233');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (364, 'Drucy Isley', 8654781907, '419 Chive Circle', '17th Floor', '8654781907');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (365, 'Peadar Duggan', 1803020036, '44 Independence Alley', 'Suite 17', '1803020036');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (366, 'Camala Ballach', 9457494157, '4 Springview Alley', 'PO Box 48553', '9457494157');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (367, 'Raynard Pryce', 4817143354, '05 West Terrace', 'Room 1100', '4817143354');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (368, 'Fonz Scarth', 7074656828, '36 Forest Dale Drive', 'Suite 43', '7074656828');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (369, 'Atlante Stenson', 8996625440, '821 Melby Alley', '1st Floor', '8996625440');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (370, 'Lela Roostan', 4359827510, '86028 Hoffman Hill', 'Apt 683', '4359827510');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (371, 'Trixi Rispin', 6162291327, '85 Luster Street', 'Suite 35', '6162291327');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (372, 'Lezlie Eliasson', 6363908920, '32078 Upham Circle', 'PO Box 74468', '6363908920');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (373, 'Almire Stockton', 7264090173, '7122 Forest Run Avenue', 'Suite 96', '7264090173');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (374, 'Reynard Borne', 7447771140, '5 Maple Wood Road', 'Suite 41', '7447771140');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (375, 'Dante Quant', 6579819444, '7200 Bobwhite Crossing', 'PO Box 66672', '6579819444');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (376, 'Cheston MacVay', 8402100412, '67438 Mayer Road', 'Apt 1013', '8402100412');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (377, 'Roselle Courtonne', 5425141562, '9 Hollow Ridge Place', 'Apt 1545', '5425141562');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (378, 'Antonia Davys', 3304497507, '26344 Scott Terrace', 'PO Box 39897', '3304497507');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (379, 'Lek Dugmore', 7611955898, '1 Sutherland Park', 'Suite 3', '7611955898');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (380, 'Kaleb Verheyden', 7578514519, '0 Old Shore Parkway', '10th Floor', '7578514519');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (381, 'Basil Biggs', 7961057505, '4161 Prairieview Avenue', 'Apt 220', '7961057505');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (382, 'Cherie Seggie', 7704072167, '578 Fair Oaks Parkway', 'Room 191', '7704072167');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (383, 'Gerhardine Gunny', 4855210916, '2 Darwin Center', 'PO Box 230', '4855210916');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (384, 'Marcellina Freckleton', 8053721435, '01378 Troy Lane', '8th Floor', '8053721435');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (385, 'Annette Harle', 2012540365, '6 Roxbury Plaza', 'Apt 85', '2012540365');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (386, 'Jenda Hawse', 4689614225, '46 Mifflin Pass', 'Room 717', '4689614225');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (387, 'Shantee Merck', 8523787047, '4 Steensland Court', 'PO Box 85645', '8523787047');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (388, 'Fritz Longson', 8489397274, '58397 Londonderry Road', 'Room 1701', '8489397274');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (389, 'Bette-ann Fost', 6794988608, '83611 Carioca Road', 'PO Box 69861', '6794988608');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (390, 'Leonora Le Friec', 1738255373, '1 Burning Wood Pass', 'Room 143', '1738255373');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (391, 'Reagan MacKenzie', 7643271547, '8745 Pine View Street', 'Apt 1581', '7643271547');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (392, 'Juana Statersfield', 4056199870, '700 Bobwhite Crossing', 'Suite 28', '4056199870');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (393, 'Bernardo Tuhy', 3746548043, '75 Eastlawn Crossing', 'PO Box 38373', '3746548043');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (394, 'Delmer Laidlaw', 7691801070, '13211 Fulton Road', 'PO Box 64669', '7691801070');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (395, 'Margalo Thormann', 5848411781, '9626 Clemons Parkway', 'PO Box 97834', '5848411781');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (396, 'Marylin Molloy', 5083890995, '5 Waywood Lane', 'Room 694', '5083890995');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (397, 'Wendy Brayshay', 2893781236, '28648 Memorial Parkway', 'Apt 1205', '2893781236');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (398, 'Conway Maestrini', 5876732051, '307 Manley Hill', 'Room 1738', '5876732051');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (399, 'Nani Fradson', 7806216569, '817 Glacier Hill Lane', 'Room 1431', '7806216569');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (400, 'Carola Maude', 2465405907, '64 Armistice Crossing', 'PO Box 59563', '2465405907');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (78, 'Hymie Ings', 8809415889, '503 Sommers Hill', 'Suite 96', '8809415889');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (83, 'Elga Huntingdon', 7714367371, '62159 Holmberg Hill', 'PO Box 62779', '7714367371');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (89, 'Pepito Goodboddy', 2914770303, '49 Marquette Plaza', '12th Floor', '2914770303');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (95, 'Violet Dubs', 1049837342, '51 Fulton Way', 'Room 733', '1049837342');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (99, 'Wilie Eakly', 4222841926, '42535 Kensington Plaza', 'PO Box 14455', '4222841926');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (105, 'Ingeberg Brade', 5087978819, '24106 Delaware Point', 'PO Box 55369', '5087978819');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (111, 'Borden Kleinberer', 3507196601, '9057 Schurz Parkway', 'Apt 1106', '3507196601');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (117, 'Si Fredi', 4655432965, '101 Mifflin Court', 'Suite 17', '4655432965');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (121, 'Griz Fleeman', 3135716109, '9 Mitchell Pass', '16th Floor', '3135716109');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (200, 'Winona Trappe', 8327470823, '69 Prentice Street', 'PO Box 38389', '8327470823');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (206, 'Rae Kirley', 5848450129, '4 Elgar Street', 'Suite 49', '5848450129');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (210, 'Jayme Bushe', 6675279606, '56904 Acker Crossing', '14th Floor', '6675279606');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (216, 'Kristen Ayres', 9891032824, '14072 Northview Trail', 'Suite 32', '9891032824');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (221, 'Gayelord Livingstone', 9443711788, '3 North Place', 'Room 1931', '9443711788');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (227, 'Jaquith Ruilton', 6638634058, '48 Express Lane', '18th Floor', '6638634058');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (232, 'Craggie Gall', 4275127483, '3057 American Parkway', 'PO Box 29065', '4275127483');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (238, 'Ivette Leather', 5311992923, '401 Hoard Street', 'Suite 75', '5311992923');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (243, 'Sergio Hannigan', 6064512812, '74 David Terrace', '1st Floor', '6064512812');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (320, 'Osmond Stamper', 4102626672, '28 Gerald Trail', 'Room 1087', '4102626672');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (325, 'Demetre Van der Spohr', 3163954115, '0 Reinke Point', 'Suite 94', '3163954115');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (331, 'Tomasina Fryd', 5909012913, '58 Sundown Terrace', 'PO Box 13371', '5909012913');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (336, 'Mirelle Burton', 5074713437, '7998 Forest Run Way', '19th Floor', '5074713437');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (342, 'Emlen Curbishley', 3321942465, '5061 Rusk Street', 'PO Box 17733', '3321942465');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (348, 'Mirelle Spur', 2497127317, '9 Reindahl Drive', 'Apt 478', '2497127317');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (353, 'Carlene Ducrow', 6889278464, '207 Union Junction', '6th Floor', '6889278464');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (358, 'Latia Kolakovic', 4973041095, '117 Darwin Way', 'Room 643', '4973041095');
insert into CUSTOMERS (customer_id, customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
values (363, 'Annmarie Swaffer', 9272026305, '3197 Pine View Lane', '14th Floor', '9272026305');
commit;
prompt 400 records loaded
prompt Loading ORDERS...
insert into ORDERS (order_id, order_date, customer_id, discount)
values (405, to_date('10-06-2024 00:53:48', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into ORDERS (order_id, order_date, customer_id, discount)
values (406, to_date('10-06-2024 00:55:13', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into ORDERS (order_id, order_date, customer_id, discount)
values (407, to_date('10-06-2024 00:57:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into ORDERS (order_id, order_date, customer_id, discount)
values (401, to_date('10-06-2024 00:48:17', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into ORDERS (order_id, order_date, customer_id, discount)
values (402, to_date('10-06-2024 00:48:17', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into ORDERS (order_id, order_date, customer_id, discount)
values (404, to_date('10-06-2024 00:48:17', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
commit;
prompt 6 records loaded
prompt Loading TICKETS...
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (1, 81, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 1, 201);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (2, 13, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 1, 157);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (3, 100, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 2, 233);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (4, 5, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 3, 218);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (5, 63, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 2, 365);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (6, 52, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 185);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (7, 60, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 3, 148);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (8, 74, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 1, 87);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (9, 2, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 2, 301);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (10, 39, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 3, 71);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (11, 72, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 272);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (12, 31, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 2, 368);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (13, 28, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 4);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (14, 1, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 3, 130);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (15, 80, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 3, 308);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (16, 43, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 3, 267);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (17, 81, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('25-01-2026', 'dd-mm-yyyy'), 1, 303);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (18, 8, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 1, 216);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (19, 1, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 329);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (20, 95, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 2, 187);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (21, 32, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 1, 43);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (22, 86, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 3, 191);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (23, 11, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 2, 12);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (24, 95, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 3, 252);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (25, 88, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 2, 142);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (26, 84, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 2, 230);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (27, 16, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 2, 58);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (28, 24, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 1, 326);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (29, 50, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 184);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (30, 53, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 2, 194);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (31, 64, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 2, 127);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (32, 25, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 2, 7);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (33, 56, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 2, 124);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (34, 91, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 2, 230);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (35, 82, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 2, 109);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (36, 52, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 1, 3);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (37, 45, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 2, 176);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (38, 15, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 2, 18);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (39, 40, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 1, 38);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (40, 38, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 2, 381);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (41, 5, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 41);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (42, 25, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 237);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (43, 70, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 2, 81);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (44, 48, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 1, 72);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (45, 7, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 2, 354);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (46, 24, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 3, 272);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (47, 92, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 1, 113);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (48, 18, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 1, 144);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (49, 37, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 2, 119);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (50, 31, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 2, 315);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (51, 38, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 97);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (52, 99, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 3, 222);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (53, 56, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 2, 393);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (54, 10, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 3, 105);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (55, 70, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 2, 192);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (56, 54, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 2, 351);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (57, 89, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 1, 194);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (58, 67, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 2, 241);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (59, 16, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 1, 7);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (60, 1, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 2, 305);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (61, 90, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 297);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (62, 22, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 1, 130);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (63, 95, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 3, 107);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (64, 69, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 3, 25);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (65, 41, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 3, 299);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (66, 49, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 2, 294);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (67, 95, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 1, 217);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (68, 8, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 3, 183);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (69, 1, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('25-01-2026', 'dd-mm-yyyy'), 3, 1);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (70, 30, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 1, 87);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (71, 19, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 1, 214);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (72, 7, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 1, 371);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (73, 84, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 2, 294);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (74, 79, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 1, 378);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (75, 24, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 141);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (76, 84, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 3, 101);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (77, 49, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 10);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (78, 22, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 2, 18);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (79, 7, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 1, 363);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (80, 35, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 3, 314);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (81, 35, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 2, 106);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (82, 51, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 1, 262);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (83, 20, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 276);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (84, 4, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 3, 389);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (85, 71, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 1, 255);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (86, 75, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 2, 172);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (87, 18, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 1, 88);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (88, 76, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 3, 155);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (89, 19, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 1, 203);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (90, 42, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 3, 149);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (91, 70, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 3, 306);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (92, 90, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 3, 83);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (93, 76, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 3, 377);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (94, 9, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 2, 41);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (95, 89, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 2, 19);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (96, 82, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 2, 167);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (97, 1, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 3, 290);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (98, 79, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 2, 369);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (99, 51, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 3, 30);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (100, 54, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 3, 78);
commit;
prompt 100 records committed...
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (101, 72, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 3, 236);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (102, 25, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 2, 111);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (103, 31, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 1, 124);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (104, 34, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 1, 96);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (105, 74, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 2, 227);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (106, 93, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 2, 196);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (107, 53, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 1, 315);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (108, 3, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 3, 398);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (109, 64, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 3, 244);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (110, 21, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('25-01-2026', 'dd-mm-yyyy'), 1, 343);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (111, 35, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 2, 373);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (112, 73, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 2, 8);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (113, 4, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 1, 380);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (114, 50, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 3, 192);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (115, 5, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 1, 68);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (116, 55, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 3, 399);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (117, 2, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 325);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (118, 90, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 2, 177);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (119, 73, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 227);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (120, 58, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 1, 43);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (121, 41, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 1, 189);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (122, 66, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 2, 74);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (123, 14, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 2, 46);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (124, 91, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 2, 292);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (125, 84, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 3, 297);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (126, 95, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 69);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (127, 8, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 1, 157);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (128, 66, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 2, 305);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (129, 65, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 1, 164);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (130, 3, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 1, 108);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (131, 3, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 1, 279);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (132, 39, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 1, 389);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (133, 19, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 81);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (134, 41, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 2, 139);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (135, 26, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 2, 376);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (136, 12, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 2, 73);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (137, 8, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 1, 108);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (138, 41, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 27);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (139, 60, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 3, 321);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (140, 94, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 3, 84);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (141, 45, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 2, 133);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (142, 6, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 2, 354);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (143, 46, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 2, 12);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (144, 6, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 1, 341);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (145, 24, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 2, 361);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (146, 42, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 1, 272);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (147, 89, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 2, 332);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (148, 59, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 2, 145);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (149, 4, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 109);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (150, 71, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 3, 235);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (151, 64, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 3, 294);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (152, 44, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 2, 72);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (153, 14, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 2, 73);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (154, 83, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 1, 364);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (155, 74, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 2, 176);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (156, 26, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 2, 344);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (157, 70, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 1, 139);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (158, 17, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 2, 86);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (159, 84, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 2, 167);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (160, 20, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 2, 193);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (161, 13, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 3, 97);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (162, 79, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 2, 392);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (163, 42, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 1, 150);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (164, 85, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 2, 1);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (165, 35, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 3, 343);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (166, 23, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 151);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (167, 66, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 1, 330);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (168, 81, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 1, 102);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (169, 26, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 1, 115);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (170, 85, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 1, 35);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (171, 40, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 3, 137);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (172, 63, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 2, 263);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (173, 58, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 1, 162);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (174, 19, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 1, 90);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (175, 75, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 2, 107);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (176, 6, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 2, 307);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (177, 24, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 2, 380);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (178, 77, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('25-01-2026', 'dd-mm-yyyy'), 3, 301);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (179, 5, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 2, 383);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (180, 98, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 3, 101);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (181, 56, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 2, 316);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (182, 45, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 2, 391);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (183, 37, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 329);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (184, 21, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 2, 384);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (185, 1, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 1, 86);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (186, 16, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 1, 1);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (187, 61, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 298);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (188, 38, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('25-01-2026', 'dd-mm-yyyy'), 3, 33);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (189, 62, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 1, 189);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (190, 74, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 3, 96);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (191, 6, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 1, 254);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (192, 36, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 268);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (193, 78, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 1, 371);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (194, 96, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 2, 136);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (195, 98, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 3, 85);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (196, 82, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 3, 376);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (197, 39, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 3, 236);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (198, 26, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 58);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (199, 28, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 3, 107);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (200, 27, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 2, 64);
commit;
prompt 200 records committed...
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (201, 65, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 3, 331);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (202, 64, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 1, 217);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (203, 77, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 2, 393);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (204, 37, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 1, 19);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (205, 47, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 2, 219);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (206, 60, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 2, 120);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (207, 20, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 2, 40);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (208, 39, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 2, 382);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (209, 89, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 69);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (210, 34, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 3, 109);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (211, 32, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 3, 390);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (212, 21, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 3, 121);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (213, 63, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 1, 62);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (214, 45, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 3, 223);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (215, 52, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 1, 328);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (216, 22, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 1, 399);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (217, 68, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 1, 365);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (218, 74, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 3, 198);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (219, 81, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 272);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (220, 90, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 2, 335);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (221, 67, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 2, 140);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (222, 16, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 2, 235);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (223, 32, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 3, 380);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (224, 3, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 3, 46);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (225, 41, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 1, 174);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (226, 75, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 3, 285);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (227, 39, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 1, 184);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (228, 92, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 3, 362);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (229, 75, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 180);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (230, 11, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 1, 104);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (231, 4, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 3, 179);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (232, 82, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 321);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (233, 65, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 345);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (234, 1, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 2, 2);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (235, 43, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 2, 377);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (236, 65, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 19);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (237, 31, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 3, 1);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (238, 86, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 345);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (239, 48, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 1, 150);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (240, 65, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 1, 124);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (241, 51, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 2, 370);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (242, 27, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 1, 356);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (243, 81, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 2, 182);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (244, 53, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 1, 241);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (245, 60, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 1, 72);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (246, 11, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 2, 40);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (247, 82, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 2, 244);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (248, 27, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 2, 20);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (249, 78, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 2, 151);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (250, 47, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 2, 398);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (251, 25, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 215);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (252, 63, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 1, 207);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (253, 70, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 291);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (254, 57, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 2, 367);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (255, 83, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 2, 260);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (256, 5, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 3, 125);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (257, 39, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 398);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (258, 72, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 1, 216);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (259, 74, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 3, 202);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (260, 45, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 3, 185);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (261, 13, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 3, 200);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (262, 50, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 3, 63);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (263, 100, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 3, 179);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (264, 21, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('25-01-2026', 'dd-mm-yyyy'), 3, 116);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (265, 67, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 3, 53);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (266, 5, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 2, 249);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (267, 1, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 2, 34);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (268, 12, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 109);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (269, 6, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 3, 211);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (270, 12, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 397);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (271, 83, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 3, 132);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (272, 40, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 172);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (273, 98, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 1, 330);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (274, 2, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('25-01-2026', 'dd-mm-yyyy'), 3, 135);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (275, 4, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 1, 42);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (276, 83, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 1, 280);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (277, 4, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 1, 273);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (278, 94, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 1, 80);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (279, 13, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 3, 387);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (280, 59, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 3, 32);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (281, 100, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 1, 193);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (282, 7, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 277);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (283, 74, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 3, 99);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (284, 61, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 1, 186);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (285, 28, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 3, 350);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (286, 67, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 1, 92);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (287, 41, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 1, 169);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (288, 20, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 3, 184);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (289, 59, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 2, 45);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (290, 74, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 1, 136);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (291, 50, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 2, 351);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (292, 45, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 2, 252);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (293, 52, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 2, 329);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (294, 18, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 1, 41);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (295, 33, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 3, 94);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (296, 66, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 1, 373);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (297, 16, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 2, 55);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (298, 65, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 2, 48);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (299, 100, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 3, 364);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (300, 69, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 1, 119);
commit;
prompt 300 records committed...
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (301, 48, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 1, 158);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (302, 14, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 3, 40);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (303, 18, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 3, 237);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (304, 17, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 3, 245);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (305, 65, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 2, 303);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (306, 40, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 2, 168);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (307, 95, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 1, 308);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (308, 73, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 2, 236);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (309, 84, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 1, 202);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (310, 48, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 2, 116);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (311, 47, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 1, 222);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (312, 87, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 3, 99);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (313, 2, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 2, 345);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (314, 12, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 140);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (315, 99, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 1, 152);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (316, 6, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 2, 391);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (317, 80, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 1, 226);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (318, 72, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('18-01-2026', 'dd-mm-yyyy'), 2, 338);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (319, 57, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 2, 136);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (320, 23, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 2, 183);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (321, 37, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('01-01-2026', 'dd-mm-yyyy'), 1, 220);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (322, 1, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 3, 284);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (323, 53, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 2, 97);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (324, 63, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 354);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (325, 15, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 3, 205);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (326, 2, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 1, 73);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (327, 38, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 1, 267);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (328, 84, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 1, 99);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (329, 56, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 1, 61);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (330, 53, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 1, 321);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (331, 80, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 225);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (332, 43, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 257);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (333, 3, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 3, 156);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (334, 21, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('07-01-2026', 'dd-mm-yyyy'), 3, 366);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (335, 8, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 74);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (336, 42, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 2, 344);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (337, 42, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 1, 347);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (338, 50, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 3, 11);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (339, 83, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 2, 178);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (340, 57, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 2, 289);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (341, 10, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 199);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (342, 39, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'), 1, 249);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (343, 100, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('14-01-2026', 'dd-mm-yyyy'), 3, 371);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (344, 25, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 3, 368);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (345, 56, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('16-01-2026', 'dd-mm-yyyy'), 3, 370);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (346, 1, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 2, 124);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (347, 58, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 2, 60);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (348, 44, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 1, 123);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (349, 36, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 3, 38);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (350, 57, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 165);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (351, 43, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 2, 346);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (352, 84, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 3, 365);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (353, 64, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 3, 137);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (354, 8, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 2, 131);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (355, 9, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 2, 166);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (356, 41, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 1, 61);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (357, 54, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 1, 272);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (358, 97, to_date('17-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 3, 128);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (359, 62, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 2, 198);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (360, 86, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 1, 381);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (361, 32, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 2, 84);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (362, 24, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 1, 221);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (363, 71, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 329);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (364, 64, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 3, 316);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (365, 100, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('10-01-2026', 'dd-mm-yyyy'), 3, 326);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (366, 23, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 1, 204);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (367, 74, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('21-01-2026', 'dd-mm-yyyy'), 3, 205);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (368, 57, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 3, 352);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (369, 71, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 1, 228);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (370, 79, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 3, 50);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (371, 38, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 1, 103);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (372, 36, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 1, 1);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (373, 22, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 1, 212);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (374, 40, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('20-01-2026', 'dd-mm-yyyy'), 3, 113);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (375, 1, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 2, 211);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (376, 35, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('04-01-2026', 'dd-mm-yyyy'), 2, 267);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (377, 33, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'), 3, 334);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (378, 94, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 3, 199);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (379, 1, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('27-01-2026', 'dd-mm-yyyy'), 2, 164);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (380, 38, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 1, 263);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (381, 89, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 2, 111);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (382, 66, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 3, 364);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (383, 75, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('17-01-2026', 'dd-mm-yyyy'), 1, 341);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (384, 66, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 1, 53);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (385, 82, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 2, 314);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (386, 81, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('29-01-2026', 'dd-mm-yyyy'), 2, 378);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (387, 82, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 1, 137);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (388, 93, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('30-01-2026', 'dd-mm-yyyy'), 1, 326);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (389, 46, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 3, 183);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (390, 1, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'), 1, 105);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (391, 66, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 2, 143);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (392, 31, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('09-01-2026', 'dd-mm-yyyy'), 2, 387);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (393, 95, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('13-01-2026', 'dd-mm-yyyy'), 2, 45);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (394, 17, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'), 1, 334);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (395, 91, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'), 1, 45);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (396, 80, to_date('10-01-2024', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'), 3, 66);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (397, 40, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 3, 197);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (398, 68, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'), 3, 108);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (399, 99, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 1, 151);
insert into TICKETS (ticket_id, price, valid_from, valid_until, category_id, attraction_id)
values (400, 1, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'), 3, 33);
commit;
prompt 400 records loaded
prompt Loading ORDER_ITEMS...
insert into ORDER_ITEMS (ticket_id, order_id)
values (305, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (181, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (287, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (399, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (134, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (228, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (243, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (258, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (271, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (352, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (104, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (224, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (321, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (61, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (357, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (240, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (295, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (127, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (310, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (12, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (272, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (361, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (128, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (245, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (199, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (117, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (184, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (211, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (213, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (320, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (152, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (38, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (287, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (216, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (206, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (121, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (396, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (50, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (363, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (70, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (20, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (69, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (334, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (364, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (163, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (128, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (56, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (156, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (93, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (185, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (45, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (346, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (3, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (72, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (154, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (209, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (388, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (279, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (371, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (321, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (213, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (263, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (339, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (299, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (90, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (241, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (266, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (315, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (143, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (362, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (357, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (133, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (9, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (212, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (374, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (78, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (158, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (239, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (117, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (325, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (139, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (308, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (37, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (111, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (148, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (179, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (367, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (79, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (330, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (304, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (378, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (138, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (196, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (161, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (170, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (58, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (169, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (103, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (171, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (382, 402);
commit;
prompt 100 records committed...
insert into ORDER_ITEMS (ticket_id, order_id)
values (56, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (333, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (379, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (64, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (46, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (213, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (115, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (38, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (228, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (284, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (310, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (306, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (239, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (223, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (313, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (152, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (234, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (319, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (21, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (284, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (382, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (76, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (144, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (94, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (89, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (339, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (182, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (55, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (142, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (147, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (140, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (31, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (180, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (310, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (354, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (317, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (294, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (114, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (258, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (205, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (342, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (342, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (60, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (75, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (198, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (236, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (158, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (207, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (126, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (363, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (266, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (324, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (71, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (227, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (279, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (252, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (283, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (190, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (51, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (116, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (63, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (131, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (108, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (52, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (233, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (13, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (81, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (244, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (132, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (397, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (62, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (94, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (340, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (60, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (90, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (109, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (321, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (355, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (159, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (115, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (192, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (280, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (350, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (200, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (228, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (288, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (293, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (375, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (71, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (11, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (347, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (167, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (87, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (312, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (112, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (132, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (30, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (62, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (258, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (95, 407);
commit;
prompt 200 records committed...
insert into ORDER_ITEMS (ticket_id, order_id)
values (240, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (45, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (89, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (118, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (166, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (382, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (22, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (183, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (210, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (287, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (199, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (215, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (99, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (140, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (20, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (14, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (181, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (293, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (197, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (328, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (45, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (196, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (145, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (234, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (68, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (247, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (286, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (60, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (288, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (376, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (83, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (223, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (196, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (140, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (198, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (390, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (260, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (353, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (380, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (174, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (372, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (241, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (266, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (145, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (14, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (114, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (324, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (368, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (160, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (374, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (102, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (73, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (96, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (39, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (218, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (43, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (361, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (395, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (67, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (126, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (225, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (177, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (53, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (277, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (81, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (265, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (351, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (325, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (366, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (318, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (186, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (58, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (209, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (122, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (45, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (43, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (202, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (71, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (11, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (361, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (95, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (363, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (218, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (75, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (216, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (136, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (238, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (221, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (219, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (113, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (190, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (317, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (357, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (383, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (368, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (10, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (72, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (102, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (208, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (236, 406);
commit;
prompt 300 records committed...
insert into ORDER_ITEMS (ticket_id, order_id)
values (323, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (321, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (163, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (311, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (27, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (340, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (121, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (149, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (232, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (381, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (328, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (395, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (14, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (193, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (55, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (98, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (96, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (382, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (379, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (293, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (198, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (57, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (290, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (322, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (101, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (14, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (125, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (72, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (51, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (233, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (329, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (136, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (75, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (108, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (336, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (310, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (229, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (201, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (379, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (1, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (169, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (313, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (224, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (172, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (46, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (296, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (25, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (4, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (330, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (371, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (114, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (286, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (150, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (186, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (103, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (331, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (173, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (191, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (122, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (14, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (395, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (141, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (175, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (139, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (63, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (324, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (26, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (329, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (120, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (312, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (6, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (38, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (181, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (39, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (346, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (293, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (22, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (5, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (238, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (159, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (7, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (199, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (215, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (327, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (31, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (157, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (265, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (231, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (191, 406);
insert into ORDER_ITEMS (ticket_id, order_id)
values (133, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (57, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (288, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (385, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (208, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (107, 407);
insert into ORDER_ITEMS (ticket_id, order_id)
values (60, 405);
insert into ORDER_ITEMS (ticket_id, order_id)
values (28, 402);
insert into ORDER_ITEMS (ticket_id, order_id)
values (113, 404);
insert into ORDER_ITEMS (ticket_id, order_id)
values (257, 401);
insert into ORDER_ITEMS (ticket_id, order_id)
values (347, 406);
commit;
prompt 400 records loaded

set feedback on
set define on
prompt Done
