prompt PL/SQL Developer Export Tables for user C##BC@XE
prompt Created by Moshe Cohen on יום ראשון 28 יולי 2024
set feedback off
set define off

prompt Creating AREAS...
create table AREAS
(
  area_id   NUMBER not null,
  area_name VARCHAR2(50)
)
;
alter table AREAS
  add primary key (AREA_ID);

prompt Creating LOCATIONS...
create table LOCATIONS
(
  location_id   NUMBER not null,
  location_name VARCHAR2(40) not null,
  area_id       INTEGER not null
)
;
alter table LOCATIONS
  add primary key (LOCATION_ID);
alter table LOCATIONS
  add foreign key (AREA_ID)
  references AREAS (AREA_ID);

prompt Creating BRANCH...
create table BRANCH
(
  branchid      NUMBER(5) not null,
  branchaddress VARCHAR2(30) not null,
  branchmanager VARCHAR2(30) not null,
  location_id   NUMBER
)
;
alter table BRANCH
  add primary key (BRANCHID);
alter table BRANCH
  add constraint FK_BRANCH_LOCATION foreign key (LOCATION_ID)
  references LOCATIONS (LOCATION_ID);

prompt Creating ACOUNT...
create table ACOUNT
(
  accountid     NUMBER(5) not null,
  balance       INTEGER default 0 not null,
  accountnumber INTEGER not null,
  branchid      NUMBER(5) not null
)
;
alter table ACOUNT
  add primary key (ACCOUNTID);
alter table ACOUNT
  add foreign key (BRANCHID)
  references BRANCH (BRANCHID);

prompt Creating ACTIONS...
create table ACTIONS
(
  actionid   NUMBER(5) not null,
  actionname VARCHAR2(30) not null,
  actionsum  INTEGER not null,
  actiondate DATE default SYSDATE not null
)
;
alter table ACTIONS
  add primary key (ACTIONID);

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  customer_id    NUMBER not null,
  customer_name  VARCHAR2(40) not null,
  address_line_1 VARCHAR2(40) not null,
  address_line_2 VARCHAR2(40),
  phone_number   VARCHAR2(10)
)
;
alter table CUSTOMERS
  add primary key (CUSTOMER_ID);
alter table CUSTOMERS
  add constraint UNIQUE_PHONE_NUMBER unique (PHONE_NUMBER);

prompt Creating WORKER...
create table WORKER
(
  workerid        INTEGER not null,
  workername      VARCHAR2(30) not null,
  workerbirthdate DATE,
  workerrole      VARCHAR2(30) not null
)
;
alter table WORKER
  add primary key (WORKERID);

prompt Creating ACTIVITY...
create table ACTIVITY
(
  activityid  NUMBER(5) not null,
  actionid    NUMBER(5) not null,
  accountid   NUMBER(5) not null,
  workerid    INTEGER not null,
  customer_id NUMBER
)
;
alter table ACTIVITY
  add primary key (ACTIVITYID);
alter table ACTIVITY
  add constraint FK_CUSTOMER foreign key (CUSTOMER_ID)
  references CUSTOMERS (CUSTOMER_ID);
alter table ACTIVITY
  add constraint FK_WORKER foreign key (WORKERID)
  references WORKER (WORKERID);
alter table ACTIVITY
  add foreign key (ACTIONID)
  references ACTIONS (ACTIONID);
alter table ACTIVITY
  add foreign key (ACCOUNTID)
  references ACOUNT (ACCOUNTID);

prompt Creating ATTRACTIONS...
create table ATTRACTIONS
(
  attraction_id   NUMBER not null,
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
  category_id   NUMBER not null,
  category_name VARCHAR2(40) not null,
  min_age       INTEGER not null
)
;
alter table CATEGORIES
  add primary key (CATEGORY_ID);

prompt Creating LOAN...
create table LOAN
(
  loanid      NUMBER(5) not null,
  numofpaymet NUMBER(5) not null,
  loansum     INTEGER not null
)
;
alter table LOAN
  add primary key (LOANID);

prompt Creating LOANTOACCOUNT...
create table LOANTOACCOUNT
(
  loandate      DATE not null,
  returnedornot NUMBER(5) not null,
  loanid        NUMBER(5) not null,
  accountid     NUMBER(5) not null
)
;
alter table LOANTOACCOUNT
  add primary key (LOANID, ACCOUNTID);
alter table LOANTOACCOUNT
  add foreign key (LOANID)
  references LOAN (LOANID);
alter table LOANTOACCOUNT
  add foreign key (ACCOUNTID)
  references ACOUNT (ACCOUNTID);

prompt Creating ORDERS...
create table ORDERS
(
  order_id    NUMBER not null,
  order_date  DATE default SYSDATE not null,
  customer_id INTEGER not null,
  discount    NUMBER,
  accountid   NUMBER(5)
)
;
alter table ORDERS
  add primary key (ORDER_ID);
alter table ORDERS
  add constraint FK_ORDERS_ACCOUNT foreign key (ACCOUNTID)
  references ACOUNT (ACCOUNTID);
alter table ORDERS
  add foreign key (CUSTOMER_ID)
  references CUSTOMERS (CUSTOMER_ID);

prompt Creating TICKETS...
create table TICKETS
(
  ticket_id     NUMBER not null,
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
  add constraint FK_ORDER_ITEMS_ORDER foreign key (ORDER_ID)
  references ORDERS (ORDER_ID);
alter table ORDER_ITEMS
  add constraint FK_ORDER_ITEMS_TICKET foreign key (TICKET_ID)
  references TICKETS (TICKET_ID);

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
values (4, 'Santana do parnaÃ­ba', 1562);
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
values (10, 'SÃ£o paulo', 1485);
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
values (54, 'TÃ¤by', 1470);
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
values (75, 'NynÃ¤shamn', 1240);
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
values (91, 'HillerÃ¸d', 1318);
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
values (103, 'CuiabÃ¡', 1255);
insert into LOCATIONS (location_id, location_name, area_id)
values (104, 'Jacksonville', 1521);
insert into LOCATIONS (location_id, location_name, area_id)
values (105, 'NeuchÃ¢tel', 1456);
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
values (174, 'GenÃ¨ve', 1537);
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
values (182, 'MalmÃ¶', 1592);
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
values (230, 'HillerÃ¸d', 1299);
insert into LOCATIONS (location_id, location_name, area_id)
values (231, 'Brno', 1512);
insert into LOCATIONS (location_id, location_name, area_id)
values (232, 'Rheinfelden', 1446);
insert into LOCATIONS (location_id, location_name, area_id)
values (233, 'Richmond', 1542);
insert into LOCATIONS (location_id, location_name, area_id)
values (234, 'Kerava', 1591);
insert into LOCATIONS (location_id, location_name, area_id)
values (235, 'GenÃ¨ve', 1477);
insert into LOCATIONS (location_id, location_name, area_id)
values (236, 'Americana', 1362);
insert into LOCATIONS (location_id, location_name, area_id)
values (237, 'Oxford', 1232);
insert into LOCATIONS (location_id, location_name, area_id)
values (238, 'New Hope', 1466);
insert into LOCATIONS (location_id, location_name, area_id)
values (239, 'GenÃ¨ve', 1360);
insert into LOCATIONS (location_id, location_name, area_id)
values (240, 'Stony Point', 1484);
insert into LOCATIONS (location_id, location_name, area_id)
values (241, 'West Lafayette', 1490);
insert into LOCATIONS (location_id, location_name, area_id)
values (242, 'AniÃ¨res', 1273);
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
values (258, 'EisenhÃ¼ttenstadt', 1370);
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
values (264, 'AniÃ¨res', 1434);
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
prompt Loading BRANCH...
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (1, 'GalgalHamazalot 60,Hod Hashron', 'Michal', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (2, 'RabiAkiva 10,Bnei Brak', 'Michal', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (3, 'RabiAkiva 2,Bnei Brak', 'Michal', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (4, '93 Ellicott City Ave', 'Gavin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (5, '78 Kretschmann Road', 'Jimmie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (6, '27 Lin Street', 'Darren', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (7, '26 Roundtree Drive', 'Rosie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (8, '13rd Street', 'Gailard', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (9, '5 Holy Drive', 'Merrilee', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (10, '716 Hohenfels Drive', 'Frank', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (11, '22nd Street', 'Carol', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (12, '54 Crystal Road', 'Fats', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (13, '25 Murphy Street', 'Stellan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (14, '20 Berkoff Drive', 'Malcolm', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (15, '609 Arnold', 'Simon', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (16, '55 Winnipeg Street', 'Joaquim', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (17, '72 Moffat Drive', 'Hugh', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (18, '17 Pfeiffer Ave', 'Val', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (19, '36 Daniel Street', 'Vincent', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (20, '53 Monterey', 'Sammy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (21, '72 Redondo beach Road', 'Gordie', 189);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (22, '8 Tanon Drive', 'Kathleen', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (23, '22 Meryl Street', 'Pablo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (24, '125 Hopper Drive', 'Harry', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (25, '31st Street', 'Clarence', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (26, '88 Thewlis Street', 'Fisher', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (27, '38 Cleese Road', 'Goldie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (28, '789 Lorraine Street', 'Tom', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (29, '34 Applegate Street', 'Saul', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (30, '71 Rua eteno Drive', 'Lou', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (31, '71 Lummen', 'Diamond', 270);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (32, '92 Magstadt Street', 'Adam', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (33, '43 Bratt Street', 'Jarvis', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (34, '92 Shelton Blvd', 'Fisher', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (35, '64 Juliet Street', 'Orlando', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (36, '960 Gaza Street', 'Dennis', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (37, '84 Hector Road', 'Danny', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (38, '97 Posey Road', 'Julianne', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (39, '1 Eindhoven Road', 'Connie', 24);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (40, '52 Rourke Road', 'Rowan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (41, '77 Cassidy Drive', 'Willie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (42, '72 Columbus Drive', 'Bette', 349);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (43, '69 Phoebe Road', 'Vern', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (44, '74 Reed Street', 'Lennie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (45, '100 Lea Ave', 'Kenneth', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (46, '54 Adler Drive', 'Maura', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (47, '6 Leachman Street', 'Jean-Claude', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (48, '69 Northbrook Road', 'Cameron', 138);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (49, '81 Uma Road', 'Benjamin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (50, '75 Waits Street', 'Ving', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (51, '91 Morse Road', 'Vin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (52, '22nd Street', 'Jackson', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (53, '744 Garza Street', 'Hookah', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (54, '52 Harary Road', 'Frances', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (55, '18 Latin Drive', 'Debra', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (56, '103 Dafoe Street', 'Andrew', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (57, '49 Ike Street', 'Ashton', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (58, '85 Pitt Ave', 'Sonny', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (59, '862 Granada Hills Blvd', 'Kazem', 244);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (60, '920 Jeanne Street', 'Javon', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (61, '55 Hutch Blvd', 'Julianna', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (62, '762 Ulsteinvik Road', 'Emma', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (63, '27 Stiller', 'Rhona', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (64, '7 Redgrave Drive', 'Teena', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (65, '24 Al Road', 'Glen', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (66, '37 Tambor Road', 'Shelby', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (67, '87 ThÃ¶rishaus Drive', 'Angelina', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (68, '6 LaPaglia Street', 'Mindy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (69, '339 Cube Blvd', 'Toshiro', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (70, '64 MÃ¼nster Road', 'Bernie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (71, '65 Perry Road', 'Tom', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (72, '87 Oshkosh Blvd', 'Gino', 149);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (73, '52 Orlando Drive', 'Chazz', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (74, '100 Crowe Street', 'Joseph', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (75, '48 Silverdale Drive', 'Vondie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (76, '8 Woodland Hills Drive', 'Saffron', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (77, '17 Julie Street', 'Rik', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (78, '173 Glen Drive', 'Jet', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (79, '45 Burrows Blvd', 'Isaiah', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (80, '70 Thewlis Ave', 'Katrin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (81, '98 Luis Blvd', 'Thin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (82, '34 Rifkin Road', 'Ving', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (83, '18 Ted Road', 'Joey', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (84, '75 Libertyville Road', 'Mitchell', 98);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (85, '84 Ann Road', 'Clay', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (86, '7 Sellers Drive', 'Emmylou', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (87, '21st Street', 'Peabo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (88, '3 Collie Street', 'Wes', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (89, '86 Wainwright Road', 'Joaquim', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (90, '911 Hopper Road', 'Burton', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (91, '423 Saffron Street', 'Jean-Luc', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (92, '57 Hobson Street', 'Elle', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (93, '89 Bacharach Street', 'Fred', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (94, '75 Osmond Road', 'Val', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (95, '93rd Street', 'Mac', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (96, '65 Debbie Road', 'Renee', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (97, '27 Dean Blvd', 'Owen', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (98, '289 Quinones Road', 'Hugh', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (99, '951 Domino Street', 'Emerson', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (100, '78 Goodman Street', 'Annette', null);
commit;
prompt 100 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (101, '72nd Street', 'Jane', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (102, '8 Rochester Drive', 'Armin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (103, '81st Street', 'Roddy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (104, '51 Warrington Blvd', 'Gran', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (105, '22 Cagle Road', 'Joey', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (106, '72 Ice Ave', 'Ethan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (107, '56 Van Shelton Blvd', 'Hope', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (108, '22nd Street', 'Linda', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (109, '71st Street', 'Wesley', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (110, '412 Lexington Ave', 'Petula', 243);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (111, '55 Thurman Road', 'Bobby', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (112, '33rd Street', 'Kid', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (113, '83 Sinatra Drive', 'Taryn', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (114, '63 Whittier Road', 'Gates', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (115, '91st Street', 'Jarvis', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (116, '69 Helen Road', 'Ahmad', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (117, '35 Nielsen Road', 'Vanessa', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (118, '51 Chubby Street', 'Trick', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (119, '83rd Street', 'Noah', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (120, '438 Herzlia Blvd', 'Night', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (121, '25 Scottsdale Drive', 'Jody', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (122, '695 Bernard Drive', 'Nikka', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (123, '1 Kitty', 'Cate', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (124, '7 Rhea Street', 'Teri', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (125, '62nd Street', 'Sara', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (126, '71 Hawn Drive', 'Joshua', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (127, '74 Eiksmarka Road', 'Jackie', 96);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (128, '28 Hilton Road', 'Pete', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (129, '71st Street', 'Josh', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (130, '269 Laws', 'Anthony', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (131, '2 Research Triangle Drive', 'Ali', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (132, '32nd Street', 'Clint', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (133, '87 MacPherson', 'Ashton', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (134, '557 Latin', 'Sophie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (135, '67 Kirsten Drive', 'Tom', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (136, '83 Keith Road', 'Helen', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (137, '58 Christine Road', 'Bill', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (138, '95 Colon Drive', 'Joseph', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (139, '21st Street', 'Rupert', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (140, '55 Jonatha Road', 'Susan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (141, '352 Tommy Street', 'Penelope', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (142, '120 Whitley Road', 'Jack', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (143, '259 Saint Ouen Road', 'Treat', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (144, '65 Judge Drive', 'Doug', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (145, '71st Street', 'Marlon', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (146, '39 Jann Road', 'Natascha', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (147, '96 Lizzy Road', 'Wendy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (148, '67 Herzogenrath Road', 'Trini', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (149, '52nd Street', 'Kathy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (150, '490 Ned Street', 'Merillee', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (151, '11 Emilio Blvd', 'Rosanne', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (152, '85 Oslo Ave', 'Pelvic', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (153, '526 Lindsey Drive', 'Gwyneth', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (154, '2 Turner Drive', 'Warren', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (155, '959 Livermore Road', 'Toni', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (156, '72 Runcorn Road', 'Ashton', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (157, '80 Sugar Land Ave', 'Bob', 227);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (158, '98 Reese Road', 'Mili', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (159, '35 Metcalf', 'Geena', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (160, '56 Dennis Drive', 'Terence', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (161, '93rd Street', 'Miles', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (162, '64 Oldham Street', 'Wally', 136);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (163, '82 Lathrop Drive', 'Max', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (164, '91 Lummen Road', 'Fiona', 270);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (165, '68 Newcastle upon Tyne Road', 'Carole', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (166, '50 Debby Street', 'Allan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (167, '53 Stanford Ave', 'Ani', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (168, '26 Lou Street', 'Embeth', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (169, '19 Oldman Drive', 'Arturo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (170, '59 Sorocaba Drive', 'Liev', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (171, '59 Sellers Road', 'Gin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (172, '71st Street', 'Andre', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (173, '71 Joey Drive', 'Lindsay', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (174, '50 Howard', 'Rhys', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (175, '35 Nanaimo Street', 'Gwyneth', 131);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (176, '19 Begley Ave', 'Jennifer', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (177, '80 Merchant Street', 'Fisher', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (178, '81 Giovanni Road', 'Ritchie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (179, '15 Lineback Drive', 'Brooke', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (180, '29 Ian Drive', 'Johnny', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (181, '48 Buscemi Blvd', 'Greg', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (182, '95 Hookah Ave', 'Alessandro', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (183, '565 Deejay Road', 'Sharon', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (184, '91 Embeth Road', 'Pamela', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (185, '586 Eiksmarka Street', 'Viggo', 96);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (186, '1 Domino Road', 'Rickie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (187, '54 Lucien Ave', 'Adrien', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (188, '343 Petach-Tikva Road', 'Buffy', 396);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (189, '229 Liv Road', 'Desmond', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (190, '35 Alannah Ave', 'Connie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (191, '19 Bolzano Street', 'Samantha', 212);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (192, '957 Hall Drive', 'Kim', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (193, '63 Mos Street', 'Teena', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (194, '76 Schaumburg Road', 'Olga', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (195, '24 Benoit Street', 'Jody', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (196, '57 East sussex Blvd', 'Oded', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (197, '3 Fort gordon Street', 'Chely', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (198, '55 Davison Blvd', 'Alannah', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (199, '72 James Road', 'Dylan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (200, '92 Osaka Road', 'Rik', null);
commit;
prompt 200 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (201, '361 Meredith Road', 'Kid', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (202, '6 Sutherland Street', 'Stevie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (203, '11 McBride Road', 'Gran', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (204, '63 Oak park Drive', 'Rebeka', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (205, '75 Tilda Road', 'Lila', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (206, '67 Fishburne Drive', 'Carolyn', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (207, '1 Bern Street', 'Reese', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (208, '487 Colton Blvd', 'Sona', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (209, '82nd Street', 'Roberta', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (210, '59 Preston Ave', 'Vivica', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (211, '259 Los Angeles Drive', 'Jude', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (212, '27 Roy Parnell Ave', 'Geggy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (213, '58 Farrow Road', 'Julie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (214, '32 Hampton Drive', 'Jackson', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (215, '89 Milwaukee Road', 'Fiona', 20);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (216, '85 Agoncillo Drive', 'Stockard', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (217, '11 Oszajca Road', 'Emerson', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (218, '29 Ebersberg Street', 'Gates', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (219, '866 Davidson Road', 'Samuel', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (220, '52nd Street', 'Fairuza', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (221, '55 Coyote Drive', 'Gabrielle', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (222, '47 Suwon-city Blvd', 'George', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (223, '72nd Street', 'Stephanie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (224, '85 Ulm Drive', 'Diane', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (225, '100 Chambery Street', 'Mary-Louise', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (226, '68 Balmoral Road', 'Jeroen', 215);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (227, '40 McLachlan', 'Rosco', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (228, '67 MacDonald Road', 'Jena', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (229, '175 Rydell Ave', 'Bo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (230, '10 Lyngby', 'Andrae', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (231, '81 Patton Road', 'Lizzy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (232, '622 Waite Drive', 'Talvin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (233, '40 Lahr Road', 'Rip', 33);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (234, '99 Burlington Street', 'Corey', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (235, '712 Julianna Road', 'Jonny', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (236, '47 Debary Street', 'Mena', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (237, '98 Verwood Road', 'Armin', 263);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (238, '100 Yucca', 'Olympia', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (239, '974 Hermitage Road', 'Sal', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (240, '80 Forest Street', 'Alex', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (241, '2 Ramis Ave', 'Ethan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (242, '322 Lara Road', 'Nils', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (243, '22 Garofalo Drive', 'Joanna', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (244, '11 Anjelica Blvd', 'Veruca', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (245, '508 Valencia Blvd', 'Michelle', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (246, '5 Yaphet Road', 'Sona', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (247, '23 Maidenhead Road', 'Nastassja', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (248, '52nd Street', 'Geggy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (249, '44 Bryson Ave', 'Sandra', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (250, '68 North Wales Ave', 'Earl', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (251, '50 Hyderabad Drive', 'Lionel', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (252, '557 Cochran Road', 'Roy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (253, '31st Street', 'Lou', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (254, '71 Ferrell Street', 'Peabo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (255, '20 Thorton Drive', 'Freda', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (256, '1 Arturo Street', 'Meredith', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (257, '54 Jay Drive', 'Meredith', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (258, '43rd Street', 'Rueben', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (259, '19 von Sydow Blvd', 'Milla', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (260, '99 Breda Street', 'Judd', 328);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (261, '22 Stellenbosch Street', 'Patty', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (262, '40 Radney Road', 'Henry', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (263, '49 Mitchell Road', 'Beth', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (264, '55 Huston Drive', 'Deborah', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (265, '47 Daejeon Road', 'Ahmad', 170);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (266, '34 Marsden Road', 'Angie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (267, '33 Goslar Drive', 'Fairuza', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (268, '33rd Street', 'Nils', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (269, '81st Street', 'Teena', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (270, '559 Abbotsford Street', 'Swoosie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (271, '30 Juazeiro Road', 'Dorry', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (272, '347 Colton Road', 'Famke', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (273, '95 Rivers Street', 'Bradley', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (274, '40 Hagerty Road', 'Desmond', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (275, '27 Elizabeth Road', 'Louise', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (276, '48 Willis Blvd', 'Lesley', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (277, '44 Gummersbach Ave', 'Dan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (278, '50 Mason Street', 'Lou', 393);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (279, '71 Juliet Road', 'Juliana', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (280, '70 Gough Street', 'Avril', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (281, '75 David Street', 'Gavin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (282, '881 Cattrall', 'Dennis', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (283, '91 Oak park Street', 'Heather', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (284, '18 Colton Blvd', 'Owen', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (285, '52nd Street', 'Edie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (286, '59 Allison Blvd', 'Ronnie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (287, '73rd Street', 'Breckin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (288, '37 Richard Blvd', 'Todd', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (289, '60 Warwick Drive', 'Wade', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (290, '82nd Street', 'Adrien', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (291, '91 Guamo', 'Red', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (292, '94 Mazar Street', 'Pierce', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (293, '99 Belgrad', 'Emmylou', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (294, '85 Mclean Road', 'Teri', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (295, '1 Loreena Drive', 'Patti', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (296, '27 Short Road', 'Mena', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (297, '207 Naestved Road', 'Alessandro', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (298, '37 Kirk Drive', 'Janeane', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (299, '75 Will', 'Jennifer', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (300, '35 Angelina Blvd', 'Deborah', null);
commit;
prompt 300 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (301, '53 Trevino Drive', 'Ani', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (302, '26 Brenda Road', 'Wade', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (303, '47 Edwardstown Ave', 'Aaron', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (304, '17 Sheena Street', 'Delroy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (305, '65 Beatty Drive', 'Aimee', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (306, '43 DiBiasio Ave', 'Maura', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (307, '48 Williamson Drive', 'Walter', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (308, '58 Unger Road', 'Mary Beth', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (309, '10 North bethesda Street', 'Martha', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (310, '16 Lemmon Blvd', 'Jeff', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (311, '62 Clea Road', 'Samuel', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (312, '18 Brendan Street', 'Zooey', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (313, '3 Irving Ave', 'Lennie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (314, '4 Battle Creek Street', 'Fionnula', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (315, '64 Kitty Ave', 'Praga', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (316, '52nd Street', 'Louise', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (317, '36 Rifkin Road', 'Wally', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (318, '60 Rickles Street', 'Jeanne', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (319, '129 Suwon Road', 'Alex', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (320, '92nd Street', 'Madeline', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (321, '12 Doucette Street', 'Spike', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (322, '167 Loeb Street', 'Roberta', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (323, '95 Gallagher Ave', 'Cary', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (324, '4 Bryson', 'Talvin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (325, '50 Geoffrey Street', 'Lila', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (326, '94 Roanoke', 'Celia', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (327, '23 Gough Ave', 'Guy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (328, '93 Rawlins Road', 'Rory', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (329, '43 Idol Road', 'Adam', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (330, '71st Street', 'Chet', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (331, '12 Wells Street', 'Ritchie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (332, '31st Street', 'Owen', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (333, '76 Mogliano Veneto Road', 'Anthony', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (334, '92 Yankovic Blvd', 'Demi', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (335, '88 Maserada sul Piave Drive', 'Johnnie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (336, '32 Crosby Street', 'Jeff', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (337, '80 Wincott Blvd', 'Juice', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (338, '20 Powers', 'Mark', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (339, '79 Lathrop Street', 'Mindy', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (340, '87 Lorenz Road', 'Joe', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (341, '5 O''Neal Blvd', 'Arturo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (342, '87 LÃ¼beck Ave', 'Lisa', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (343, '9 Bruneck Drive', 'Jeanne', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (344, '448 Scorsese Blvd', 'Anna', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (345, '22 Randal Street', 'Arturo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (346, '18 Ipswich Street', 'Colm', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (347, '57 Ticotin Street', 'Don', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (348, '8 Collective Road', 'Stevie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (349, '701 Pat Blvd', 'Devon', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (350, '49 Jackman Road', 'Larry', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (351, '89 Aiken Drive', 'Merillee', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (352, '79 Tennison Ave', 'Cate', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (353, '49 Diffie Drive', 'Allison', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (354, '70 Pullman Blvd', 'Robin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (355, '64 Robbie Road', 'Gabriel', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (356, '31st Street', 'Claude', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (357, '63 Mount Laurel Street', 'Julianne', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (358, '48 Plummer Blvd', 'Thin', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (359, '32 Hohenfels Blvd', 'Sheryl', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (360, '68 Hagerty Street', 'Maureen', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (361, '89 Morton Street', 'Phoebe', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (362, '4 Hikaru Road', 'Trey', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (363, '30 Gill Blvd', 'Ty', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (364, '3 Bollensen Street', 'Suzanne', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (365, '48 Farris Street', 'Lindsey', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (366, '33rd Street', 'Azucar', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (367, '1 Shand Street', 'Angelina', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (368, '3 Macht', 'Rosie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (369, '76 Sarandon Blvd', 'Angelina', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (370, '619 Toshiro Road', 'Rosario', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (371, '443 Diaz Street', 'Glenn', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (372, '7 Hampton Road', 'Tim', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (373, '71 Utada Ave', 'Terry', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (374, '8 Myers Street', 'Drew', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (375, '937 Trejo Road', 'Christopher', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (376, '8 Laurie Road', 'Nils', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (377, '868 Smyrna', 'Greg', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (378, '34 Armin Road', 'Maria', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (379, '44 Espoo Blvd', 'Linda', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (380, '83 Cooper Blvd', 'Howard', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (381, '8 Hazel Blvd', 'Candice', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (382, '77 Napolitano Road', 'Bo', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (383, '19 Redmond Street', 'Aidan', 185);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (384, '75 Sevenfold Road', 'Dorry', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (385, '60 Melvin Drive', 'Giovanni', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (386, '79 Val Ave', 'Kylie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (387, '14 Carl', 'CeCe', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (388, '82nd Street', 'Juice', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (389, '30 Costello Drive', 'Nelly', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (390, '27 Merchant Street', 'Carrie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (391, '82 Neville Street', 'Aidan', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (392, '779 De Niro', 'Peter', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (393, '93 Melrose park', 'Murray', 88);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (394, '212 Carlsbad', 'Elle', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (395, '44 Herndon Road', 'Raymond', 61);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (396, '21st Street', 'Jake', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (397, '50 Pottendorf Drive', 'Heather', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (398, '82 Austin Blvd', 'Edie', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (399, '702 Oak park Blvd', 'Chaka', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (400, '41st Street', 'Ali', null);
commit;
prompt 400 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (401, '22nd Street', 'Rosanne', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (402, '72 Phil Road', 'Tea', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (403, '769 Kejae City Ave', 'Rachel', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (404, 'RabiAkiva 55,Bnei Brak', 'Michael', null);
insert into BRANCH (branchid, branchaddress, branchmanager, location_id)
values (405, 'RabiAkiva 55,Bnei Brak', 'Michael', null);
commit;
prompt 405 records loaded
prompt Loading ACOUNT...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (1, 200, 123456, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (2, 0, 654321, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (3, 1234, 615243, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (4, 1000, 162534, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (5, 188153, 306095, 311);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (6, 134741, 985257, 95);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (7, 216506, 608984, 240);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (8, 939953, 931011, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (9, 757839, 374006, 197);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (10, 118550, 382494, 125);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (11, 556454, 351816, 104);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (12, 829808, 752672, 307);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (13, 884641, 343468, 167);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (14, 391783, 802167, 187);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (15, 40194, 381045, 263);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (16, 747455, 208159, 368);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (17, 220723, 473138, 62);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (18, 679954, 724540, 371);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (19, 394782, 575178, 200);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (20, 554855, 896628, 140);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (21, 289124, 533802, 135);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (22, 872353, 565701, 131);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (23, 721662, 251006, 368);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (24, 706118, 771370, 89);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (25, 752930, 508105, 175);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (26, 501110, 839601, 133);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (27, 567295, 562634, 128);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (28, 512217, 787254, 250);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (29, 191462, 314636, 129);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (30, 701710, 686604, 100);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (31, 174430, 513505, 330);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (32, 988704, 671706, 153);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (33, 752434, 773892, 266);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (34, 670567, 438844, 45);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (35, 867185, 770461, 390);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (36, 427056, 652031, 396);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (37, 258215, 317715, 292);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (38, 885305, 417720, 321);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (39, 773021, 893929, 383);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (40, 80290, 996904, 139);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (41, 594320, 168737, 85);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (42, 603351, 983828, 52);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (43, 334774, 123278, 197);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (44, 603449, 454823, 174);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (45, 458249, 341413, 37);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (46, 404477, 984650, 23);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (47, 315843, 381414, 47);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (48, 139601, 297355, 18);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (49, 796802, 541200, 271);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (50, 792916, 970301, 135);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (51, 251660, 487677, 233);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (52, 191973, 199977, 100);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (53, 510002, 463433, 129);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (54, 124662, 672670, 136);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (55, 550588, 493103, 194);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (56, 672836, 318327, 86);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (57, 249736, 518486, 219);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (58, 375603, 268234, 353);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (59, 697349, 177108, 206);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (60, 769779, 742678, 204);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (61, 391253, 634750, 169);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (62, 516092, 769895, 79);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (63, 262117, 269660, 310);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (64, 519990, 538447, 25);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (65, 505637, 416016, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (66, 507588, 918114, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (67, 668403, 788009, 44);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (68, 233167, 605549, 155);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (69, 911383, 554808, 330);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (70, 186998, 766691, 309);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (71, 922851, 102020, 204);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (72, 153691, 414419, 296);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (73, 133195, 228242, 127);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (74, 554334, 783477, 156);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (75, 760076, 367191, 319);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (76, 2675, 501499, 117);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (77, 346143, 727963, 92);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (78, 229317, 811341, 158);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (79, 905663, 889403, 148);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (80, 290527, 332012, 243);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (81, 133288, 600723, 35);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (82, 92551, 759705, 5);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (83, 410457, 810472, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (84, 540644, 262833, 322);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (85, 134919, 201179, 29);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (86, 376892, 621959, 242);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (87, 259268, 328567, 217);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (88, 814866, 363276, 144);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (89, 417503, 483443, 151);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (90, 724642, 339060, 280);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (91, 707112, 692554, 290);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (92, 181305, 776594, 168);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (93, 640499, 882977, 196);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (94, 976177, 254651, 142);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (95, 46116, 734321, 74);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (96, 15193, 430024, 372);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (97, 349143, 465380, 259);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (98, 705659, 431974, 70);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (99, 756221, 528163, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (100, 273354, 126171, 50);
commit;
prompt 100 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (101, 971337, 443625, 352);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (102, 769435, 927934, 254);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (103, 242779, 491276, 377);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (104, 132936, 973559, 65);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (105, 346754, 990328, 144);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (106, 382756, 844587, 247);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (107, 614219, 664427, 390);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (108, 635030, 139149, 312);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (109, 866317, 796586, 10);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (110, 490449, 503396, 131);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (111, 202842, 636861, 194);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (112, 223790, 530647, 170);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (113, 550129, 853968, 259);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (114, 447145, 512540, 367);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (115, 781940, 804512, 320);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (116, 321693, 841409, 110);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (117, 642024, 661212, 320);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (118, 272720, 722612, 184);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (119, 682298, 475573, 80);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (120, 331550, 115748, 357);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (121, 548832, 482187, 198);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (122, 998543, 491008, 118);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (123, 261256, 262500, 328);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (124, 705905, 817480, 232);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (125, 202505, 106692, 141);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (126, 870173, 100309, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (127, 427430, 224491, 337);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (128, 974438, 909488, 288);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (129, 173210, 990648, 218);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (130, 422129, 700995, 104);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (131, 174216, 749529, 399);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (132, 870003, 777144, 206);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (133, 111536, 877245, 394);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (134, 690354, 373775, 33);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (135, 325214, 790030, 119);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (136, 943927, 653388, 9);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (137, 347911, 825611, 166);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (138, 77997, 331869, 320);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (139, 944689, 891169, 182);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (140, 311182, 428282, 163);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (141, 727388, 698564, 181);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (142, 640143, 408531, 166);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (143, 116196, 675949, 175);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (144, 416076, 450842, 272);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (145, 7894, 786004, 245);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (146, 803110, 100154, 377);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (147, 42500, 476059, 43);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (148, 959070, 355980, 208);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (149, 400091, 465516, 386);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (150, 783948, 960239, 181);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (151, 669895, 822610, 389);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (152, 375354, 374341, 347);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (153, 76952, 326742, 393);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (154, 225749, 964567, 255);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (155, 290079, 935787, 122);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (156, 505808, 807878, 117);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (157, 731202, 911083, 245);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (158, 814413, 492867, 326);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (159, 822684, 277489, 159);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (160, 350968, 978950, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (161, 508723, 443298, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (162, 892472, 197306, 367);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (163, 731595, 256026, 221);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (164, 48626, 985773, 175);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (165, 896070, 456558, 193);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (166, 335621, 953105, 8);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (167, 778186, 696926, 15);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (168, 465691, 822034, 221);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (169, 390207, 537522, 27);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (170, 207561, 111594, 147);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (171, 64595, 318914, 130);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (172, 44925, 643471, 311);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (173, 28599, 542992, 92);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (174, 958795, 101028, 368);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (175, 70162, 779139, 34);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (176, 797195, 789239, 343);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (177, 107780, 964715, 105);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (178, 184981, 645461, 385);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (179, 634154, 576688, 367);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (180, 579850, 390885, 384);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (181, 668519, 443889, 119);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (182, 210501, 997009, 132);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (183, 87906, 428480, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (184, 51868, 826713, 68);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (185, 575715, 461945, 170);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (186, 12828, 101791, 51);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (187, 989505, 556568, 133);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (188, 946372, 704391, 382);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (189, 271145, 459150, 253);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (190, 253356, 844886, 52);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (191, 164128, 250943, 168);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (192, 551157, 779583, 299);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (193, 527189, 157619, 308);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (194, 430286, 444603, 89);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (195, 3184, 396885, 121);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (196, 537863, 543429, 144);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (197, 779650, 890268, 402);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (198, 419224, 591374, 219);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (199, 225352, 880922, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (200, 530384, 836687, 318);
commit;
prompt 200 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (201, 867807, 662304, 173);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (202, 917079, 951596, 88);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (203, 552675, 314471, 120);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (204, 53179, 973351, 222);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (205, 259820, 396777, 348);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (206, 554924, 181726, 318);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (207, 4804, 339217, 73);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (208, 750080, 681544, 314);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (209, 91609, 340797, 361);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (210, 695420, 922937, 317);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (211, 764543, 803287, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (212, 14233, 294525, 239);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (213, 597334, 933941, 326);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (214, 180432, 171655, 16);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (215, 817800, 222295, 323);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (216, 419809, 949585, 214);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (217, 759599, 165444, 381);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (218, 544473, 646296, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (219, 821079, 864307, 276);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (220, 596077, 477687, 3);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (221, 257517, 371707, 216);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (222, 459584, 695491, 281);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (223, 899640, 922795, 139);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (224, 434503, 691627, 51);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (225, 40743, 750713, 72);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (226, 427296, 618141, 93);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (227, 329439, 566649, 3);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (228, 769475, 605544, 132);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (229, 107611, 694892, 168);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (230, 983278, 490596, 385);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (231, 305997, 281288, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (232, 923283, 743600, 253);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (233, 315499, 569011, 46);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (234, 930304, 821273, 281);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (235, 253288, 739962, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (236, 755988, 720620, 199);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (237, 301543, 284637, 247);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (238, 365177, 478033, 285);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (239, 375810, 169282, 149);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (240, 110791, 402525, 244);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (241, 841828, 747757, 333);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (242, 515213, 958617, 79);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (243, 406934, 698055, 360);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (244, 795546, 779363, 7);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (245, 227184, 881094, 308);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (246, 649918, 199473, 300);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (247, 756671, 303483, 336);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (248, 491017, 908741, 198);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (249, 483705, 247701, 69);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (250, 583499, 743260, 203);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (251, 511976, 293783, 323);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (252, 226530, 112495, 3);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (253, 516121, 427378, 92);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (254, 533805, 610366, 112);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (255, 992719, 891301, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (256, 313626, 434378, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (257, 502143, 322495, 222);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (258, 353350, 244739, 378);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (259, 816440, 905174, 230);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (260, 878350, 991612, 390);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (261, 115918, 594758, 356);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (262, 398021, 629349, 307);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (263, 675026, 607607, 374);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (264, 382791, 378086, 312);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (265, 408702, 259512, 104);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (266, 549117, 291584, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (267, 276419, 852820, 258);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (268, 776519, 102038, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (269, 424886, 189105, 204);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (270, 154325, 943914, 15);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (271, 154493, 702744, 73);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (272, 168513, 466013, 328);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (273, 881507, 601917, 152);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (274, 903271, 230104, 366);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (275, 300219, 548505, 151);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (276, 160236, 321925, 157);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (277, 489344, 538584, 280);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (278, 903261, 672321, 322);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (279, 817240, 841782, 363);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (280, 230457, 659028, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (281, 743763, 351990, 97);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (282, 470850, 239424, 193);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (283, 54993, 275085, 300);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (284, 812463, 507605, 230);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (285, 263388, 362603, 148);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (286, 404853, 381760, 139);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (287, 922492, 175025, 68);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (288, 954276, 866200, 388);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (289, 4773, 755692, 186);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (290, 756421, 102779, 118);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (291, 335888, 497629, 13);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (292, 702500, 185190, 191);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (293, 931157, 822008, 329);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (294, 361819, 662771, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (295, 2970, 939773, 211);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (296, 600437, 264524, 309);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (297, 963453, 368486, 208);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (298, 653523, 735052, 70);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (299, 997679, 205793, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (300, 941068, 248428, 105);
commit;
prompt 300 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (301, 291592, 950524, 136);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (302, 515263, 759900, 344);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (303, 827794, 193326, 16);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (304, 665557, 724900, 84);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (305, 374341, 302410, 360);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (306, 196629, 366558, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (307, 948914, 487460, 386);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (308, 47881, 562800, 179);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (309, 205713, 567456, 159);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (310, 552886, 858618, 307);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (311, 927852, 277243, 187);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (312, 556222, 844353, 216);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (313, 676124, 754398, 330);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (314, 125593, 683090, 322);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (315, 708555, 733618, 91);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (316, 531732, 775872, 157);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (317, 106375, 771631, 151);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (318, 829686, 828486, 28);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (319, 683709, 212849, 165);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (320, 575321, 384516, 214);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (321, 282643, 515843, 207);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (322, 262608, 422205, 79);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (323, 525115, 974494, 232);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (324, 783065, 733899, 252);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (325, 570538, 216594, 361);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (326, 901160, 822564, 240);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (327, 975991, 427995, 247);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (328, 220873, 716354, 391);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (329, 936418, 363426, 20);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (330, 701652, 725760, 50);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (331, 58302, 446939, 14);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (332, 279052, 504676, 394);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (333, 954031, 667052, 269);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (334, 869011, 133082, 374);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (335, 398272, 115064, 105);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (336, 797355, 371142, 374);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (337, 124653, 431183, 294);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (338, 810451, 648706, 361);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (339, 623161, 493059, 258);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (340, 101180, 906638, 203);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (341, 88816, 236572, 375);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (342, 539346, 603348, 160);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (343, 32474, 720230, 150);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (344, 339525, 997688, 344);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (345, 557765, 563822, 30);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (346, 44921, 824126, 57);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (347, 996707, 990095, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (348, 765319, 944212, 97);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (349, 42762, 406526, 181);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (350, 393385, 195915, 134);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (351, 786747, 263963, 102);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (352, 848762, 325813, 196);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (353, 710385, 951300, 130);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (354, 576134, 884522, 202);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (355, 787074, 211564, 212);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (356, 364304, 249420, 315);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (357, 941901, 726282, 26);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (358, 370658, 116993, 262);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (359, 295865, 992792, 400);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (360, 841880, 936078, 235);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (361, 424886, 344638, 219);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (362, 729759, 539355, 245);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (363, 365151, 819631, 295);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (364, 23017, 229729, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (365, 855193, 994657, 329);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (366, 464714, 297117, 298);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (367, 384120, 662306, 18);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (368, 212467, 635757, 176);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (369, 577390, 852992, 106);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (370, 238020, 708835, 154);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (371, 358726, 388750, 229);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (372, 665959, 322152, 185);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (373, 741803, 122603, 253);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (374, 131318, 328057, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (375, 90703, 751420, 349);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (376, 404710, 441067, 95);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (377, 806290, 421975, 281);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (378, 304151, 213958, 257);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (379, 709123, 660546, 344);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (380, 97329, 153604, 393);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (381, 460856, 677162, 218);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (382, 509160, 455984, 286);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (383, 257606, 107873, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (384, 899719, 465642, 86);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (385, 303259, 893229, 210);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (386, 479349, 622800, 9);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (387, 290343, 429943, 140);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (388, 393609, 407497, 353);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (389, 843705, 206653, 215);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (390, 453054, 830883, 63);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (391, 680004, 124996, 342);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (392, 14358, 815261, 251);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (393, 666773, 145239, 78);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (394, 352222, 353047, 95);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (395, 90709, 862551, 119);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (396, 608632, 596596, 161);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (397, 828699, 847121, 354);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (398, 379644, 812220, 191);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (399, 819149, 749713, 199);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (400, 12579, 288826, 211);
commit;
prompt 400 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (401, 818122, 715409, 355);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (402, 50748, 530794, 239);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (403, 957002, 743297, 11);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (404, 791167, 942120, 317);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (405, 200, 123456, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (406, 0, 654321, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (407, 0, 777771, 2);
commit;
prompt 407 records loaded
prompt Loading ACTIONS...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (2, 'deposit', 100, to_date('12-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (3, 'deposit', 20, to_date('06-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (4, 'deposit', 340, to_date('22-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (5, 'Transferring Funds', 460493, to_date('06-06-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (7, 'deposit', 992488, to_date('08-05-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (8, 'Withdrawing Funds', 292502, to_date('29-06-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (9, 'Transferring Funds', 254961, to_date('14-03-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (10, 'deposit', 565084, to_date('11-08-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (11, 'deposit', 304770, to_date('06-02-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (12, 'Withdrawing Funds', 875012, to_date('04-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (13, 'deposit', 322980, to_date('05-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (14, 'Withdrawing Funds', 84672, to_date('01-04-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (15, 'Withdrawing Funds', 440477, to_date('29-03-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (16, 'deposit', 907857, to_date('29-05-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (18, 'Withdrawing Funds', 965692, to_date('21-09-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (20, 'Transferring Funds', 680685, to_date('11-04-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (21, 'deposit', 776344, to_date('14-07-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (23, 'deposit', 368160, to_date('15-06-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (24, 'Transferring Funds', 247518, to_date('26-08-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (25, 'deposit', 225465, to_date('17-11-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (26, 'Transferring Funds', 754414, to_date('04-08-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (27, 'Transferring Funds', 57083, to_date('22-01-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (28, 'deposit', 452641, to_date('10-08-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (30, 'Withdrawing Funds', 688258, to_date('13-09-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (31, 'Withdrawing Funds', 86601, to_date('24-05-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (32, 'deposit', 188120, to_date('22-06-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (33, 'Transferring Funds', 595649, to_date('02-01-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (35, 'Transferring Funds', 935888, to_date('26-10-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (36, 'Withdrawing Funds', 898044, to_date('26-06-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (37, 'Withdrawing Funds', 742674, to_date('29-12-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (38, 'deposit', 796643, to_date('24-01-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (39, 'Withdrawing Funds', 121221, to_date('09-05-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (40, 'Transferring Funds', 595959, to_date('12-06-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (41, 'deposit', 817519, to_date('08-10-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (42, 'deposit', 36599, to_date('30-06-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (43, 'Withdrawing Funds', 68462, to_date('31-05-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (44, 'deposit', 910002, to_date('05-03-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (45, 'Withdrawing Funds', 174121, to_date('17-12-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (46, 'Withdrawing Funds', 313447, to_date('15-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (47, 'deposit', 96665, to_date('08-11-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (48, 'Transferring Funds', 922616, to_date('12-04-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (49, 'deposit', 966336, to_date('16-01-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (50, 'Transferring Funds', 903288, to_date('09-01-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (51, 'Transferring Funds', 839551, to_date('27-08-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (54, 'Withdrawing Funds', 800791, to_date('29-04-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (55, 'Withdrawing Funds', 683977, to_date('10-02-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (56, 'Transferring Funds', 613143, to_date('25-01-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (57, 'Withdrawing Funds', 738537, to_date('07-12-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (58, 'Transferring Funds', 939848, to_date('22-12-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (59, 'Transferring Funds', 52743, to_date('19-05-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (60, 'Withdrawing Funds', 459234, to_date('06-10-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (61, 'deposit', 274544, to_date('28-10-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (64, 'Transferring Funds', 326704, to_date('01-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (66, 'deposit', 561940, to_date('18-04-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (67, 'Transferring Funds', 720854, to_date('29-12-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (68, 'Transferring Funds', 41951, to_date('17-06-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (69, 'Withdrawing Funds', 135840, to_date('04-03-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (71, 'Transferring Funds', 731983, to_date('29-08-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (72, 'deposit', 969829, to_date('19-06-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (73, 'Transferring Funds', 134342, to_date('09-01-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (74, 'deposit', 802199, to_date('22-04-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (76, 'Withdrawing Funds', 848436, to_date('09-05-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (77, 'Transferring Funds', 579198, to_date('14-12-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (78, 'Transferring Funds', 790597, to_date('24-11-2023', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (79, 'Transferring Funds', 167461, to_date('22-01-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (81, 'Transferring Funds', 360047, to_date('13-03-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (82, 'deposit', 421705, to_date('19-04-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (83, 'deposit', 705232, to_date('03-10-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (84, 'Withdrawing Funds', 730407, to_date('01-04-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (85, 'deposit', 905535, to_date('15-10-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (86, 'Transferring Funds', 764948, to_date('23-10-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (88, 'Withdrawing Funds', 794859, to_date('17-07-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (89, 'Transferring Funds', 401669, to_date('16-09-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (90, 'Transferring Funds', 333592, to_date('06-02-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (91, 'Withdrawing Funds', 89234, to_date('21-11-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (93, 'Withdrawing Funds', 487114, to_date('14-05-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (94, 'Transferring Funds', 474190, to_date('28-10-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (95, 'deposit', 18639, to_date('07-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (96, 'deposit', 700580, to_date('01-05-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (97, 'Transferring Funds', 129769, to_date('04-10-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (98, 'Transferring Funds', 339539, to_date('22-07-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (99, 'deposit', 83203, to_date('31-03-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (100, 'Transferring Funds', 679404, to_date('23-02-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (101, 'Withdrawing Funds', 636595, to_date('09-06-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (102, 'Transferring Funds', 584858, to_date('21-09-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (103, 'deposit', 76497, to_date('31-10-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (107, 'Withdrawing Funds', 800501, to_date('11-07-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (108, 'deposit', 195344, to_date('11-10-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (109, 'Transferring Funds', 38895, to_date('12-07-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (111, 'Withdrawing Funds', 439618, to_date('01-08-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (112, 'deposit', 984639, to_date('02-05-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (113, 'deposit', 20432, to_date('09-12-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (114, 'Transferring Funds', 888184, to_date('07-06-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (115, 'Withdrawing Funds', 622700, to_date('03-02-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (116, 'deposit', 375872, to_date('23-10-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (117, 'Withdrawing Funds', 745041, to_date('02-05-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (118, 'Withdrawing Funds', 963961, to_date('29-09-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (119, 'Transferring Funds', 752240, to_date('09-02-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (120, 'Transferring Funds', 30131, to_date('30-03-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (121, 'Withdrawing Funds', 268154, to_date('02-04-2016', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (122, 'Transferring Funds', 478663, to_date('13-03-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (123, 'Withdrawing Funds', 427897, to_date('02-11-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (124, 'deposit', 892497, to_date('17-06-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (125, 'Withdrawing Funds', 729172, to_date('12-10-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (126, 'Transferring Funds', 967948, to_date('17-07-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (127, 'Transferring Funds', 42968, to_date('16-05-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (128, 'deposit', 691735, to_date('24-05-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (129, 'deposit', 985923, to_date('12-02-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (130, 'Withdrawing Funds', 918786, to_date('03-11-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (131, 'Withdrawing Funds', 881854, to_date('08-03-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (132, 'Transferring Funds', 61635, to_date('21-06-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (133, 'deposit', 7378, to_date('20-10-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (134, 'Withdrawing Funds', 317146, to_date('23-07-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (137, 'deposit', 228286, to_date('24-06-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (138, 'Transferring Funds', 435175, to_date('28-06-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (139, 'deposit', 791601, to_date('27-04-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (141, 'Transferring Funds', 319361, to_date('13-10-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (143, 'Withdrawing Funds', 90545, to_date('01-08-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (144, 'Transferring Funds', 295856, to_date('06-11-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (146, 'deposit', 123269, to_date('01-12-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (147, 'Withdrawing Funds', 521280, to_date('08-08-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (148, 'Withdrawing Funds', 795863, to_date('25-02-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (149, 'Transferring Funds', 372805, to_date('10-09-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (150, 'Withdrawing Funds', 665567, to_date('16-08-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (152, 'Withdrawing Funds', 884386, to_date('28-07-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (153, 'deposit', 406958, to_date('28-11-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (155, 'deposit', 470738, to_date('19-02-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (156, 'Withdrawing Funds', 985443, to_date('22-12-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (157, 'Withdrawing Funds', 649782, to_date('08-12-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (158, 'Transferring Funds', 469236, to_date('11-10-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (159, 'deposit', 806169, to_date('09-06-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (160, 'deposit', 510242, to_date('30-10-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (162, 'Withdrawing Funds', 596760, to_date('15-09-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (163, 'Withdrawing Funds', 616563, to_date('28-07-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (164, 'Transferring Funds', 517756, to_date('04-11-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (165, 'deposit', 776021, to_date('31-10-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (166, 'deposit', 199516, to_date('06-11-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (167, 'deposit', 425984, to_date('17-08-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (168, 'deposit', 388288, to_date('25-01-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (169, 'Withdrawing Funds', 643364, to_date('10-11-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (170, 'deposit', 794911, to_date('13-01-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (171, 'Withdrawing Funds', 115620, to_date('21-01-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (172, 'Transferring Funds', 25082, to_date('29-04-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (173, 'Transferring Funds', 452505, to_date('05-11-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (174, 'deposit', 241034, to_date('13-04-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (175, 'Transferring Funds', 688158, to_date('17-08-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (176, 'Transferring Funds', 349969, to_date('17-06-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (177, 'Transferring Funds', 167098, to_date('20-10-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (178, 'Transferring Funds', 400406, to_date('10-11-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (179, 'Withdrawing Funds', 970889, to_date('23-05-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (180, 'Withdrawing Funds', 108758, to_date('06-09-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (181, 'Withdrawing Funds', 949536, to_date('14-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (182, 'Transferring Funds', 840544, to_date('19-04-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (184, 'Withdrawing Funds', 251451, to_date('01-03-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (185, 'Transferring Funds', 902670, to_date('22-04-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (186, 'deposit', 960870, to_date('02-10-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (187, 'Withdrawing Funds', 760332, to_date('21-05-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (188, 'Withdrawing Funds', 403675, to_date('20-07-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (190, 'deposit', 187102, to_date('26-11-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (191, 'Transferring Funds', 821620, to_date('29-03-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (192, 'Transferring Funds', 194308, to_date('09-01-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (194, 'Withdrawing Funds', 123547, to_date('23-04-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (195, 'Transferring Funds', 427532, to_date('14-05-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (196, 'deposit', 455192, to_date('26-02-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (197, 'deposit', 236234, to_date('20-08-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (198, 'Withdrawing Funds', 804329, to_date('13-11-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (199, 'Transferring Funds', 387307, to_date('24-12-2004', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (200, 'Transferring Funds', 558726, to_date('06-09-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (201, 'deposit', 88572, to_date('18-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (203, 'deposit', 135408, to_date('29-11-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (204, 'deposit', 408552, to_date('15-11-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (205, 'Transferring Funds', 735796, to_date('26-11-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (207, 'Transferring Funds', 191176, to_date('17-09-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (209, 'Transferring Funds', 455392, to_date('24-03-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (211, 'Withdrawing Funds', 182187, to_date('30-09-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (212, 'deposit', 510860, to_date('13-04-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (213, 'deposit', 401728, to_date('28-09-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (214, 'Transferring Funds', 162906, to_date('23-12-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (215, 'Withdrawing Funds', 9048, to_date('19-03-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (217, 'Transferring Funds', 855557, to_date('22-05-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (219, 'Withdrawing Funds', 979924, to_date('03-11-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (220, 'deposit', 425573, to_date('23-08-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (221, 'deposit', 450929, to_date('20-02-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (222, 'deposit', 533756, to_date('01-03-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (223, 'deposit', 993207, to_date('28-09-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (225, 'Transferring Funds', 82529, to_date('05-10-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (226, 'deposit', 702335, to_date('02-06-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (228, 'Withdrawing Funds', 359393, to_date('17-10-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (229, 'Withdrawing Funds', 447120, to_date('12-11-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (230, 'deposit', 407182, to_date('05-04-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (231, 'deposit', 994886, to_date('31-08-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (232, 'deposit', 697653, to_date('13-09-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (233, 'Transferring Funds', 421853, to_date('11-02-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (236, 'deposit', 1774, to_date('10-07-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (237, 'Withdrawing Funds', 732366, to_date('09-03-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (238, 'deposit', 806938, to_date('24-12-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (239, 'Withdrawing Funds', 948726, to_date('04-04-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (240, 'deposit', 324206, to_date('15-09-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (242, 'Transferring Funds', 440880, to_date('29-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (243, 'Withdrawing Funds', 6280, to_date('13-02-1994', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (244, 'Transferring Funds', 276792, to_date('30-04-2004', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (245, 'Withdrawing Funds', 421313, to_date('31-03-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (246, 'Withdrawing Funds', 9661, to_date('27-03-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (247, 'Withdrawing Funds', 320263, to_date('16-09-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (248, 'deposit', 739043, to_date('08-11-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (249, 'Transferring Funds', 381455, to_date('23-05-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (250, 'Withdrawing Funds', 793776, to_date('18-08-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (251, 'Withdrawing Funds', 953374, to_date('10-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (252, 'deposit', 907712, to_date('03-09-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (254, 'deposit', 124624, to_date('26-08-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (256, 'Withdrawing Funds', 452509, to_date('16-11-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (257, 'Withdrawing Funds', 512774, to_date('27-06-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (258, 'deposit', 989562, to_date('29-05-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (259, 'Transferring Funds', 42424, to_date('18-10-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (260, 'Withdrawing Funds', 793930, to_date('15-08-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (261, 'Transferring Funds', 233567, to_date('23-09-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (262, 'Transferring Funds', 986615, to_date('09-01-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (263, 'deposit', 953495, to_date('06-11-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (264, 'Transferring Funds', 769061, to_date('07-02-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (266, 'Transferring Funds', 17516, to_date('12-10-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (267, 'Transferring Funds', 417160, to_date('15-01-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (268, 'Transferring Funds', 200311, to_date('12-12-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (269, 'Withdrawing Funds', 270960, to_date('21-12-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (270, 'Withdrawing Funds', 361005, to_date('19-09-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (271, 'Transferring Funds', 700787, to_date('04-02-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (272, 'Transferring Funds', 133251, to_date('19-07-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (273, 'Transferring Funds', 834124, to_date('13-04-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (274, 'Withdrawing Funds', 16970, to_date('09-08-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (275, 'deposit', 934964, to_date('19-02-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (276, 'Transferring Funds', 759146, to_date('05-09-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (277, 'deposit', 465961, to_date('09-03-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (278, 'deposit', 461005, to_date('01-01-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (279, 'Withdrawing Funds', 168839, to_date('21-08-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (280, 'Transferring Funds', 287625, to_date('26-05-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (281, 'deposit', 611780, to_date('01-11-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (282, 'Withdrawing Funds', 201434, to_date('14-10-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (283, 'deposit', 645161, to_date('14-10-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (284, 'deposit', 284861, to_date('23-01-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (285, 'deposit', 395414, to_date('28-10-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (286, 'Transferring Funds', 778096, to_date('29-04-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (287, 'Withdrawing Funds', 373708, to_date('08-10-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (288, 'deposit', 243724, to_date('21-12-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (289, 'Transferring Funds', 42208, to_date('15-10-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (290, 'Withdrawing Funds', 94769, to_date('08-04-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (292, 'deposit', 400593, to_date('26-12-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (293, 'Transferring Funds', 186000, to_date('21-12-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (294, 'Withdrawing Funds', 224505, to_date('09-07-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (295, 'deposit', 858442, to_date('16-08-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (296, 'deposit', 65098, to_date('02-02-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (297, 'Transferring Funds', 263057, to_date('28-09-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (298, 'Withdrawing Funds', 79983, to_date('16-12-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (299, 'Transferring Funds', 108109, to_date('10-01-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (300, 'Withdrawing Funds', 977917, to_date('22-10-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (301, 'Withdrawing Funds', 445884, to_date('01-08-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (303, 'Transferring Funds', 577797, to_date('29-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (305, 'Transferring Funds', 820319, to_date('30-12-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (306, 'Transferring Funds', 260619, to_date('07-08-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (308, 'Transferring Funds', 388787, to_date('02-09-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (309, 'Withdrawing Funds', 758927, to_date('05-05-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (310, 'Withdrawing Funds', 300324, to_date('26-07-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (311, 'deposit', 845363, to_date('19-04-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (312, 'deposit', 204884, to_date('04-02-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (313, 'deposit', 693668, to_date('19-07-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (314, 'Transferring Funds', 634574, to_date('24-07-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (316, 'Transferring Funds', 569739, to_date('19-03-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (317, 'Transferring Funds', 741278, to_date('02-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (319, 'deposit', 343572, to_date('24-04-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (320, 'Transferring Funds', 334557, to_date('13-09-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (321, 'Transferring Funds', 884223, to_date('02-10-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (322, 'Transferring Funds', 580451, to_date('03-08-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (323, 'Withdrawing Funds', 661055, to_date('16-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (324, 'Transferring Funds', 899148, to_date('20-09-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (325, 'Withdrawing Funds', 660480, to_date('23-11-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (326, 'Withdrawing Funds', 505623, to_date('20-06-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (327, 'deposit', 195715, to_date('04-01-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (328, 'deposit', 205924, to_date('07-02-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (329, 'deposit', 565131, to_date('11-09-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (330, 'Transferring Funds', 656299, to_date('26-06-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (331, 'deposit', 352743, to_date('22-07-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (332, 'deposit', 886545, to_date('29-09-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (334, 'Withdrawing Funds', 361475, to_date('25-08-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (335, 'Withdrawing Funds', 100898, to_date('16-02-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (336, 'deposit', 328376, to_date('02-09-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (337, 'deposit', 794271, to_date('20-03-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (338, 'Transferring Funds', 711035, to_date('17-09-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (339, 'deposit', 276803, to_date('18-06-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (340, 'Withdrawing Funds', 674551, to_date('18-02-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (341, 'Withdrawing Funds', 289152, to_date('10-01-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (342, 'deposit', 14043, to_date('29-07-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (343, 'deposit', 531199, to_date('02-12-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (344, 'deposit', 25145, to_date('01-10-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (346, 'deposit', 308250, to_date('11-12-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (347, 'deposit', 744708, to_date('05-07-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (348, 'Transferring Funds', 353356, to_date('02-07-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (349, 'Transferring Funds', 238131, to_date('30-07-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (350, 'deposit', 562639, to_date('13-05-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (351, 'deposit', 991519, to_date('06-08-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (352, 'Transferring Funds', 903835, to_date('10-02-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (353, 'Withdrawing Funds', 768057, to_date('08-04-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (354, 'Transferring Funds', 462454, to_date('02-08-2006', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (355, 'deposit', 379107, to_date('30-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (357, 'deposit', 778754, to_date('04-05-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (358, 'deposit', 918025, to_date('11-12-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (359, 'deposit', 341833, to_date('09-12-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (361, 'Withdrawing Funds', 343725, to_date('05-05-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (362, 'deposit', 688045, to_date('27-02-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (363, 'deposit', 217147, to_date('02-03-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (364, 'Transferring Funds', 56193, to_date('21-05-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (365, 'deposit', 410400, to_date('26-10-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (366, 'Withdrawing Funds', 757343, to_date('12-09-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (368, 'Withdrawing Funds', 572130, to_date('25-07-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (369, 'deposit', 492930, to_date('23-12-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (372, 'Withdrawing Funds', 203544, to_date('17-05-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (373, 'Withdrawing Funds', 811066, to_date('10-02-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (375, 'Withdrawing Funds', 298193, to_date('25-08-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (376, 'deposit', 610792, to_date('29-05-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (377, 'deposit', 78654, to_date('29-07-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (378, 'Transferring Funds', 390495, to_date('14-01-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (379, 'Transferring Funds', 784564, to_date('18-06-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (381, 'Withdrawing Funds', 394324, to_date('30-12-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (382, 'deposit', 346265, to_date('09-12-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (383, 'Withdrawing Funds', 174710, to_date('07-09-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (384, 'Withdrawing Funds', 958562, to_date('29-12-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (385, 'deposit', 938400, to_date('06-01-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (386, 'Transferring Funds', 209626, to_date('24-01-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (387, 'deposit', 468084, to_date('10-03-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (388, 'deposit', 842130, to_date('21-01-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (390, 'deposit', 252910, to_date('23-05-2004', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (391, 'Transferring Funds', 564044, to_date('08-04-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (392, 'Withdrawing Funds', 143667, to_date('23-02-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (393, 'deposit', 534951, to_date('01-07-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (394, 'Withdrawing Funds', 69880, to_date('18-11-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (395, 'Transferring Funds', 907927, to_date('23-01-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (397, 'deposit', 716812, to_date('28-04-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (398, 'Transferring Funds', 55216, to_date('20-10-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (399, 'Withdrawing Funds', 122870, to_date('16-12-2023', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (400, 'deposit', 865331, to_date('21-12-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (401, 'Transferring Funds', 168848, to_date('09-02-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (403, 'Transferring Funds', 954640, to_date('04-03-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (404, 'deposit', 111111, to_date('16-06-2024 21:47:28', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 340 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (1, 'Dorey Nacey', '83 Clyde Gallagher Crossing', 'Suite 21', null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (2, 'Rhodie Dainty', '747 Warbler Center', 'Suite 52', '6242738669');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (3, 'Jobey Abrahm', '21701 Sheridan Court', 'Suite 6', '4734466220');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (4, 'Ryley Trobridge', '05 Hayes Center', 'Apt 1357', '2785068828');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (5, 'Elbertina Farrah', '26 Monica Lane', 'Suite 27', '6706256225');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (6, 'Vale McNess', '377 Independence Road', 'Apt 1947', '2698846507');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (7, 'Oralla Ethridge', '9 Atwood Street', 'Apt 311', '5101711356');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (8, 'Sarah Caen', '862 Bluestem Lane', 'Room 1429', '2784782898');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (9, 'Jana Beglin', '5260 Badeau Park', '7th Floor', '2674184360');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (10, 'Douglass Thorington', '1022 Village Place', 'PO Box 33399', '3439944110');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (11, 'Ricardo Carhart', '116 Stuart Way', 'PO Box 47836', '4917941819');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (12, 'Charlotte Hazle', '8159 Farmco Crossing', '12th Floor', '4803922669');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (13, 'Kelley Itzcovich', '629 Gateway Lane', 'Room 162', '1482199105');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (14, 'Bronnie Ryce', '2493 Springview Lane', 'Apt 454', '6028558674');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (15, 'Adolf Walbridge', '585 East Point', '1st Floor', '2121598913');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (16, 'Dario Tythe', '08 Londonderry Drive', 'Apt 1069', '4766066493');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (17, 'Jocelyne Wemes', '533 Anniversary Trail', 'Room 1269', '6035333588');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (18, 'Renae Dybbe', '4836 Gina Lane', 'Suite 5', '3632020470');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (19, 'Perceval Yarranton', '285 Prairieview Court', 'PO Box 29149', '3771513579');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (20, 'Riannon Posnett', '312 Elgar Point', 'Suite 14', '2995383967');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (21, 'Virgil MacCurley', '248 Arkansas Plaza', 'Room 14', '7654257109');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (22, 'Madelle Comerford', '84428 Fordem Alley', 'Room 997', '5211416319');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (23, 'Ty Ineson', '0 Warner Terrace', 'PO Box 41711', '7556760927');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (24, 'Rycca Alejo', '1191 Packers Alley', 'PO Box 99923', '9549349862');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (25, 'Petronilla Blethyn', '92773 Dovetail Place', 'Suite 32', '4455948399');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (26, 'Bernita Bearward', '260 Ridgeway Drive', 'Room 175', '2476928607');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (27, 'Fulvia Menaul', '4 Bonner Terrace', 'Room 1403', '5835989412');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (28, 'Devin Dillinger', '14099 Bayside Alley', 'PO Box 87834', '3649416127');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (29, 'Leonid Swarbrigg', '84221 Pond Avenue', 'Suite 55', '6386129082');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (30, 'Orelie Daffern', '8272 Reinke Point', 'Apt 180', '1441360604');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (31, 'Virgie Nelmes', '43584 Morrow Crossing', 'Apt 924', '9333656871');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (32, 'Birdie Tremonte', '78469 Mitchell Center', 'PO Box 78132', '8118996638');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (33, 'Dwain Scogings', '559 Autumn Leaf Park', 'PO Box 28408', '8209817012');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (34, 'Ulick Pace', '05165 Holmberg Trail', '7th Floor', '9948837674');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (35, 'Jennica Cartmell', '53 Rusk Court', 'Room 1981', '7216220492');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (36, 'Estrellita Marian', '43 Bay Way', '1st Floor', '3151448581');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (37, 'Derward Roussell', '71129 School Court', 'PO Box 46480', '3948088679');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (38, 'Rene Dartnall', '7 Jenifer Pass', '10th Floor', '2974202317');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (39, 'Derek Gammidge', '82842 Troy Lane', 'Room 625', '9041356907');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (40, 'Ignace Fendley', '81970 Riverside Court', '19th Floor', '3715538979');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (41, 'Foss Livzey', '49357 Meadow Ridge Circle', 'Apt 1708', '6348301062');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (42, 'Nevsa Rodder', '23 Pawling Place', 'PO Box 98380', '2592132290');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (43, 'Myrvyn Bradder', '96 Rusk Road', 'PO Box 74246', '8805199017');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (44, 'Myrwyn Hewell', '26973 Chive Alley', '19th Floor', '5249426258');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (45, 'Johnette Kuschke', '94071 Michigan Parkway', 'Room 1972', '4361246972');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (46, 'Harley Aldersea', '501 Mifflin Trail', 'Room 497', '5893481381');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (47, 'Hank Blackeby', '2 Everett Pass', 'PO Box 88411', '5483682385');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (48, 'Rivalee Kuhnel', '94408 Meadow Valley Hill', 'PO Box 58065', '1137495842');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (49, 'Humfrey Hedylstone', '10 Mifflin Road', '12th Floor', '4546136960');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (50, 'Olenolin MacPharlain', '5852 Basil Alley', 'Suite 27', '1292896934');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (51, 'Harriet Saynor', '109 Carey Trail', 'Apt 292', '4431134949');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (52, 'Nikkie Bosch', '57462 Lyons Center', 'Room 922', '1083923431');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (53, 'Mirilla Shanks', '35015 Hudson Plaza', 'PO Box 83196', '7182332937');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (54, 'Fidelity Bake', '90999 Golf Point', 'Suite 12', '2028252513');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (55, 'Shadow Ruperti', '30 Lakewood Gardens Alley', 'PO Box 77150', '7672432622');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (56, 'Bart Whatmough', '4 Ryan Lane', 'Room 1664', '5393822890');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (57, 'Bobina Hindsberg', '11678 Alpine Way', 'PO Box 45421', '5682669046');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (58, 'Anabelle Patek', '61850 Grayhawk Crossing', '14th Floor', '1245112554');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (59, 'Ninnetta Batchelar', '420 Sullivan Parkway', 'PO Box 32931', '1477505730');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (60, 'Barri Corcoran', '6 Annamark Hill', 'PO Box 40512', '3568742498');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (61, 'Clair Coskerry', '94 Roxbury Plaza', '13th Floor', '4774878873');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (62, 'Koenraad O''Brollachain', '3481 Little Fleur Drive', 'Apt 1947', '4836859366');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (63, 'Leslie Learmount', '07 Algoma Hill', '12th Floor', '7768363568');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (64, 'Elonore Sekulla', '5381 Summer Ridge Street', '1st Floor', '5866455845');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (65, 'Nate Seviour', '706 Bartillon Park', 'Room 614', '7224808107');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (66, 'Tandy MacIllrick', '90 Pearson Junction', 'Suite 32', '1537887654');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (67, 'Alyosha Neeve', '61 Grover Pass', 'Room 1406', '2768938399');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (68, 'Essie Haseman', '20283 Waywood Pass', '2nd Floor', '2212368496');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (69, 'Melinde Bouts', '936 Dunning Plaza', '19th Floor', '9149337179');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (70, 'Amory Shellibeer', '46 Hanover Plaza', 'Apt 1018', '6954427151');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (71, 'Brenn Beddall', '628 Cordelia Park', 'PO Box 89592', '5124245708');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (72, 'Albrecht Calwell', '9885 Acker Trail', 'PO Box 89604', '5315058571');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (73, 'Sterne Lourenco', '78 Troy Terrace', 'Room 1557', '3899381203');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (74, 'Claire Auton', '29 Bartillon Lane', 'Suite 41', '5491416692');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (75, 'Reeta Shapter', '22 Cardinal Junction', 'Apt 235', '9274965166');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (76, 'Dane Stichel', '74877 Lukken Junction', 'Suite 77', '8848263416');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (77, 'Donavon Jerson', '6 Southridge Center', '10th Floor', '3041011952');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (79, 'Glyn Hazelton', '72745 Chinook Drive', 'Suite 30', '9786988289');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (80, 'Francisco Casarili', '10180 Vermont Circle', 'Suite 22', '2829036538');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (81, 'Bearnard Schohier', '36 Dottie Plaza', 'PO Box 13279', '5704875587');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (82, 'Gracia Sidey', '7312 Coolidge Circle', 'Apt 380', '9416142382');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (84, 'Kingston Brockley', '4456 Fuller Point', 'Apt 658', '7744186651');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (85, 'Ivan Britee', '640 Burning Wood Alley', 'Room 895', '2166844594');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (86, 'Willem Grichukhanov', '25 Rockefeller Terrace', '10th Floor', '5914474416');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (87, 'Eward Cossell', '7 Heffernan Alley', 'PO Box 84922', '4809086051');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (88, 'Brenn L''Amie', '436 Lerdahl Terrace', '20th Floor', '8841205162');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (90, 'Alexa Sparshatt', '584 Graceland Parkway', 'PO Box 81550', '9562025669');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (91, 'Malia Hatton', '72612 Carpenter Drive', 'Apt 1621', '5625503345');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (92, 'Sibeal Fernely', '46 Sunfield Terrace', 'Apt 901', '3973237837');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (93, 'Bobbye Scadding', '072 Warbler Terrace', 'Room 863', '6262964299');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (94, 'Reggie Noraway', '2 Reindahl Way', 'PO Box 82390', '9149839628');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (96, 'Farleigh Danilovich', '0868 Sage Circle', 'Suite 89', '1585053646');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (97, 'Adora Corrigan', '99 Maywood Avenue', 'Apt 329', '6149274734');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (98, 'Alessandro Allin', '210 Bobwhite Pass', 'Suite 64', '5907795803');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (100, 'Andy Permain', '055 Logan Center', 'Apt 1946', '4981811325');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (101, 'Ariela Emmert', '59384 Service Center', '12th Floor', '2893750708');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (102, 'Carlo Fee', '66 Browning Circle', 'PO Box 72307', '1568769063');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (103, 'Erek Ellerman', '81 Eggendart Hill', 'Room 1232', '2703657089');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (104, 'Hewet Condy', '59 Mitchell Court', 'Room 1081', '7736309631');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (106, 'Emilio Crickmore', '4034 Scott Center', 'Room 84', '7766416946');
commit;
prompt 100 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (107, 'Upton Chiese', '3977 North Parkway', 'Suite 49', '6579884902');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (108, 'Walliw Longhorn', '4 Warrior Pass', 'Suite 64', '5942261849');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (109, 'Arin Smart', '1 Kim Way', 'Apt 1924', '8726213008');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (110, 'Irwin Millimoe', '3455 Mccormick Park', 'Suite 60', '8801766246');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (112, 'Guthrey Frawley', '77242 Maple Park', '17th Floor', '4909039328');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (113, 'Jennie Dmitriev', '650 Bunker Hill Center', 'Room 491', '1318055354');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (114, 'Malissa Daysh', '70264 Harper Terrace', 'Room 1658', '2559034995');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (115, 'Dulcea Whitbread', '45 Transport Park', 'Room 433', '9149695893');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (116, 'Zachary Barbosa', '293 Hanson Street', '1st Floor', '5243765544');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (118, 'Tarah Warbeys', '50103 Oakridge Lane', '5th Floor', '3167436173');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (119, 'Mauricio Geekie', '6 Garrison Avenue', '16th Floor', '5163200774');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (120, 'Lanny Stepney', '630 Ridgeway Plaza', '10th Floor', '8177492948');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (122, 'Kiley Hedger', '27246 Westerfield Pass', 'Room 220', '1211356571');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (123, 'Marnia Stodd', '96 Superior Lane', 'Suite 25', '3921158502');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (124, 'Rochelle Cowndley', '6310 Lakeland Court', 'PO Box 44301', '1557734644');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (125, 'Padraig Clavey', '722 Messerschmidt Hill', 'PO Box 10129', '1055823761');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (126, 'Ralina Sherwill', '3 Clyde Gallagher Pass', 'PO Box 3340', '1643744776');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (127, 'Adolphe Astall', '80961 Hoepker Court', 'Suite 11', '6589306782');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (128, 'Phillis Bilham', '5135 Dakota Pass', 'Suite 91', '1859215084');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (129, 'Merrick Verralls', '96 Linden Terrace', '13th Floor', '7524900440');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (130, 'Nichole Ballston', '69 Golf Plaza', 'Apt 1803', '1694878878');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (131, 'Tabina Limon', '1052 Raven Avenue', 'PO Box 69571', '6372942019');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (132, 'Russ Cordner', '863 Dapin Plaza', 'Room 446', '5155977502');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (133, 'Avivah Pires', '28 Commercial Street', 'Suite 100', '7778381944');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (134, 'Niven Dumblton', '11884 Brentwood Alley', 'Apt 572', '3292830462');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (135, 'Melicent Augur', '337 Roxbury Court', 'Suite 6', '8587451262');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (136, 'Harli Ramelot', '871 Mallard Road', 'Apt 1473', '2595931067');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (137, 'Aurelie California', '0832 Schurz Hill', 'Suite 22', '6436413430');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (138, 'Burlie Scambler', '31 Bay Avenue', '10th Floor', '9045174486');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (139, 'Onfre Emeny', '56 Hayes Road', 'Room 829', '7875813154');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (140, 'Kimmy Mattityahou', '568 Manufacturers Avenue', 'Apt 425', '9756496332');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (141, 'Skelly Broschek', '612 Sloan Avenue', 'PO Box 57047', '3138244527');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (142, 'Kennie Doers', '7 Graedel Point', 'Apt 476', '2884095382');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (143, 'Jade Cawsey', '90 Huxley Junction', '20th Floor', '8559500839');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (144, 'Marji Hachard', '37 Mandrake Junction', '11th Floor', '7499860928');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (145, 'Ingemar Pee', '6643 Kensington Circle', 'Apt 206', '1182193748');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (146, 'Kerianne Brekonridge', '8 Prairieview Crossing', 'Room 669', '7673188468');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (147, 'Falito Reyna', '842 Northview Avenue', 'PO Box 24287', '4767760450');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (148, 'Barry Galland', '4 Logan Park', 'Room 1426', '4669831129');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (149, 'Carlen McNiff', '5955 Washington Parkway', '18th Floor', '1022867269');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (150, 'Meridith Rushford', '7 Westridge Park', '10th Floor', '3323368399');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (151, 'Jacqui Affuso', '1839 Oak Parkway', 'PO Box 59623', '8795506790');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (152, 'Arni Chesswas', '24923 Londonderry Avenue', 'Apt 5', '3869027239');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (153, 'Annabelle Julian', '3 Independence Alley', 'Room 210', '7185399496');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (154, 'Kassie MacIlriach', '3 Talmadge Trail', '8th Floor', '2473387545');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (155, 'Brit Elsop', '08919 Valley Edge Avenue', 'Apt 1478', '5809031975');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (156, 'Leila Mazey', '158 Straubel Crossing', 'PO Box 37004', '1937754509');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (157, 'Cordie Eldon', '2 Texas Terrace', 'Room 831', '7636543924');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (158, 'Beitris Silverthorn', '33 Northwestern Avenue', 'Apt 343', '3847265721');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (159, 'Heidi Dionsetto', '9363 Pepper Wood Street', 'Room 19', '3198603467');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (160, 'Elayne De Giorgio', '8970 Graceland Park', '11th Floor', '8082617768');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (161, 'Lesley Ciobotaru', '3352 Reinke Pass', 'Suite 73', '7504525727');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (162, 'Brana Bilsland', '69716 Tennessee Avenue', '7th Floor', '5128016150');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (163, 'Anett Simao', '4322 Memorial Point', 'Apt 917', '3497700542');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (164, 'Blanca Roskruge', '7768 Sunbrook Junction', '20th Floor', '8957244932');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (165, 'Faye Schiell', '4712 Pine View Circle', '9th Floor', '9836111271');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (166, 'Bobby Laroze', '42 Hauk Alley', 'PO Box 13152', '7802937616');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (167, 'Yetty Nutting', '685 Scott Plaza', 'PO Box 97625', '8576750631');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (168, 'Kermie Larose', '6 Tennessee Terrace', 'PO Box 40681', '9896643450');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (169, 'Sofia Sharer', '6 Hagan Point', '19th Floor', '9461101450');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (170, 'Alikee Milan', '58753 Calypso Crossing', 'Suite 58', '8339262899');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (171, 'Glenda Ettritch', '020 Monument Alley', 'Room 1004', '7104149140');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (172, 'Dan Nizard', '8 Vahlen Road', '3rd Floor', '2569271624');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (173, 'Noelani Paradis', '0 Cascade Court', 'Apt 335', '4389805405');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (174, 'Jeremie Bulfit', '648 Maryland Place', 'Suite 51', '4272547303');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (175, 'Bendicty Tybalt', '63 Browning Point', '15th Floor', '3792590633');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (176, 'Doralyn Foxton', '2 Kinsman Way', 'Apt 1767', '7877692459');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (177, 'Gelya Follows', '1 Continental Parkway', 'PO Box 32098', '2029784989');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (178, 'Meris Chidwick', '78360 Knutson Crossing', 'Suite 16', '8305256205');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (179, 'Stacey McLelland', '4 Vera Park', '5th Floor', '6848656964');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (180, 'Ricoriki Elsby', '23 Bowman Point', 'Apt 51', '9614161294');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (181, 'Katrinka Bolver', '8 Grim Plaza', 'PO Box 95485', '9859441622');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (182, 'Pancho Worsam', '09 Gateway Plaza', 'Apt 872', '2712855765');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (183, 'Melinda Thurley', '50 New Castle Hill', 'PO Box 89127', '5915452536');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (184, 'Adina Lissemore', '29 Sugar Terrace', 'PO Box 89811', '2949325358');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (185, 'Beilul Napton', '765 Cordelia Place', 'Apt 1823', '5059865443');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (186, 'Evelyn Deane', '98 Rowland Parkway', 'PO Box 21382', '5996472725');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (187, 'Catharine Rapkins', '7 Mayfield Plaza', 'PO Box 96814', '7659248554');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (188, 'Korney Hindhaugh', '076 7th Lane', 'Room 947', '8019868854');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (189, 'Gaby Purser', '87 Saint Paul Point', '16th Floor', '6722106380');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (190, 'Reggi Wickes', '3064 West Park', 'Suite 8', '2465880579');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (191, 'Avis Woolaghan', '85731 Vahlen Plaza', 'PO Box 60662', '6914564018');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (192, 'Kimberlee Kroll', '2864 Bartelt Crossing', '8th Floor', '1085213112');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (193, 'Netta Sawdon', '9262 Ludington Hill', '5th Floor', '9116716679');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (194, 'Demetrius Quaintance', '712 Eastlawn Alley', 'Room 781', '2201285937');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (195, 'Ann-marie Berard', '229 Fordem Crossing', '20th Floor', '3887025049');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (196, 'Milty Heugle', '6673 Johnson Circle', 'Apt 1116', '2126997985');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (197, 'Rhiamon Lettuce', '01289 Schurz Street', 'Room 1406', '5076559684');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (198, 'Maybelle Malinson', '31 Merry Pass', 'Suite 69', '1591042396');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (199, 'Ad Chastanet', '9 Iowa Parkway', '7th Floor', '3156242643');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (201, 'Catlin Proschke', '84 Quincy Park', 'Room 880', '7415430247');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (202, 'Kassie Gambles', '16 Raven Hill', '13th Floor', '8646164709');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (203, 'Letta Slocomb', '622 Memorial Trail', 'Room 103', '5586588632');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (204, 'Marc Errett', '2 Harbort Park', 'Room 1073', '5796001244');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (205, 'Marianne Robe', '703 Redwing Point', '6th Floor', '4359042211');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (207, 'Brynna Skellion', '922 Caliangt Park', '9th Floor', '1103943493');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (208, 'Tedie Cordova', '734 Grasskamp Avenue', 'Suite 50', '1739281283');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (209, 'May Hartop', '6768 Maywood Terrace', 'PO Box 22594', '8738012400');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (211, 'Lonnie Mont', '2 Old Gate Crossing', 'PO Box 79350', '5887503743');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (212, 'Land Ughini', '0 Golf Course Court', '10th Floor', '5814511911');
commit;
prompt 200 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (213, 'Brody Alesi', '5528 Southridge Road', '18th Floor', '3556778245');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (214, 'Cynthie Horwell', '1 Cascade Point', 'PO Box 89397', '5519677699');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (215, 'Genevieve Paley', '8085 Forest Dale Junction', 'Suite 87', '5306050626');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (217, 'Letty Dupree', '0 Kenwood Plaza', '12th Floor', '1906668785');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (218, 'Geoffrey Hurst', '187 Sherman Street', 'Apt 663', '9169804050');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (219, 'Nichole Leban', '5 Merchant Drive', 'PO Box 23114', '4769523267');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (220, 'Carmelita Goss', '7217 Larry Way', '1st Floor', '2857097738');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (222, 'Hashim Milsted', '05 3rd Alley', 'Room 407', '2606073372');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (223, 'Adolphe Youdell', '78579 Division Lane', 'Apt 1467', '9491263556');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (224, 'Millard Shoulders', '630 Del Mar Park', 'Apt 1068', '5575386217');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (225, 'Theodora Drews', '9 Donald Way', 'Apt 979', '5432463419');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (226, 'Elsi Nise', '6 Nelson Court', 'PO Box 85309', '3471175478');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (228, 'Clarita Errett', '0 Bashford Pass', 'Room 1952', '2653623627');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (229, 'Grover Tibb', '28935 Manufacturers Alley', '14th Floor', '4412332433');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (230, 'Linn Antonomoli', '7 Merrick Alley', 'PO Box 96949', '3847387071');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (231, 'Aldo Brookbank', '74159 Blue Bill Park Plaza', 'Room 1195', '2605228688');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (233, 'Vinnie Whyman', '72 Dahle Crossing', 'Apt 1977', '3533850382');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (234, 'Catharina Pitts', '57802 Homewood Trail', 'PO Box 54122', '1162691537');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (235, 'Auguste Loveitt', '85810 Hollow Ridge Plaza', 'Apt 25', '7996850493');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (236, 'Cal Biaggiotti', '76 Nancy Point', '13th Floor', '1757129612');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (237, 'Giff Coltart', '29306 Stephen Junction', 'PO Box 85801', '4314596932');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (239, 'Creight Molder', '4 Ludington Avenue', '11th Floor', '6368698376');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (240, 'Ruggiero Stanfield', '551 Cardinal Street', 'Apt 1639', '8766593388');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (241, 'Mike Birdsey', '87686 Buhler Way', '6th Floor', '2776844300');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (242, 'Faythe Gilbey', '8772 Merchant Drive', 'Suite 30', '9735451460');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (244, 'Robby Turmel', '3 Mosinee Terrace', 'Suite 19', '5924600643');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (245, 'Veronica Bachanski', '407 Monument Circle', 'PO Box 30577', '1316020372');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (246, 'Madelene Hernik', '8 Mockingbird Terrace', 'Suite 32', '8943346184');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (247, 'Tybie Ianni', '3975 Glendale Center', 'PO Box 5358', '1992973869');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (248, 'Gloriane Boscher', '41 Donald Parkway', 'Apt 719', '7969531308');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (249, 'Esta Bole', '98258 Harper Road', 'Apt 120', '1335368337');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (250, 'Jessie Kornyakov', '04554 Memorial Pass', 'Apt 925', '8686938852');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (251, 'Noelani Gooly', '8145 Summerview Pass', 'Room 1537', '9514848659');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (252, 'Lisabeth Arundale', '35791 Bartillon Lane', 'PO Box 14123', '5785456338');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (253, 'Ly Sanbrook', '53585 Sunnyside Trail', 'Suite 50', '7104460045');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (254, 'Lita Poacher', '95426 Vermont Court', 'PO Box 49507', '4006867480');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (255, 'Bearnard Davet', '81791 Victoria Trail', 'Apt 1661', '1407151347');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (256, 'Elbertine Guare', '93 Esker Pass', 'Apt 1399', '1476647148');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (257, 'Ollie Capey', '2996 Bultman Way', 'Suite 83', '1099711905');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (258, 'Pierson Esseby', '7315 Monterey Lane', 'Apt 613', '2277305114');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (259, 'Haslett Shalloo', '26 3rd Hill', 'PO Box 93394', '5938408720');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (260, 'Chadd Ambroziak', '55 Colorado Court', '7th Floor', '3685170010');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (261, 'Isahella Waldrum', '020 Annamark Way', 'Apt 100', '9062973476');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (262, 'Findley Common', '598 Stuart Street', 'PO Box 84272', '3466252309');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (263, 'Rooney Picard', '20294 Glacier Hill Junction', 'PO Box 96518', '5857352141');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (264, 'Ashleigh Kiggel', '8 Orin Place', 'Room 684', '9405424366');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (265, 'Damiano Lightman', '282 Fremont Road', '7th Floor', '2675541693');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (266, 'Lucias Rennenbach', '876 Northridge Crossing', '12th Floor', '8171346271');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (267, 'Tiebold Sudddard', '4013 Donald Place', 'Apt 174', '5313778264');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (268, 'Corty Crimp', '21 Esker Hill', 'PO Box 83292', '4532959101');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (269, 'Eadith Normanvill', '5 Prentice Center', '6th Floor', '5159083560');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (270, 'Ella Fazzioli', '179 Thierer Center', 'Room 531', '1059989560');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (271, 'Gawain Nappin', '0 Prairie Rose Junction', '14th Floor', '7525839182');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (272, 'Derry Sugg', '03 Loomis Plaza', '5th Floor', '7321432873');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (273, 'Shanda Beadnall', '12945 Loeprich Circle', 'PO Box 46091', '1476992647');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (274, 'Trev Russ', '51 Fremont Hill', '14th Floor', '5558890827');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (275, 'Almeria Fleckney', '18046 Dryden Drive', 'Suite 71', '6109263310');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (276, 'Amory Shepperd', '45628 Blackbird Park', 'Room 590', '7523018588');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (277, 'Calli Urey', '50 Hagan Avenue', 'Room 714', '3238969778');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (278, 'Christabel Somner', '8 Mcguire Point', 'Room 1199', '7322683171');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (279, 'Alana Kellington', '29 7th Junction', 'Apt 1548', '9012614231');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (280, 'Cassaundra Janodet', '922 Lunder Circle', 'Apt 818', '1743551465');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (281, 'Carma Fontel', '15966 Coleman Parkway', 'Apt 140', '8633146247');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (282, 'Wenona Folkerd', '22643 Straubel Pass', '20th Floor', '6759967446');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (283, 'Jerrome Alden', '974 Tennyson Crossing', 'Suite 23', '9976217315');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (284, 'Augustine Archbutt', '2 Scofield Alley', '1st Floor', '7402219398');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (285, 'Faydra Shetliff', '90 Cardinal Alley', 'PO Box 37229', '7987077287');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (286, 'Yanaton Mangin', '44 Dunning Hill', 'Suite 48', '9686600378');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (287, 'Huey Valsler', '915 Del Sol Point', 'PO Box 33829', '3561899786');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (288, 'Sherwood Arsnell', '29189 Butternut Hill', 'Apt 1214', '9762935628');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (289, 'Darn Kid', '5 Stang Drive', 'Apt 1316', '1781842468');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (290, 'Lilllie Kinglesyd', '8 Butterfield Avenue', 'Room 28', '7622456408');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (291, 'Dorthea Ciepluch', '427 Katie Avenue', '17th Floor', '9359952668');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (292, 'Holly Baitman', '9867 Manufacturers Court', '4th Floor', '4921006182');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (293, 'Hazlett Witherdon', '8 Stephen Street', 'Room 945', '1069238064');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (294, 'Carver Jellman', '78 Lyons Road', 'Suite 2', '4818270679');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (295, 'Noah Sowerby', '4 Dennis Plaza', 'Apt 1477', '5968080332');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (296, 'Adore Machans', '324 Green Point', 'Room 1919', '6997568304');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (297, 'Paige McCrostie', '24509 Corscot Point', 'Room 307', '8957827005');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (298, 'Tanner Franzettoini', '5 Dottie Avenue', 'Suite 63', '4143184542');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (299, 'Ferne Sommer', '094 Laurel Hill', 'Room 103', '3956864253');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (300, 'Stacia Stutte', '67 Independence Plaza', '10th Floor', '9678024411');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (301, 'Stefano Hamly', '668 Park Meadow Junction', 'Apt 542', '7112986632');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (302, 'Othelia Josephov', '84 Morning Hill', '5th Floor', '3051441526');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (303, 'Norrie Diano', '6218 Leroy Alley', 'Room 1815', '7828291008');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (304, 'Pavia Uden', '49240 Oriole Drive', 'PO Box 3397', '7291246274');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (305, 'Ingemar Tattam', '27769 Towne Terrace', 'Apt 693', '3533145835');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (306, 'Mercy Pullman', '9 Eagle Crest Hill', 'Suite 55', '2341582621');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (307, 'Chastity Fairlem', '29576 Fair Oaks Park', '3rd Floor', '7763240763');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (308, 'Jodi Riseborough', '67 Luster Pass', 'Room 1915', '6437404812');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (309, 'Georgeanna Praill', '886 Colorado Park', 'PO Box 876', '4844121287');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (310, 'Silvanus Lossman', '7524 Mosinee Way', 'Suite 83', '2474329963');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (311, 'Barn Collinwood', '4561 Northridge Terrace', 'Room 1032', '5387290521');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (312, 'Mohandas Seymark', '57 Autumn Leaf Parkway', '1st Floor', '8252326791');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (313, 'Millie McArthur', '94 Granby Place', 'Suite 61', '2493743344');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (314, 'Puff Richin', '7564 Coolidge Avenue', 'Room 52', '9116800043');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (315, 'Marla Mungane', '746 Karstens Court', 'PO Box 30675', '5857873160');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (316, 'Ninetta Maken', '4994 Talisman Court', 'Suite 22', '2853539197');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (317, 'Annelise Lock', '29 1st Road', '2nd Floor', '5755826044');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (318, 'Alano Detoile', '25 Golden Leaf Crossing', 'PO Box 49862', '4945284331');
commit;
prompt 300 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (319, 'Bili Carwithim', '0 Tony Crossing', 'PO Box 49306', '5506992076');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (321, 'Melodee Caillou', '927 Di Loreto Avenue', 'Room 922', '9975561009');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (322, 'Tod Aggiss', '3 Stuart Road', 'PO Box 81028', '8591648339');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (323, 'Sherye Cure', '7 Johnson Point', 'Room 112', '8275060340');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (324, 'Mayne Stemp', '141 Sunnyside Place', 'Suite 26', '2504722745');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (326, 'Valma Chasemoore', '180 Sugar Avenue', 'PO Box 46304', '7969934947');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (327, 'Zane MacEntee', '9841 Springs Drive', 'Suite 56', '1766794543');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (328, 'Claudio Hallihane', '96812 Burning Wood Pass', 'Suite 67', '1751804648');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (329, 'Martita Jancy', '7 Forest Run Parkway', 'Suite 97', '4274329311');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (330, 'Jeanie Inmett', '90 Fairview Center', 'PO Box 47195', '8606642550');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (332, 'Justina Yeomans', '9 Hintze Alley', 'Room 15', '2704471932');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (333, 'Mackenzie Espinal', '01 Lukken Parkway', 'PO Box 89349', '9824189216');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (334, 'Winn Furmenger', '15 Stone Corner Pass', 'PO Box 30879', '2239525623');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (335, 'Marie Sinney', '96362 Twin Pines Court', 'Suite 4', '5918266202');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (337, 'Kaitlynn Coltart', '130 Eastwood Junction', 'Apt 945', '7161223223');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (338, 'Alice Fearnall', '0 Acker Way', 'Suite 66', '8135835106');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (339, 'Jordan Toffano', '618 Victoria Alley', 'Suite 71', '3223268136');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (340, 'Abbie Elvin', '0919 Messerschmidt Circle', 'Suite 11', '3184793890');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (341, 'Joby McLuckie', '44 Oxford Drive', 'Room 1983', '5389483195');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (343, 'Granger Thibodeaux', '6204 Kropf Court', 'Suite 43', '8961999232');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (344, 'Ivie Heliet', '4 Nelson Place', '12th Floor', '9406672485');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (345, 'Leshia Geroldini', '1 Nancy Point', 'Apt 1272', '8194109633');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (346, 'Bayard Kleinstern', '08 Bluejay Park', 'Apt 1451', '2866249517');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (347, 'Gerty Earey', '544 Maryland Junction', 'Room 908', '7574198355');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (349, 'Kalie Ledgerton', '214 High Crossing Center', 'Apt 826', '3091198250');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (350, 'Mario Dillet', '703 Hagan Parkway', 'Apt 223', '4837784209');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (351, 'Binny Surcomb', '25383 Valley Edge Lane', 'Apt 1317', '9611970885');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (352, 'Hanny Stoeckle', '50 Monica Terrace', '7th Floor', '7317467056');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (354, 'Jameson Andell', '4721 Buhler Court', 'PO Box 66515', '8528990101');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (355, 'Charmion Eliaz', '0330 Lighthouse Bay Center', 'Apt 1302', '8414123485');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (356, 'Kiley Masey', '97 Northridge Hill', 'Apt 777', '6479879055');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (357, 'Luella Chander', '7949 Clarendon Drive', 'Room 1147', '3699627014');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (359, 'Brannon Hacksby', '72952 Kipling Lane', 'Room 1805', '6946322868');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (360, 'Hurleigh Andrieu', '9 Mandrake Circle', 'Room 1944', '2699343939');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (361, 'Ruthanne Semor', '7461 Darwin Pass', '8th Floor', '4101155666');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (362, 'Paxton Beckenham', '28696 Westerfield Terrace', 'PO Box 58068', '1076110233');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (364, 'Drucy Isley', '419 Chive Circle', '17th Floor', '8654781907');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (365, 'Peadar Duggan', '44 Independence Alley', 'Suite 17', '1803020036');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (366, 'Camala Ballach', '4 Springview Alley', 'PO Box 48553', '9457494157');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (367, 'Raynard Pryce', '05 West Terrace', 'Room 1100', '4817143354');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (368, 'Fonz Scarth', '36 Forest Dale Drive', 'Suite 43', '7074656828');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (369, 'Atlante Stenson', '821 Melby Alley', '1st Floor', '8996625440');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (370, 'Lela Roostan', '86028 Hoffman Hill', 'Apt 683', '4359827510');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (371, 'Trixi Rispin', '85 Luster Street', 'Suite 35', '6162291327');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (372, 'Lezlie Eliasson', '32078 Upham Circle', 'PO Box 74468', '6363908920');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (373, 'Almire Stockton', '7122 Forest Run Avenue', 'Suite 96', '7264090173');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (374, 'Reynard Borne', '5 Maple Wood Road', 'Suite 41', '7447771140');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (375, 'Dante Quant', '7200 Bobwhite Crossing', 'PO Box 66672', '6579819444');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (376, 'Cheston MacVay', '67438 Mayer Road', 'Apt 1013', '8402100412');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (377, 'Roselle Courtonne', '9 Hollow Ridge Place', 'Apt 1545', '5425141562');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (378, 'Antonia Davys', '26344 Scott Terrace', 'PO Box 39897', '3304497507');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (379, 'Lek Dugmore', '1 Sutherland Park', 'Suite 3', '7611955898');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (380, 'Kaleb Verheyden', '0 Old Shore Parkway', '10th Floor', '7578514519');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (381, 'Basil Biggs', '4161 Prairieview Avenue', 'Apt 220', '7961057505');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (382, 'Cherie Seggie', '578 Fair Oaks Parkway', 'Room 191', '7704072167');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (383, 'Gerhardine Gunny', '2 Darwin Center', 'PO Box 230', '4855210916');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (384, 'Marcellina Freckleton', '01378 Troy Lane', '8th Floor', '8053721435');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (385, 'Annette Harle', '6 Roxbury Plaza', 'Apt 85', '2012540365');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (386, 'Jenda Hawse', '46 Mifflin Pass', 'Room 717', '4689614225');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (387, 'Shantee Merck', '4 Steensland Court', 'PO Box 85645', '8523787047');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (388, 'Fritz Longson', '58397 Londonderry Road', 'Room 1701', '8489397274');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (389, 'Bette-ann Fost', '83611 Carioca Road', 'PO Box 69861', '6794988608');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (390, 'Leonora Le Friec', '1 Burning Wood Pass', 'Room 143', '1738255373');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (391, 'Reagan MacKenzie', '8745 Pine View Street', 'Apt 1581', '7643271547');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (392, 'Juana Statersfield', '700 Bobwhite Crossing', 'Suite 28', '4056199870');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (393, 'Bernardo Tuhy', '75 Eastlawn Crossing', 'PO Box 38373', '3746548043');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (394, 'Delmer Laidlaw', '13211 Fulton Road', 'PO Box 64669', '7691801070');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (395, 'Margalo Thormann', '9626 Clemons Parkway', 'PO Box 97834', '5848411781');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (396, 'Marylin Molloy', '5 Waywood Lane', 'Room 694', '5083890995');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (397, 'Wendy Brayshay', '28648 Memorial Parkway', 'Apt 1205', '2893781236');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (398, 'Conway Maestrini', '307 Manley Hill', 'Room 1738', '5876732051');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (399, 'Nani Fradson', '817 Glacier Hill Lane', 'Room 1431', '7806216569');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (400, 'Carola Maude', '64 Armistice Crossing', 'PO Box 59563', '2465405907');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (78, 'Hymie Ings', '503 Sommers Hill', 'Suite 96', '8809415889');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (83, 'Elga Huntingdon', '62159 Holmberg Hill', 'PO Box 62779', '7714367371');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (89, 'Pepito Goodboddy', '49 Marquette Plaza', '12th Floor', '2914770303');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (95, 'Violet Dubs', '51 Fulton Way', 'Room 733', '1049837342');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (99, 'Wilie Eakly', '42535 Kensington Plaza', 'PO Box 14455', '4222841926');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (105, 'Ingeberg Brade', '24106 Delaware Point', 'PO Box 55369', '5087978819');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (111, 'Borden Kleinberer', '9057 Schurz Parkway', 'Apt 1106', '3507196601');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (117, 'Si Fredi', '101 Mifflin Court', 'Suite 17', '4655432965');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (121, 'Griz Fleeman', '9 Mitchell Pass', '16th Floor', '3135716109');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (200, 'Winona Trappe', '69 Prentice Street', 'PO Box 38389', '8327470823');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (206, 'Rae Kirley', '4 Elgar Street', 'Suite 49', '5848450129');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (210, 'Jayme Bushe', '56904 Acker Crossing', '14th Floor', '6675279606');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (216, 'Kristen Ayres', '14072 Northview Trail', 'Suite 32', '9891032824');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (221, 'Gayelord Livingstone', '3 North Place', 'Room 1931', '9443711788');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (227, 'Jaquith Ruilton', '48 Express Lane', '18th Floor', '6638634058');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (232, 'Craggie Gall', '3057 American Parkway', 'PO Box 29065', '4275127483');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (238, 'Ivette Leather', '401 Hoard Street', 'Suite 75', '5311992923');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (243, 'Sergio Hannigan', '74 David Terrace', '1st Floor', '6064512812');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (320, 'Osmond Stamper', '28 Gerald Trail', 'Room 1087', '4102626672');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (325, 'Demetre Van der Spohr', '0 Reinke Point', 'Suite 94', '3163954115');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (331, 'Tomasina Fryd', '58 Sundown Terrace', 'PO Box 13371', '5909012913');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (336, 'Mirelle Burton', '7998 Forest Run Way', '19th Floor', '5074713437');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (342, 'Emlen Curbishley', '5061 Rusk Street', 'PO Box 17733', '3321942465');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (348, 'Mirelle Spur', '9 Reindahl Drive', 'Apt 478', '2497127317');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (353, 'Carlene Ducrow', '207 Union Junction', '6th Floor', '6889278464');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (358, 'Latia Kolakovic', '117 Darwin Way', 'Room 643', '4973041095');
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (363, 'Annmarie Swaffer', '3197 Pine View Lane', '14th Floor', '9272026305');
commit;
prompt 400 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (401, 'Renana Shubi', 'GalGal Hamazalot 10,HodHashron', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (402, 'Reut Agam', 'RabiAkiva 11,Bnei Brak', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (403, 'Tehila Shubi', 'GalgalHamazalot 61,Hod Hashron', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (405, 'William O''Hara', 'galgal 56,HodHashron', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (406, 'Judd Alda', '36 Overstreet Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (407, 'Carol Haysbert', '906 Juliet', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (408, 'Anita Tolkan', '87 McDonnell Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (409, 'Trick Shalhoub', '35 Edgar Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (410, 'Brian Pride', '797 Delbert Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (411, 'Bernard Quinones', '48 Edenbridge Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (412, 'Mel Yorn', '67 Sarah Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (413, 'Sarah Hatfield', '79 Rockland Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (414, 'Gil Almond', '4 O''Connor Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (415, 'Campbell Harrison', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (416, 'Michelle Williamson', '55 McGinley Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (417, 'Henry Aglukark', '23 Minogue Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (418, 'Domingo Berkoff', '87 Ciudad del Este Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (419, 'Kevin Heslov', '26 Clinton', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (420, 'Kid McCoy', '49 Vin Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (421, 'Mary Kirshner', '68 Greene Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (422, 'Jeffrey Wilder', '31 Ving Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (423, 'Bridget Loggins', '90 Foster', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (424, 'Bette Van Shelton', '50 Short Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (426, 'Neneh Houston', '309 Gracie Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (427, 'Mike de Lancie', '88 Gordie Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (428, 'Jason Emmerich', '41st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (429, 'Gailard Randal', '12 Ryan Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (430, 'Norm Jeter', '88 Peine Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (431, 'Juliana Saucedo', '31 Hunter Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (432, 'Goran O''Neal', '67 Taoyuan Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (433, 'Miriam Krumholtz', '19 Desmond Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (434, 'Rachael Napolitano', '11 Wahlberg Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (435, 'Albertina Crouch', '13 Ricky Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (436, 'Lili Darren', '36 Zeta-Jones Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (437, 'Freddy Kimball', '87 Arnold Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (438, 'Marie Noseworthy', '706 McBride Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (439, 'Lara Harry', '685 Nicosia Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (440, 'Randy Li', '30 Saul Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (441, 'Giancarlo Brando', '827 Quentin Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (442, 'Ryan Sutherland', '19 Sinise Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (443, 'Kasey Raybon', '33 Willis Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (444, 'Saul Peniston', '17 Puckett Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (445, 'Laurence Bugnon', '68 Winterthur Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (446, 'Kasey Lauper', '39 Shearer Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (447, 'Nikki Manning', '21st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (448, 'Cesar Ramirez', '81 Huntington Beach Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (449, 'Timothy Jackman', '84 Scaggs Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (450, 'Rob Ellis', '13rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (451, 'Graham Keith', '71 Nick Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (452, 'Isaiah Vinton', '20 Milsap Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (453, 'Beth Coolidge', '80 Iglesias Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (454, 'Rory Chinlund', '31 Bronx Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (455, 'Sheena Morton', '85 Molina Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (456, 'Leslie Lemmon', '63 Keith Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (457, 'Benicio Cleese', '386 Tom Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (458, 'Jake Kleinenberg', '32 Dunaway Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (459, 'Bryan Hamilton', '32 Benicio Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (460, 'Sharon Sepulveda', '26 Gennevilliers Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (461, 'Davey Davison', '7 Orlando Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (462, 'Brendan Clayton', '58 Davy Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (463, 'Ani DeGraw', '135 Joaquin Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (464, 'Freddy Durning', '98 Phillips Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (465, 'Ali Levine', '100 Maxwell Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (466, 'Courtney Nunn', '970 Landau Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (467, 'Bobby Brosnan', '45 Brooke', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (468, 'Sigourney Donelly', '51st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (469, 'Liv Nakai', '45 Gavin', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (470, 'Collin Johansen', '98 Van Helden Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (471, 'Clea Lawrence', '12 Nugent Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (472, 'Jesus Carrack', '547 Madonna Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (473, 'Regina Maguire', '11 Mitchell Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (474, 'Marianne Bonham', '671 Buenos Aires Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (475, 'Juliette Boothe', '60 Mira Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (476, 'Miles Law', '2 Ryan Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (477, 'Ashton McDowall', '60 Cary Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (478, 'Beverley Neil', '282 Pollak Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (479, 'Horace Field', '34 Robby Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (480, 'Franz Rockwell', '752 Feliciano Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (481, 'Arnold Delta', '33 Rossellini Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (482, 'Joaquim Fehr', '44 Frances Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (483, 'Ving Cumming', '70 Cage', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (484, 'Brad Madonna', '406 Holly Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (485, 'Brittany Tomei', '62 Reubens Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (486, 'Stephen Collins', '83 Paul Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (487, 'Dianne Vassar', '624 Natascha Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (488, 'Christina Margolyes', '87 Gavin Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (489, 'Annie Noseworthy', '50 Murdock Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (490, 'Yolanda Danger', '93rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (491, 'Saffron De Almeida', '72 Archer Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (492, 'Lari Neville', '51 Sammy Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (493, 'Leon Mac', '30 Pasadena Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (494, 'William Stoltz', '62 Phillippe Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (495, 'Stephanie DeVito', '44 Lynn Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (496, 'Harrison Eldard', '39 Valentin Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (497, 'Mia Colman', '289 Metcalf', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (498, 'Molly Posener', '79 Tah Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (499, 'Lindsey Stiers', '555 Myers Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (500, 'Jodie Tomei', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (501, 'Jeanne Holeman', '43rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (502, 'Denny Alexander', '26 Trejo Street', null, null);
commit;
prompt 500 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (503, 'Caroline Kutcher', '22nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (504, 'Allison O''Neill', '12nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (505, 'Selma Pride', '59 Harris Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (506, 'Allison Berry', '70 Rains Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (507, 'Taryn Snow', '64 Atkinson', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (508, 'Ann Channing', '68 Edward Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (509, 'Irene Stigers', '16 Houma Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (510, 'Jean-Claude Mantegna', '17 Barbara Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (511, 'Annie Llewelyn', '12 Copenhagen Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (512, 'Lance Giraldo', '93 Ribeirao preto Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (513, 'Freda Furay', '3 Padova Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (514, 'Judd Head', '94 Chicago Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (515, 'Jet Jonze', '81 Mykelti', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (516, 'Tori Young', '73 Noseworthy Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (517, 'Lara Law', '84 Newton Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (518, 'Tracy Phifer', '95 Summer Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (519, 'Andre Culkin', '721 Lewin Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (520, 'Rosie Fraser', '14 Sandoval Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (521, 'Warren Suchet', '50 Cole Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (522, 'Domingo Myles', '93 Harsum Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (523, 'Willem Vassar', '40 Lineback Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (524, 'Gladys Elwes', '865 Braugher Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (525, 'Herbie Aiken', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (526, 'Dan Van Shelton', '32nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (527, 'Gladys Simpson', '66 Laws Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (528, 'Gin McClinton', '33 McKennitt Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (529, 'Cole Cook', '782 Burns Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (530, 'Hazel Torino', '73 Graham Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (531, 'Scarlett Jordan', '31 Wakeling Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (532, 'Donal Carnes', '321 Matt Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (533, 'Garland O''Keefe', '68 Peter Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (534, 'Alessandro Penders', '488 Carnes Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (535, 'Howard Silverman', '95 Pierce Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (536, 'Frankie Rauhofer', '63rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (537, 'Fats Rucker', '878 Sartain Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (538, 'Cheech Howard', '92 Shalhoub Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (539, 'Ozzy Penders', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (540, 'Andrew Viterelli', '579 Franz Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (541, 'Leelee Kidman', '283 Crudup', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (542, 'Brothers Wilder', '87 Marlon Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (543, 'Queen Jordan', '12nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (544, 'Patty Emmerich', '113 Curtis-Hall', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (545, 'Famke Bridges', '165 Thurman Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (546, 'Belinda Watson', '38 Hudson', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (547, 'Eric Weber', '19 Bean Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (548, 'Mae Lang', '55 Cusack Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (549, 'Rodney Hawn', '79 Wayans Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (550, 'Roscoe Chaykin', '13rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (551, 'Mary Copeland', '93 Bekescsaba', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (552, 'Goran Lillard', '83rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (553, 'Tracy Slater', '10 Miriam Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (554, 'Charles Child', '26 Lancaster Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (555, 'Nancy Akins', '593 Weiland Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (556, 'Alana Nelligan', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (557, 'Lydia Hayek', '41st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (558, 'Alfie Lerner', '67 Earl Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (559, 'Paul Jones', '5 Don Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (560, 'Jason Tyler', '10 Lublin Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (561, 'Colin DiBiasio', '86 Cape town Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (562, 'Morgan Wiest', '70 Sheena Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (563, 'Temuera Assante', '66 Apple Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (564, 'Rupert Cooper', '43 Vejle Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (565, 'Benjamin Flatts', '84 DiFranco Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (566, 'Ray Boone', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (567, 'Ernie Reid', '53 Vaughn Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (568, 'Darren Alexander', '801 Andre Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (569, 'Hex Condition', '42 Heston Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (570, 'Hilton Drive', '71st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (571, 'Gran Venora', '94 Lawrence Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (572, 'Rod Guzman', '82 Joshua Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (573, 'Barry Tilly', '57 Burns Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (574, 'Larenz Harary', '80 Johor Bahru Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (575, 'Vertical Diehl', '838 Rio Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (576, 'Eileen Buckingham', '728 Wariner Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (577, 'Shannyn Allen', '77 Singletary Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (578, 'Timothy Wong', '73 Rizzo Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (579, 'Giovanni Cruz', '487 Tinsley Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (580, 'Temuera Pastore', '55 McCain Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (581, 'Lara Paquin', '253 Merle Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (582, 'Geraldine Smurfit', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (583, 'Jay Myers', '3 Rueil-Malmaison', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (584, 'Fisher Kramer', '671 Prague Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (585, 'Miguel Whitford', '12nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (586, 'Angela Webb', '29 Nils Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (587, 'Greg Chaplin', '204 Tsettos Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (588, 'James Streep', '39 Williams Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (589, 'Art Khan', '11 Ferrell Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (590, 'Annie Daniels', '78 Connery Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (591, 'Howie Roundtree', '17 Boucherville Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (592, 'Shannyn Bentley', '80 Sarasota', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (593, 'Maceo Mueller-Stahl', '41 Chemnitz Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (594, 'Giancarlo Spall', '13 Armin Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (595, 'Tal Schiavelli', '77 Santiago Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (596, 'Ryan Conley', '94 Cash Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (597, 'Robert Secada', '26 Gaby Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (598, 'Curt Garr', '254 Debbie Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (599, 'Embeth Brolin', '18 Cyndi', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (600, 'Kenny Keen', '50 Elisabeth Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (601, 'Jeremy Kattan', '39 Joanna Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (602, 'Shannon Dillon', '70 Gilliam Street', null, null);
commit;
prompt 600 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (603, 'Campbell Gooding', '68 Leigh Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (604, 'Maggie Bradford', '652 Altamonte Springs Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (605, 'Karen Sisto', '3 Lloyd Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (606, 'Juan Lorenz', '63 Luongo Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (607, 'Candice Burton', '5 Hannover Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (608, 'Natasha Pearce', '38 Tobey Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (609, 'Elvis Lucien', '94 McDiarmid', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (610, 'Jimmy Ojeda', '47 Diesel Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (611, 'Andrea Basinger', '53 Isaiah', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (612, 'Willie Stallone', '57 Louise Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (613, 'Gina Duchovny', '83 Luedenscheid Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (614, 'Trace Tinsley', '87 North Yorkshire Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (615, 'Ralph Macy', '32nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (616, 'Orlando Unger', '76 Burmester Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (617, 'Taryn Broderick', '71 Lexington Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (618, 'Cameron Gleeson', '21 Duschel Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (619, 'Carrie Santana', '99 Bandy Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (620, 'Taye Sledge', '23rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (621, 'Mac Ramirez', '197 Harper Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (622, 'Penelope McCann', '89 Casselberry Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (623, 'Candice Greenwood', '70 Woodward Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (624, 'Jennifer Kadison', '1 Arnold Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (625, 'Phil Rucker', '40 Kingsley Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (626, 'Talvin Weisz', '32 Biggs Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (627, 'Jeffrey Tate', '33 Giancarlo Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (628, 'Collin Kirkwood', '13 Dean Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (629, 'Mark Houston', '59 Whitman', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (630, 'Trick Weiland', '926 Corey Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (631, 'Mitchell Shawn', '40 Bob Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (632, 'Deborah Melvin', '74 Bandy Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (633, 'Janice Steagall', '89 Li Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (634, 'Jim Frost', '15 Shenzhen Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (635, 'Kimberly Tate', '71 Flack Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (636, 'Robbie Witt', '715 Chung Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (637, 'Ivan Schreiber', '34 San Francisco Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (638, 'Machine Wincott', '67 Chris Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (639, 'Hilary Strathairn', '72 Debary', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (640, 'Vern Unger', '82 Percy Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (641, 'Dylan Moffat', '561 Emmett Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (642, 'Laura Balaban', '38 Oded Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (643, 'Natacha Steenburgen', '62nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (644, 'Jena Kelly', '35 Sal Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (645, 'Taylor Harnes', '90 Carrington Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (646, 'Wayman Schiavelli', '616 Nigel Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (647, 'Fred Cromwell', '58 Rucker', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (648, 'Joy Connelly', '72nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (649, 'Famke Minogue', '88 QuÃ©bec Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (650, 'Roy Andrews', '85 Coughlan', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (651, 'Solomon Reeve', '46 Cox Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (652, 'Alicia Sawa', '92nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (653, 'Joshua Thornton', '13 Micky', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (654, 'Geena Branch', '72 Roger Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (655, 'Gran Springfield', '20 Davis Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (656, 'Kurtwood Galecki', '40 Monk Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (657, 'Lea Arden', '84 Pat Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (658, 'Natalie Cartlidge', '65 La Plata Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (659, 'Bill Melvin', '7 Randy Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (660, 'Morris Myers', '4 Alfred Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (661, 'Kyra Remar', '5 Curtis Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (662, 'Brendan Cartlidge', '285 Rockwell Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (663, 'Vivica Roy Parnell', '20 Lake Forest Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (664, 'Denise Perry', '153 Brickell Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (665, 'Ramsey Rifkin', '11 Mechelen Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (666, 'Roberta Fierstein', '19 Gladys Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (667, 'Ralph Oates', '3 Oxon Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (668, 'Ruth Houston', '22 Avon Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (669, 'Sheryl Hagerty', '78 Granada Hills Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (670, 'Winona Astin', '87 Magstadt', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (671, 'Willie Gellar', '79 Ned', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (672, 'Lily Sisto', '4 Casey Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (673, 'Merillee Bachman', '31st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (674, 'Taye Nolte', '31 Suzanne Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (675, 'Gwyneth Ali', '72 Richter Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (676, 'Darren Russell', '988 Jeter Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (677, 'Goldie Sherman', '174 Woods Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (678, 'Harry Tyler', '9 Tisdale Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (679, 'Vincent Bachman', '93 Langella Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (680, 'Davey Wahlberg', '56 Charlize', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (681, 'Swoosie Hubbard', '854 Hopper Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (682, 'Daniel Dolenz', '55 Kingsley Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (683, 'Wendy Hauser', '8 Gavin Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (684, 'Fats Kelly', '75 Sammy Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (685, 'Selma Wine', '70 Stiers Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (686, 'Nastassja McElhone', '325 Steven Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (687, 'Kylie Cox', '10 Stiller Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (688, 'Robin Tinsley', '81 Colon Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (689, 'Clarence McGregor', '21 Thomas Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (690, 'Maceo Richter', '17 Rosco Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (691, 'Elizabeth Skerritt', '21 Deborah Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (692, 'George Mraz', '541 Wiedlin Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (693, 'Kimberly Quatro', '68 Zwolle Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (694, 'Davy Vanian', '4 Kilmer Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (695, 'Nile Voight', '74 Donal', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (696, 'Charles Beck', '79 Stanley Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (697, 'Maxine Thurman', '824 LaMond Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (698, 'Rich DiBiasio', '31st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (699, 'Sandra Jackman', '29 Duluth Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (700, 'Miranda Richards', '4 Pryce Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (701, 'Hal Keith', '100 Vertical Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (702, 'LeVar Jeter', '57 Carlisle Drive', null, null);
commit;
prompt 700 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (703, 'Carol Barkin', '38 Noseworthy Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (704, 'Delbert Pearce', '15 Danes Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (705, 'Miko Rain', '21 Ravensburg Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (706, 'Simon O''Hara', '51 Rio', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (707, 'Gavin LaSalle', '12 Gray Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (708, 'Belinda Neville', '53 Francis Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (709, 'Gin Tinsley', '38 Lemmon Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (710, 'Emma Danger', '260 Waldbronn Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (711, 'Linda Hatchet', '87 Ravensburg Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (712, 'Rich Sainte-Marie', '26 McGill Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (713, 'Guy Creek', '7 Lightfoot Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (714, 'Veruca Piven', '19 Peachtree City Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (715, 'Fiona Elwes', '71st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (716, 'Jake Holland', '325 Redgrave Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (717, 'Dom Kleinenberg', '73 Angie Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (718, 'Rachael Waite', '58 Treviso Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (719, 'Dean Gibson', '999 Hatchet Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (720, 'Pam Berkley', '90 Ashland Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (721, 'Jonny Lee Van Shelton', '569 Darmstadt Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (722, 'Rick Hunt', '16 Buffalo', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (723, 'Maceo Benet', '8 Eugene Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (724, 'Ron Redford', '94 Thame', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (725, 'Courtney Owen', '81 LÃ¼beck Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (726, 'Vendetta Edmunds', '41st Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (727, 'Brittany Rhodes', '39 Duluth Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (728, 'Nik Deschanel', '67 Kansas City Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (729, 'Matthew Brolin', '72 Brampton Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (730, 'Tony Cockburn', '92 Kahn Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (731, 'Teena Branch', '58 Jamal Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (732, 'Mandy Bancroft', '98 Delta Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (733, 'Simon Jackman', '87 Tomei Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (734, 'Mac Geldof', '50 Graham Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (735, 'Natacha Shandling', '84 Badalucco Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (736, 'Ernest Sheen', '1 Paderborn Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (737, 'Kitty Fariq', '62nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (738, 'Derrick Dunaway', '496 PÃ©tion-ville Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (739, 'Bret Bragg', '97 Elijah Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (740, 'Rosanne Chaplin', '94 Reid Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (741, 'Delbert de Lancie', '52nd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (742, 'Lin Day', '88 St Jean de Soudain Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (743, 'Ritchie Richter', '648 McKellen Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (744, 'Delroy Purefoy', '54 Reno Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (745, 'Dick Channing', '519 Arthur Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (746, 'Kieran Chestnut', '49 Goodall Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (747, 'Gwyneth Santana', '432 Joely', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (748, 'Geoff Sorvino', '823 Geggy Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (749, 'Lara Merchant', '932 Suzi Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (750, 'Dianne Bachman', '39 Eder Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (751, 'Elijah James', '37 Cerritos Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (752, 'Jake Holiday', '481 Perlman Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (753, 'Kyra Pitney', '8 D''Onofrio Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (754, 'Chazz Bratt', '67 Boulder Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (755, 'David Heron', '23 Lunch Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (756, 'Franco Matthau', '42 Omaha Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (757, 'Dwight Farrell', '77 Albert Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (758, 'Jose Nelson', '93 Birmensdorf Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (759, 'Earl Bosco', '8 Kay Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (760, 'Austin O''Hara', '902 Harriet Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (761, 'Phoebe Arquette', '905 Parish', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (762, 'Jimmie Flanagan', '393 Carter Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (763, 'Hazel Stiers', '14 Moreno Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (764, 'Jennifer MacDonald', '87 Sigourney Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (765, 'Manu Franklin', '1 Ankara Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (766, 'Dylan Darren', '33rd Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (767, 'Penelope Pigott-Smith', '13 Zooey Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (768, 'Jake Parsons', '86 Nigel Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (769, 'Breckin Shatner', '44 Garcia Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (770, 'Mac Close', '81 Rodney Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (771, 'Percy Johansson', '248 Pleasure Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (772, 'Thelma Thompson', '3 Duke Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (773, 'Neve Liu', '93 Leverkusen Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (774, 'Christopher Mirren', '282 Elche Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (775, 'Kimberly Kennedy', '55 Dafoe Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (776, 'Kimberly Boyle', '172 Waldorf Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (777, 'Vendetta Bradford', '86 Gettysburg', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (778, 'Mint Redford', '21 Kelly Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (779, 'Mia Kirkwood', '46 Franklin Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (780, 'Leonardo Chaykin', '83 Shatner Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (781, 'Eugene Gill', '75 McGowan Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (782, 'Burt Soul', '349 Piven Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (783, 'Michael Jolie', '36 Susan', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (784, 'Danny Idle', '288 Ramsey Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (785, 'Hector Sevenfold', '19 Turku Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (786, 'Cathy Rapaport', '83 Epps Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (787, 'Jennifer Spector', '95 Ingram Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (788, 'Petula Fishburne', '362 McGoohan Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (789, 'Joey Stanley', '18 Kramer Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (790, 'Nanci Berry', '89 Stevens Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (791, 'Vondie Broza', '358 Saffron Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (792, 'Nigel Richardson', '14 Alfie Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (793, 'Alan Tanon', '19 Ali', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (794, 'Julianne O''Connor', '439 Payton Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (795, 'Courtney Hughes', '68 Cuenca Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (796, 'Clay Brown', '98 Pitt Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (797, 'Vienna Reno', '21 Armatrading Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (798, 'Melba Nelson', '493 Stiers Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (799, 'Lindsay Pryce', '63 Hoffman Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (800, 'Betty Duvall', '66 Donald Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (801, 'Humberto O''Sullivan', '658 Lari Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (802, 'Lenny Neill', '53 Bale Street', null, null);
commit;
prompt 800 records committed...
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (803, 'Wes Carlisle', '73 Mitra Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (804, 'Zooey Knight', '53 Dunn loring Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (805, 'Roger Church', '682 Dreyfuss Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (806, 'Dianne Spears', '87 Beck Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (807, 'Christopher Pryce', '74 Allison Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (808, 'Vince Kweller', '40 Pusan-city', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (809, 'Loreena Osbourne', '46 Charles Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (810, 'Brenda McCoy', '41 Rosario', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (811, 'Sam Scaggs', '60 Kenneth Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (812, 'Judi Scaggs', '11 Grand-mere Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (813, 'Cheech Washington', '44 Dutton Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (814, 'Tea Flanagan', '340 Foley', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (815, 'Leon Santa Rosa', '40 Charlize Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (816, 'Nicky Kotto', '880 Joli Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (817, 'Mos Callow', '66 Tippe Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (818, 'Micky Torn', '32 Victor', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (819, 'Lance Lofgren', '44 Sam Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (820, 'Albert Rifkin', '18 Bates Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (821, 'Bobby Randal', '26 Wakayama Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (822, 'James Harary', '43 Diamond Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (823, 'Jack Stone', '59 Exeter Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (824, 'Joy Pitney', '884 Massagno Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (825, 'Miki Gore', '19 Kapanka Drive', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (826, 'Talvin Van Helden', '55 Esposito Ave', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (827, 'Marisa Marin', '32 McIntosh', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (828, 'Jena Neuwirth', '531 Harris Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (829, 'Suzanne Ali', '55 Arnold Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (830, 'Morris Christie', '392 Dwight Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (831, 'Trace Cassidy', '88 Kanata Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (832, 'Boz Bosco', '82 Mapo-gu Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (833, 'Buddy Smith', '38 St Leonards', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (834, 'Ewan Lunch', '238 Sandoval Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (835, 'Austin Griffiths', '64 Kristin Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (836, 'Rich Rourke', '18 Mann Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (837, 'Denise McCabe', '16 Fonda Blvd', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (838, 'Louise Macy', '75 Gabriel Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (839, 'Quentin Tankard', '86 Dzundza', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (840, 'Denzel DiFranco', '32 Weisberg Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (841, 'Davey Waits', '41 Hobson Road', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (982, 'Steffane Jeffes', '25 Tomscot Plaza', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (872, 'Shara Benninger', '96 Thackeray Court', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (866, 'Myrtle Dentith', '948 David Terrace', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (956, 'Ceil Mor', '2 Shoshone Avenue', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (869, 'Skelly Alben', '556 Arrowood Center', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (1011, 'Kelcey Abraham', '59358 Shasta Street', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (1079, 'Gnni Smidmore', '7 Lindbergh Terrace', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (1046, 'Pascal Rawlings', '33166 Golf Course Circle', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (1007, 'Chucho Gheerhaert', '4608 Farwell Park', null, null);
insert into CUSTOMERS (customer_id, customer_name, address_line_1, address_line_2, phone_number)
values (979, 'Phedra Ausher', '99 Dapin Avenue', null, null);
commit;
prompt 849 records loaded
prompt Loading WORKER...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (4, 'Shira', to_date('19-06-2016', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (2, 'Ron', to_date('19-06-2019', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (3, 'Michal', to_date('09-05-2020', 'dd-mm-yyyy'), 'Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (5, 'Leonardo', to_date('30-03-1997', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (6, 'Bridget', to_date('15-09-2016', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (7, 'Dean', to_date('06-12-1985', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (8, 'Carrie-Anne', to_date('31-03-1971', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (9, 'Sylvester', to_date('14-03-2022', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (10, 'Benjamin', to_date('24-12-2005', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (11, 'Faye', to_date('26-12-2011', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (12, 'Ellen', to_date('10-03-2005', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (13, 'Jeff', to_date('01-08-2023', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (14, 'Oliver', to_date('19-04-2020', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (15, 'Julie', to_date('25-01-1998', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (16, 'First', to_date('26-12-1978', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (17, 'Ellen', to_date('29-08-1994', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (18, 'Rob', to_date('16-02-1994', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (19, 'Owen', to_date('02-01-2015', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (20, 'Freda', to_date('10-12-2013', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (21, 'Matthew', to_date('06-07-1993', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (22, 'Boz', to_date('30-08-2019', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (23, 'Brooke', to_date('17-12-1971', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (24, 'Keith', to_date('14-08-1977', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (25, 'Mena', to_date('26-10-1992', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (26, 'Mira', to_date('02-10-2018', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (27, 'Susan', to_date('16-06-2018', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (28, 'Lari', to_date('25-06-2024', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (29, 'Fairuza', to_date('23-10-2002', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (30, 'Joaquin', to_date('07-03-2024', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (31, 'Kelli', to_date('10-03-2005', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (32, 'Anita', to_date('30-06-1979', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (33, 'Gates', to_date('10-05-1987', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (34, 'Molly', to_date('04-11-2015', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (35, 'Crystal', to_date('16-01-2012', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (36, 'Edward', to_date('02-07-2009', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (37, 'Lee', to_date('30-06-1993', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (38, 'Greg', to_date('01-02-1976', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (39, 'Elisabeth', to_date('19-05-2005', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (40, 'Udo', to_date('27-02-1981', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (41, 'Burt', to_date('17-04-1993', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (42, 'Bryan', to_date('08-05-2017', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (43, 'Famke', to_date('06-07-2000', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (44, 'Rachid', to_date('24-09-1977', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (45, 'Kristin', to_date('02-11-1995', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (46, 'Lorraine', to_date('15-10-2008', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (47, 'Johnny', to_date('24-11-1973', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (48, 'Ani', to_date('10-01-2006', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (49, 'Maria', to_date('28-10-2010', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (50, 'Maxine', to_date('04-07-2012', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (51, 'Annie', to_date('25-06-1993', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (52, 'Mekhi', to_date('26-04-2018', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (53, 'Kyra', to_date('25-12-2008', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (54, 'Stephen', to_date('05-09-1993', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (55, 'Nigel', to_date('31-03-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (56, 'Brothers', to_date('15-12-2012', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (57, 'Oliver', to_date('22-04-1983', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (58, 'Davy', to_date('29-07-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (59, 'Anita', to_date('18-11-1984', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (60, 'Karen', to_date('09-02-1991', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (61, 'Elle', to_date('29-10-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (62, 'Lily', to_date('06-05-1970', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (63, 'Mitchell', to_date('16-02-1995', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (64, 'Kyle', to_date('04-10-2000', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (65, 'Carolyn', to_date('12-06-1992', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (66, 'Rosie', to_date('15-01-2019', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (67, 'Mykelti', to_date('01-03-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (68, 'Trick', to_date('29-11-2017', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (69, 'Charlton', to_date('05-01-1973', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (70, 'Sinead', to_date('27-03-1975', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (71, 'Dustin', to_date('20-03-2013', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (72, 'Cole', to_date('06-09-1978', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (73, 'Sona', to_date('03-09-1975', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (74, 'Warren', to_date('30-03-1970', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (75, 'Sander', to_date('16-02-1995', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (76, 'Shannyn', to_date('31-08-2014', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (77, 'Maggie', to_date('06-03-1978', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (78, 'Charles', to_date('05-10-1983', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (79, 'David', to_date('11-08-1985', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (80, 'Lou', to_date('14-10-2022', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (81, 'Alessandro', to_date('12-09-2010', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (82, 'Betty', to_date('15-06-1981', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (83, 'Breckin', to_date('25-06-1979', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (84, 'Anita', to_date('17-07-2024', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (85, 'Leonardo', to_date('28-04-1984', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (86, 'Shannon', to_date('30-10-2020', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (87, 'Jennifer', to_date('22-12-1986', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (88, 'Juliana', to_date('15-04-1978', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (89, 'Eric', to_date('05-04-2012', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (90, 'Lloyd', to_date('16-05-2013', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (91, 'Jeffrey', to_date('27-01-2000', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (92, 'Boz', to_date('08-01-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (93, 'Shannyn', to_date('11-06-2021', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (94, 'Jackson', to_date('28-10-1999', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (95, 'Peter', to_date('08-05-2021', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (96, 'Meryl', to_date('28-10-2017', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (97, 'Steve', to_date('27-01-1996', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (98, 'Vanessa', to_date('25-01-1994', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (99, 'Naomi', to_date('21-10-2018', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (100, 'Nastassja', to_date('13-11-1972', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (101, 'Sara', to_date('12-04-2008', 'dd-mm-yyyy'), 'Credit Analyst');
commit;
prompt 100 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (102, 'Ralph', to_date('01-01-2005', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (103, 'Eddie', to_date('08-09-2013', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (104, 'Aidan', to_date('04-09-2020', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (105, 'Emmylou', to_date('06-12-1974', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (106, 'Josh', to_date('15-05-1979', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (107, 'Gin', to_date('01-04-1972', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (108, 'Bryan', to_date('22-01-1995', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (109, 'Tyrone', to_date('17-04-1973', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (110, 'Sona', to_date('17-05-1972', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (111, 'Geena', to_date('11-01-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (112, 'Carl', to_date('22-11-1972', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (113, 'Carl', to_date('13-01-1982', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (114, 'Rosanna', to_date('04-09-1986', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (115, 'Beth', to_date('09-12-2008', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (116, 'Bruce', to_date('28-08-1980', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (117, 'Gena', to_date('29-10-2017', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (118, 'Tyrone', to_date('15-12-1978', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (119, 'Amanda', to_date('01-06-1988', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (120, 'Treat', to_date('27-05-2013', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (121, 'Cary', to_date('25-06-2001', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (122, 'Joey', to_date('20-03-1997', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (123, 'Owen', to_date('06-05-2001', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (124, 'Bill', to_date('08-08-1978', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (125, 'Mike', to_date('08-06-2021', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (126, 'Kay', to_date('07-07-1985', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (127, 'Daryle', to_date('17-06-1974', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (128, 'Taylor', to_date('03-01-2016', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (129, 'Cole', to_date('14-12-1970', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (130, 'Taylor', to_date('29-09-2016', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (131, 'Terry', to_date('21-07-1982', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (132, 'Lenny', to_date('18-06-2008', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (133, 'Sean', to_date('02-06-2024', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (134, 'Eileen', to_date('22-09-2022', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (135, 'ChantÃ©', to_date('03-08-2001', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (136, 'Frances', to_date('11-05-1972', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (137, 'Gary', to_date('01-08-2021', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (138, 'Oliver', to_date('31-08-1974', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (139, 'Colm', to_date('12-08-2022', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (140, 'Willem', to_date('08-02-2005', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (141, 'Warren', to_date('21-07-2022', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (142, 'Roscoe', to_date('10-10-1995', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (143, 'Mint', to_date('09-01-1991', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (144, 'Ahmad', to_date('07-11-2020', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (145, 'Treat', to_date('10-01-2020', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (146, 'Harrison', to_date('09-08-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (147, 'Nils', to_date('07-08-1984', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (148, 'Sona', to_date('26-04-2014', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (149, 'Caroline', to_date('18-12-1998', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (150, 'Chet', to_date('21-05-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (151, 'Vendetta', to_date('25-05-2012', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (152, 'Joaquim', to_date('15-06-2011', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (153, 'Tom', to_date('14-09-2007', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (154, 'Tal', to_date('31-05-2000', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (155, 'Lisa', to_date('01-05-1985', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (156, 'Cloris', to_date('06-05-1979', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (157, 'Ivan', to_date('01-04-1973', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (158, 'Tracy', to_date('22-04-2014', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (159, 'Robby', to_date('05-02-1983', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (160, 'Andrew', to_date('25-06-1981', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (161, 'Warren', to_date('26-03-1997', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (162, 'Hal', to_date('16-08-2005', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (163, 'Marianne', to_date('15-10-2020', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (164, 'Barry', to_date('28-05-1998', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (165, 'Alana', to_date('29-09-2012', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (166, 'Mitchell', to_date('21-03-2007', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (167, 'Kitty', to_date('08-04-2017', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (168, 'Mira', to_date('24-04-2002', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (169, 'Solomon', to_date('23-01-2006', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (170, 'Christian', to_date('22-04-1976', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (171, 'Robbie', to_date('26-03-2021', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (172, 'Trick', to_date('06-02-2008', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (173, 'Eileen', to_date('26-12-1985', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (174, 'Mary Beth', to_date('30-01-2014', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (175, 'Greg', to_date('06-07-1994', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (176, 'Rosanna', to_date('04-01-2002', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (177, 'Sydney', to_date('08-04-1997', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (178, 'Bob', to_date('30-05-1992', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (179, 'Dianne', to_date('28-12-2005', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (180, 'Sal', to_date('10-10-1992', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (181, 'Sean', to_date('17-05-1993', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (182, 'Lindsey', to_date('03-12-2021', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (183, 'Jude', to_date('13-04-1998', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (184, 'Noah', to_date('12-12-2003', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (185, 'Edgar', to_date('25-07-2002', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (186, 'Drew', to_date('06-07-2019', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (187, 'Miko', to_date('12-12-2007', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (188, 'Avril', to_date('05-11-2004', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (189, 'Aida', to_date('04-01-1990', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (190, 'Heather', to_date('24-01-2002', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (191, 'Larenz', to_date('16-12-1973', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (192, 'Vanessa', to_date('15-04-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (193, 'Meg', to_date('24-06-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (194, 'Sal', to_date('28-12-1996', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (195, 'Keith', to_date('12-09-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (196, 'Colm', to_date('04-01-1996', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (197, 'Ricky', to_date('24-09-1975', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (198, 'Gran', to_date('13-10-2013', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (199, 'Ricky', to_date('12-08-1981', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (200, 'Hookah', to_date('20-06-1977', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (201, 'Neve', to_date('23-09-2008', 'dd-mm-yyyy'), 'Investment Advisor');
commit;
prompt 200 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (202, 'Lionel', to_date('14-09-1984', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (203, 'Marty', to_date('05-06-2012', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (204, 'Harris', to_date('10-06-2009', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (205, 'Kid', to_date('22-04-1982', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (206, 'Judy', to_date('30-05-1981', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (207, 'Rita', to_date('16-06-1998', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (208, 'Giovanni', to_date('03-08-1972', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (209, 'Rhett', to_date('17-10-2003', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (210, 'Carlos', to_date('02-01-1983', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (211, 'James', to_date('10-06-1984', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (212, 'Trick', to_date('28-11-2017', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (213, 'Bernie', to_date('16-11-2022', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (214, 'Greg', to_date('13-11-2024', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (215, 'Mary Beth', to_date('24-12-1985', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (216, 'Cameron', to_date('01-10-1995', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (217, 'Lou', to_date('21-08-1982', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (218, 'Debbie', to_date('11-04-1976', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (219, 'Mitchell', to_date('29-05-2019', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (220, 'Gilberto', to_date('25-10-2012', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (221, 'Jon', to_date('08-07-2003', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (222, 'Bernard', to_date('24-08-2023', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (223, 'Natacha', to_date('10-10-2001', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (224, 'Ritchie', to_date('25-04-1983', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (225, 'Talvin', to_date('03-09-2016', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (226, 'Miki', to_date('17-11-1979', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (227, 'Sissy', to_date('03-04-1989', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (228, 'Gina', to_date('13-03-2014', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (229, 'Gilbert', to_date('09-01-1982', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (230, 'Rene', to_date('17-03-2009', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (231, 'Brothers', to_date('23-01-1971', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (232, 'Johnette', to_date('16-02-2013', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (233, 'Joaquin', to_date('11-11-2024', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (234, 'Azucar', to_date('02-07-1980', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (235, 'Bridgette', to_date('24-10-1989', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (236, 'Marlon', to_date('25-08-2001', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (237, 'Lois', to_date('22-11-2003', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (238, 'Connie', to_date('08-11-2010', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (239, 'Mekhi', to_date('15-11-1997', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (240, 'Lily', to_date('29-08-1989', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (241, 'Robbie', to_date('16-01-2017', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (242, 'Judi', to_date('09-01-1990', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (243, 'Katrin', to_date('30-01-1973', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (244, 'Louise', to_date('11-03-1986', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (245, 'Warren', to_date('14-06-2010', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (246, 'Randy', to_date('30-12-2014', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (247, 'Claude', to_date('15-12-2005', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (248, 'Phil', to_date('02-02-2020', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (249, 'Dylan', to_date('31-05-2024', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (250, 'Roddy', to_date('24-09-1992', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (251, 'Gates', to_date('24-03-1974', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (252, 'Mac', to_date('27-01-2003', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (253, 'Ving', to_date('23-03-1984', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (254, 'Sandra', to_date('18-11-1982', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (255, 'Rhys', to_date('04-05-1974', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (256, 'Tea', to_date('27-04-1996', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (257, 'Tea', to_date('25-03-1992', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (258, 'Willie', to_date('12-01-2006', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (259, 'Joshua', to_date('28-03-1998', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (260, 'Isabella', to_date('03-07-1970', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (261, 'Isaiah', to_date('13-06-2001', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (262, 'Jose', to_date('05-10-1981', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (263, 'Harris', to_date('07-08-1997', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (264, 'Loreena', to_date('13-12-1977', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (265, 'Neil', to_date('01-09-2019', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (266, 'Avril', to_date('31-07-1979', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (267, 'Nicolas', to_date('21-04-2006', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (268, 'Whoopi', to_date('07-05-2019', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (269, 'Jeremy', to_date('16-10-1971', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (270, 'Brittany', to_date('30-06-1989', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (271, 'Rik', to_date('27-10-2005', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (272, 'Ming-Na', to_date('27-02-2001', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (273, 'Kurtwood', to_date('23-11-2011', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (274, 'Adina', to_date('03-11-1972', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (275, 'Eugene', to_date('01-11-2001', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (276, 'Mary', to_date('18-09-1973', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (277, 'Illeana', to_date('03-04-2000', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (278, 'Busta', to_date('27-07-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (279, 'Mitchell', to_date('20-03-2024', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (280, 'Jann', to_date('20-07-1973', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (281, 'Kiefer', to_date('23-04-2009', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (282, 'Harvey', to_date('11-02-2006', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (283, 'Gin', to_date('20-03-1996', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (284, 'Grace', to_date('18-07-2017', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (285, 'Rolando', to_date('11-04-1996', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (286, 'Bruce', to_date('06-08-1997', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (287, 'Mia', to_date('23-06-1982', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (288, 'Ron', to_date('01-12-1984', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (289, 'Crispin', to_date('24-12-1983', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (290, 'Roscoe', to_date('12-12-2024', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (291, 'Marie', to_date('22-03-2019', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (292, 'Nikka', to_date('27-01-2017', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (293, 'Illeana', to_date('31-12-2014', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (294, 'Anjelica', to_date('15-03-1996', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (295, 'Emily', to_date('03-10-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (296, 'Cheech', to_date('11-12-1988', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (297, 'Scott', to_date('07-04-1983', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (298, 'Gena', to_date('17-01-1978', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (299, 'Terence', to_date('07-02-2009', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (300, 'Ossie', to_date('06-04-1974', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (301, 'Demi', to_date('24-09-2010', 'dd-mm-yyyy'), 'Financial Advisor');
commit;
prompt 300 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (302, 'Claire', to_date('24-05-2018', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (303, 'Jonathan', to_date('27-05-1998', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (304, 'Andrew', to_date('17-11-2010', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (305, 'Trini', to_date('20-08-2015', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (306, 'Gary', to_date('27-07-2008', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (307, 'Bernie', to_date('02-06-2022', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (308, 'Goran', to_date('04-03-2016', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (309, 'Rose', to_date('15-08-1992', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (310, 'Rickie', to_date('05-05-1974', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (311, 'Jet', to_date('27-04-1997', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (312, 'Maureen', to_date('30-01-2001', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (313, 'Katie', to_date('26-08-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (314, 'Louise', to_date('27-11-1988', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (315, 'Johnnie', to_date('27-06-1993', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (316, 'Bridget', to_date('10-04-1975', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (317, 'Joanna', to_date('26-06-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (318, 'Rueben', to_date('07-08-2014', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (319, 'Giancarlo', to_date('25-01-1970', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (320, 'Earl', to_date('30-07-1994', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (321, 'Miranda', to_date('03-03-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (322, 'Wayman', to_date('08-11-1993', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (323, 'Boyd', to_date('27-07-1978', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (324, 'Andie', to_date('27-08-1990', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (325, 'Harry', to_date('01-11-2014', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (326, 'Clea', to_date('07-10-1973', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (327, 'Emm', to_date('11-08-1997', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (328, 'Elijah', to_date('30-06-1971', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (329, 'Edie', to_date('13-09-1985', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (330, 'Veruca', to_date('02-04-2007', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (331, 'Denny', to_date('21-09-2004', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (332, 'Antonio', to_date('29-03-1985', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (333, 'Daryle', to_date('08-02-2009', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (334, 'Tea', to_date('07-08-1972', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (335, 'Bruce', to_date('07-10-2024', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (336, 'Earl', to_date('22-06-2023', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (337, 'Isaiah', to_date('24-12-1997', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (338, 'Treat', to_date('18-01-2017', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (339, 'Mint', to_date('09-05-2018', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (340, 'Larenz', to_date('17-11-1998', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (341, 'Gran', to_date('18-01-1999', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (342, 'Ewan', to_date('16-07-1978', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (343, 'Lionel', to_date('13-05-1982', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (344, 'Lonnie', to_date('27-12-2000', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (345, 'Devon', to_date('14-09-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (346, 'Joanna', to_date('29-10-2003', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (347, 'Jim', to_date('09-06-1988', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (348, 'Ed', to_date('26-05-2002', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (349, 'Josh', to_date('29-04-2014', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (350, 'Lizzy', to_date('04-09-1974', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (351, 'Cuba', to_date('15-01-2009', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (352, 'Collective', to_date('20-08-2016', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (353, 'Micky', to_date('26-06-2007', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (354, 'Brooke', to_date('16-09-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (355, 'Denis', to_date('13-06-1999', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (356, 'Mac', to_date('12-08-2017', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (357, 'Al', to_date('19-04-2004', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (358, 'Mena', to_date('07-03-2022', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (359, 'Luis', to_date('14-10-2002', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (360, 'Peter', to_date('30-04-1989', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (361, 'Charles', to_date('12-12-2011', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (362, 'Greg', to_date('10-10-2023', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (363, 'Chuck', to_date('18-12-2003', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (364, 'Burt', to_date('26-03-1993', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (365, 'Rip', to_date('25-12-2003', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (366, 'Jane', to_date('24-02-1996', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (367, 'Jason', to_date('13-02-1987', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (368, 'Cevin', to_date('13-06-1989', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (369, 'Morris', to_date('23-01-1981', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (370, 'Christian', to_date('09-11-1980', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (371, 'Irene', to_date('13-12-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (372, 'Hilary', to_date('27-09-1986', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (373, 'Ralph', to_date('17-03-1987', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (374, 'Chrissie', to_date('16-11-1984', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (375, 'Tara', to_date('30-12-1971', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (376, 'Colin', to_date('06-12-2009', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (377, 'Mekhi', to_date('23-08-2020', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (378, 'Forest', to_date('25-10-1983', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (379, 'Bebe', to_date('09-10-2007', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (380, 'Debra', to_date('07-03-1992', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (381, 'Marianne', to_date('15-12-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (382, 'Julianna', to_date('08-08-1977', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (383, 'Rosanne', to_date('14-05-2024', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (384, 'Patti', to_date('13-04-1988', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (385, 'Sally', to_date('03-01-2001', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (386, 'Mitchell', to_date('16-03-1979', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (387, 'Shirley', to_date('28-10-2016', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (388, 'Buffy', to_date('02-12-2018', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (389, 'Matthew', to_date('24-11-1997', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (390, 'Ernest', to_date('27-08-1995', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (391, 'Connie', to_date('16-06-1998', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (392, 'Brenda', to_date('17-07-2024', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (393, 'Mandy', to_date('19-11-2016', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (394, 'Ernie', to_date('07-06-2019', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (395, 'Dwight', to_date('03-12-2021', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (396, 'Andrae', to_date('21-04-1981', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (397, 'Laura', to_date('07-02-2016', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (398, 'Heather', to_date('20-01-2007', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (399, 'James', to_date('14-09-1970', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (400, 'Miriam', to_date('08-03-1970', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (401, 'Tal', to_date('11-06-1984', 'dd-mm-yyyy'), 'Business Account Manager');
commit;
prompt 400 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (402, 'Carolyn', to_date('22-04-2000', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (403, 'Casey', to_date('29-04-1974', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (404, 'Lila', to_date('15-04-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (405, 'Naomi', to_date('12-03-2001', 'dd-mm-yyyy'), 'Branch Manager');
commit;
prompt 404 records loaded
prompt Loading ACTIVITY...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (1, 190, 2, 203, 789);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (2, 158, 1, 12, 491);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (3, 162, 2, 233, 815);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (4, 298, 4, 395, 578);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (5, 290, 4, 309, 817);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (6, 312, 2, 20, 651);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (8, 336, 4, 382, 431);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (12, 204, 3, 45, 519);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (13, 376, 2, 150, 720);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (14, 390, 4, 393, 782);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (15, 94, 1, 342, 494);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (16, 346, 4, 36, 546);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (17, 162, 3, 130, 550);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (18, 358, 2, 57, 590);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (19, 283, 3, 220, 727);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (20, 171, 4, 220, 515);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (21, 354, 3, 150, 632);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (22, 386, 2, 373, 543);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (23, 5, 4, 169, 692);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (24, 351, 1, 160, 706);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (25, 293, 2, 199, 581);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (26, 215, 2, 274, 500);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (27, 256, 3, 344, 762);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (28, 277, 4, 401, 769);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (29, 74, 2, 108, 530);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (30, 60, 2, 320, 773);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (31, 299, 3, 373, 491);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (32, 346, 1, 123, 570);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (33, 15, 2, 30, 659);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (34, 72, 3, 353, 780);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (35, 364, 1, 242, 789);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (36, 230, 1, 48, 613);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (37, 126, 1, 110, 730);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (38, 215, 4, 374, 777);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (39, 310, 3, 375, 813);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (40, 358, 1, 85, 683);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (41, 388, 1, 156, 498);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (43, 309, 2, 86, 579);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (44, 175, 2, 222, 705);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (45, 221, 4, 120, 564);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (46, 269, 2, 47, 529);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (47, 313, 4, 86, 496);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (48, 40, 3, 188, 715);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (49, 382, 2, 176, 589);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (50, 56, 4, 395, 786);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (52, 286, 3, 347, 831);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (53, 3, 2, 387, 582);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (54, 279, 3, 251, 666);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (55, 312, 3, 307, 697);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (56, 290, 1, 148, 786);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (57, 109, 2, 381, 438);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (58, 94, 3, 358, 692);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (60, 365, 1, 231, 782);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (62, 131, 1, 55, 737);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (63, 39, 4, 302, 488);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (65, 16, 3, 131, 770);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (66, 357, 3, 185, 443);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (67, 220, 3, 222, 621);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (68, 246, 1, 68, 797);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (69, 77, 2, 65, 646);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (70, 348, 1, 334, 512);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (71, 167, 2, 226, 818);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (73, 78, 4, 287, 448);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (74, 377, 4, 130, 477);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (75, 15, 4, 378, 823);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (76, 199, 2, 36, 681);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (77, 115, 2, 183, 836);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (78, 73, 4, 119, 433);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (79, 289, 3, 317, 554);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (80, 163, 2, 105, 757);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (81, 199, 2, 373, 428);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (83, 156, 2, 143, 513);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (84, 122, 3, 290, 689);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (85, 137, 2, 354, 613);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (86, 294, 3, 246, 727);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (87, 131, 1, 87, 440);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (88, 175, 4, 334, 544);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (89, 212, 2, 198, 686);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (90, 179, 2, 296, 751);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (91, 334, 2, 183, 603);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (92, 347, 4, 158, 638);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (93, 248, 1, 225, 453);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (96, 60, 3, 339, 626);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (97, 289, 3, 262, 653);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (98, 190, 2, 328, 799);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (99, 372, 3, 29, 802);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (100, 26, 3, 164, 795);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (101, 76, 2, 134, 725);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (102, 90, 3, 113, 512);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (103, 159, 3, 354, 697);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (104, 98, 2, 130, 721);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (105, 124, 2, 135, 539);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (106, 5, 2, 99, 744);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (107, 228, 1, 107, 494);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (108, 363, 2, 3, 555);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (109, 393, 4, 299, 815);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (111, 56, 2, 284, 499);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (112, 197, 2, 100, 558);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (113, 153, 3, 73, 449);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (114, 323, 2, 379, 836);
commit;
prompt 100 records committed...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (115, 393, 2, 115, 503);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (116, 169, 4, 160, 635);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (117, 287, 4, 8, 449);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (118, 213, 2, 166, 501);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (119, 306, 1, 377, 633);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (120, 294, 2, 220, 748);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (121, 336, 4, 217, 826);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (123, 282, 2, 236, 447);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (124, 308, 4, 293, 444);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (125, 391, 3, 48, 568);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (127, 86, 4, 150, 666);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (128, 358, 4, 35, 593);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (130, 362, 1, 386, 523);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (131, 249, 1, 332, 503);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (132, 59, 1, 39, 716);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (133, 57, 2, 275, 688);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (134, 30, 4, 328, 555);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (135, 323, 3, 12, 722);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (136, 392, 4, 288, 720);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (137, 258, 1, 264, 714);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (138, 221, 2, 138, 433);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (139, 375, 3, 348, 524);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (140, 346, 1, 233, 431);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (144, 23, 3, 82, 444);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (147, 69, 1, 309, 479);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (148, 108, 2, 68, 777);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (149, 386, 1, 119, 691);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (150, 221, 2, 222, 645);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (152, 126, 3, 120, 403);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (153, 211, 4, 194, 801);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (154, 103, 4, 174, 459);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (155, 82, 2, 324, 455);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (156, 335, 2, 342, 748);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (157, 214, 2, 64, 413);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (158, 378, 2, 19, 451);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (159, 59, 2, 190, 511);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (160, 391, 2, 279, 810);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (161, 172, 1, 45, 820);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (162, 49, 1, 370, 492);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (163, 86, 4, 179, 657);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (164, 26, 1, 210, 665);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (165, 358, 3, 42, 698);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (166, 355, 4, 381, 415);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (167, 287, 1, 68, 724);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (168, 138, 4, 9, 555);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (169, 211, 1, 27, 475);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (171, 290, 1, 146, 523);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (173, 225, 4, 119, 547);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (174, 76, 1, 111, 620);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (175, 313, 2, 74, 697);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (176, 334, 2, 362, 742);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (178, 300, 4, 45, 554);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (179, 228, 4, 177, 493);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (180, 25, 4, 125, 780);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (181, 368, 1, 241, 619);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (182, 102, 4, 222, 496);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (183, 243, 1, 302, 815);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (184, 362, 3, 348, 719);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (185, 377, 2, 290, 552);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (186, 314, 2, 133, 541);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (188, 107, 1, 10, 774);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (189, 55, 4, 232, 591);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (190, 16, 1, 291, 579);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (191, 314, 2, 116, 702);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (192, 41, 3, 169, 722);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (194, 45, 1, 288, 703);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (195, 121, 4, 236, 434);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (196, 13, 4, 383, 749);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (198, 39, 4, 78, 751);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (200, 28, 2, 11, 552);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (201, 119, 3, 396, 642);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (202, 335, 3, 58, 707);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (204, 114, 2, 306, 621);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (205, 50, 4, 145, 621);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (206, 222, 2, 334, 682);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (207, 66, 3, 18, 613);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (208, 204, 1, 41, 459);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (209, 177, 4, 237, 585);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (211, 300, 1, 388, 596);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (212, 3, 1, 36, 752);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (213, 166, 2, 332, 836);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (214, 40, 1, 378, 710);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (215, 76, 1, 57, 468);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (216, 79, 3, 405, 699);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (217, 162, 4, 262, 461);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (219, 182, 2, 33, 731);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (220, 115, 2, 219, 631);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (221, 252, 1, 107, 823);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (222, 11, 2, 114, 519);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (223, 77, 1, 394, 630);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (225, 344, 3, 264, 692);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (227, 187, 4, 362, 766);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (229, 39, 1, 315, 622);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (230, 77, 2, 36, 458);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (231, 162, 4, 402, 427);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (232, 349, 3, 202, 597);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (233, 118, 4, 315, 718);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (234, 201, 2, 363, 403);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (236, 69, 2, 371, 707);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (237, 400, 2, 60, 611);
commit;
prompt 200 records committed...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (238, 11, 4, 12, 665);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (239, 152, 3, 343, 622);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (240, 324, 3, 240, 801);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (243, 116, 1, 393, 841);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (244, 129, 3, 318, 798);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (246, 223, 3, 91, 625);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (251, 149, 4, 180, 661);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (252, 39, 2, 269, 424);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (256, 152, 1, 139, 497);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (258, 89, 3, 370, 517);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (259, 116, 2, 8, 826);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (260, 388, 2, 366, 428);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (262, 250, 3, 63, 633);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (263, 143, 4, 395, 671);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (265, 342, 1, 353, 643);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (266, 188, 4, 371, 830);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (268, 185, 4, 332, 783);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (270, 33, 3, 165, 785);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (272, 175, 2, 58, 775);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (273, 269, 1, 10, 810);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (276, 84, 2, 270, 585);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (279, 46, 3, 260, 693);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (280, 311, 2, 49, 522);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (281, 342, 1, 74, 518);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (284, 368, 3, 270, 699);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (286, 201, 2, 69, 703);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (287, 289, 2, 223, 786);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (289, 277, 2, 184, 683);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (292, 138, 1, 398, 677);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (293, 204, 3, 219, 471);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (295, 64, 1, 217, 658);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (297, 122, 1, 264, 800);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (298, 280, 3, 91, 661);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (299, 343, 3, 176, 814);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (301, 386, 1, 198, 541);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (302, 69, 3, 196, 819);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (305, 261, 4, 117, 700);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (306, 93, 3, 344, 642);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (307, 334, 1, 29, 639);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (308, 357, 4, 5, 661);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (310, 48, 4, 254, 419);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (311, 252, 3, 20, 489);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (315, 288, 1, 347, 805);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (501, 240, 242, 253, 584);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (318, 365, 1, 220, 500);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (502, 272, 399, 37, 532);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (503, 111, 370, 41, 812);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (504, 207, 351, 89, 749);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (505, 37, 280, 206, 527);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (510, 266, 116, 298, 810);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (326, 132, 4, 362, 614);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (327, 363, 4, 334, 660);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (329, 398, 4, 211, 690);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (330, 58, 3, 343, 775);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (511, 139, 96, 208, 549);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (333, 294, 2, 340, 804);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (334, 306, 1, 318, 543);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (335, 337, 4, 162, 405);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (337, 128, 1, 48, 803);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (338, 269, 3, 135, 578);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (339, 401, 3, 184, 736);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (341, 238, 1, 377, 782);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (342, 61, 2, 317, 732);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (343, 250, 1, 306, 436);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (345, 223, 4, 109, 503);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (346, 392, 1, 102, 455);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (347, 128, 3, 81, 681);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (514, 296, 60, 184, 775);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (350, 15, 2, 365, 535);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (351, 162, 4, 156, 511);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (352, 187, 2, 5, 541);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (354, 50, 4, 38, 424);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (355, 237, 2, 322, 760);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (356, 401, 3, 286, 763);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (358, 213, 1, 247, 413);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (359, 269, 3, 400, 509);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (360, 379, 2, 217, 755);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (362, 313, 3, 327, 728);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (515, 338, 242, 255, 806);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (364, 332, 2, 295, 695);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (366, 123, 3, 336, 614);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (367, 86, 1, 187, 424);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (368, 168, 3, 360, 433);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (370, 60, 4, 319, 517);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (371, 352, 3, 375, 740);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (372, 178, 3, 71, 782);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (374, 256, 1, 380, 731);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (375, 72, 1, 370, 805);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (376, 99, 2, 201, 409);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (377, 138, 2, 260, 763);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (378, 21, 4, 360, 491);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (379, 263, 3, 69, 643);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (380, 199, 1, 282, 650);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (381, 205, 4, 109, 528);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (382, 146, 3, 310, 586);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (383, 9, 3, 262, 561);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (384, 343, 3, 299, 642);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (385, 181, 3, 255, 803);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (386, 350, 1, 168, 693);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (517, 101, 107, 191, 469);
commit;
prompt 300 records committed...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (388, 276, 3, 364, 815);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (389, 199, 2, 283, 673);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (390, 366, 3, 238, 667);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (518, 254, 60, 139, 529);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (392, 297, 3, 384, 661);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (519, 95, 378, 129, 654);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (394, 222, 2, 51, 515);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (395, 150, 3, 328, 493);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (396, 328, 4, 139, 475);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (397, 14, 3, 157, 536);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (398, 109, 1, 58, 809);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (399, 342, 2, 85, 573);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (400, 194, 4, 167, 440);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (401, 148, 16, 72, 562);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (402, 264, 44, 13, 409);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (403, 381, 397, 391, 744);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (404, 257, 18, 126, 622);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (405, 316, 302, 325, 462);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (406, 260, 73, 13, 825);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (407, 36, 387, 6, 1007);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (408, 384, 126, 159, 480);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (409, 54, 405, 32, 579);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (410, 232, 157, 164, 417);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (411, 83, 316, 17, 768);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (412, 198, 394, 101, 668);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (413, 88, 180, 111, 782);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (414, 10, 317, 366, 760);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (415, 217, 82, 208, 586);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (416, 44, 111, 46, 750);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (417, 353, 82, 95, 657);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (418, 353, 120, 267, 688);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (419, 327, 185, 132, 791);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (420, 100, 329, 381, 797);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (500, 85, 18, 242, 690);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (520, 295, 137, 5, 521);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (521, 96, 227, 148, 432);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (522, 196, 328, 343, 547);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (523, 330, 229, 68, 503);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (524, 329, 366, 123, 653);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (525, 7, 193, 367, 427);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (526, 330, 20, 140, 645);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (527, 284, 267, 397, 594);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (528, 27, 313, 175, 497);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (529, 321, 32, 363, 407);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (530, 35, 296, 333, 569);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (531, 403, 65, 193, 756);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (532, 196, 349, 80, 731);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (533, 262, 276, 158, 459);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (534, 275, 225, 231, 634);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (535, 203, 299, 394, 594);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (536, 7, 370, 222, 685);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (537, 174, 318, 157, 544);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (538, 27, 15, 352, 579);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (539, 147, 290, 30, 588);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (540, 95, 176, 110, 780);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (541, 184, 8, 210, 699);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (542, 361, 170, 273, 658);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (543, 331, 3, 143, 493);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (544, 361, 260, 269, 478);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (545, 38, 32, 295, 782);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (546, 331, 251, 123, 490);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (547, 147, 28, 19, 432);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (548, 180, 157, 97, 727);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (549, 295, 265, 392, 669);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (550, 180, 67, 54, 604);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (551, 184, 332, 303, 644);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (552, 112, 44, 163, 565);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (553, 130, 153, 357, 450);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (554, 127, 53, 110, 839);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (555, 330, 236, 30, 784);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (556, 331, 307, 58, 454);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (557, 275, 308, 200, 627);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (558, 157, 31, 106, 537);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (559, 395, 14, 150, 564);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (560, 113, 298, 291, 688);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (561, 397, 48, 361, 513);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (562, 373, 402, 304, 541);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (563, 301, 53, 161, 405);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (564, 325, 341, 141, 687);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (565, 339, 214, 374, 673);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (566, 195, 86, 79, 695);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (567, 180, 18, 4, 732);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (568, 101, 80, 363, 541);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (569, 24, 303, 354, 426);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (570, 157, 155, 218, 486);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (571, 394, 43, 345, 819);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (572, 322, 82, 225, 759);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (573, 38, 66, 68, 741);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (574, 383, 155, 365, 594);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (575, 329, 301, 14, 789);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (576, 281, 181, 220, 667);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (577, 68, 295, 14, 832);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (578, 359, 106, 108, 838);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (579, 301, 167, 339, 462);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (580, 147, 272, 318, 1079);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (581, 397, 362, 87, 607);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (582, 174, 72, 70, 825);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (583, 301, 220, 155, 445);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (584, 285, 281, 244, 660);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (585, 147, 220, 260, 412);
commit;
prompt 400 records committed...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (586, 296, 138, 160, 592);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (587, 305, 191, 137, 534);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (588, 373, 139, 160, 646);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (589, 361, 385, 53, 783);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (590, 317, 383, 257, 805);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (591, 4, 152, 237, 814);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (592, 244, 167, 136, 516);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (593, 125, 279, 24, 836);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (594, 203, 42, 84, 711);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (595, 385, 89, 372, 499);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (596, 7, 235, 25, 676);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (597, 186, 240, 24, 721);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (598, 67, 324, 298, 576);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (599, 244, 278, 298, 832);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (600, 361, 143, 139, 630);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (601, 195, 274, 288, 463);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (602, 112, 324, 333, 540);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (603, 176, 45, 291, 783);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (604, 317, 3, 322, 525);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (605, 270, 34, 90, 610);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (606, 295, 251, 306, 807);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (607, 24, 176, 210, 872);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (608, 117, 213, 222, 449);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (609, 340, 12, 47, 635);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (610, 133, 178, 73, 498);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (611, 2, 47, 184, 527);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (612, 245, 211, 379, 627);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (613, 369, 291, 373, 477);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (614, 270, 22, 324, 542);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (615, 369, 39, 76, 809);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (616, 127, 81, 80, 720);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (617, 174, 120, 348, 739);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (618, 239, 326, 21, 728);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (619, 251, 292, 171, 733);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (620, 139, 112, 59, 469);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (621, 233, 320, 215, 638);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (622, 155, 209, 325, 799);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (623, 170, 271, 235, 750);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (624, 271, 373, 353, 792);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (625, 51, 13, 246, 448);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (626, 31, 178, 14, 652);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (627, 319, 372, 202, 669);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (628, 275, 282, 170, 835);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (629, 301, 249, 207, 797);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (630, 12, 73, 215, 528);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (631, 275, 265, 45, 751);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (632, 184, 200, 195, 414);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (633, 27, 330, 44, 621);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (634, 394, 265, 227, 765);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (635, 120, 91, 55, 563);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (636, 32, 191, 33, 664);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (637, 325, 214, 161, 499);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (638, 305, 403, 232, 646);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (639, 331, 31, 311, 513);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (640, 274, 402, 106, 636);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (641, 113, 92, 76, 608);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (642, 338, 212, 356, 839);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (643, 24, 275, 147, 708);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (644, 385, 226, 314, 642);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (645, 7, 355, 323, 471);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (646, 340, 269, 140, 453);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (647, 385, 193, 50, 696);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (648, 31, 305, 313, 657);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (649, 326, 357, 300, 497);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (650, 68, 361, 31, 823);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (651, 259, 333, 319, 563);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (652, 38, 70, 196, 509);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (653, 2, 8, 165, 834);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (654, 270, 268, 42, 770);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (655, 278, 368, 131, 678);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (656, 95, 152, 369, 530);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (657, 266, 159, 305, 663);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (658, 47, 146, 27, 839);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (659, 170, 290, 243, 545);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (660, 133, 327, 208, 401);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (661, 329, 138, 401, 645);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (662, 173, 93, 371, 798);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (663, 196, 381, 38, 795);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (664, 209, 298, 362, 706);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (665, 68, 163, 113, 420);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (666, 295, 126, 237, 736);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (667, 219, 381, 229, 687);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (668, 387, 84, 200, 413);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (669, 139, 94, 162, 601);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (670, 284, 152, 278, 810);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (671, 139, 268, 301, 551);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (672, 101, 391, 110, 689);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (673, 184, 227, 185, 720);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (674, 101, 355, 81, 541);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (675, 81, 238, 9, 637);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (676, 259, 160, 159, 583);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (677, 112, 43, 225, 783);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (678, 319, 352, 62, 808);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (680, 303, 187, 372, 832);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (681, 203, 217, 202, 555);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (682, 359, 390, 126, 453);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (684, 125, 264, 201, 453);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (685, 38, 156, 188, 665);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (686, 331, 100, 352, 517);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (688, 383, 363, 16, 540);
commit;
prompt 500 records committed...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (689, 339, 4, 284, 552);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (690, 24, 96, 55, 982);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (692, 321, 213, 172, 414);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (693, 71, 208, 84, 458);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (694, 301, 329, 91, 738);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (695, 233, 218, 263, 819);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (697, 191, 277, 174, 729);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (698, 32, 56, 297, 479);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (699, 340, 301, 188, 788);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (701, 340, 383, 382, 659);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (702, 165, 256, 177, 651);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (704, 339, 227, 66, 522);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (705, 262, 110, 55, 491);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (706, 170, 352, 397, 525);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (708, 184, 264, 352, 588);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (709, 403, 62, 368, 706);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (710, 195, 219, 223, 508);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (711, 174, 271, 90, 708);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (713, 236, 205, 140, 432);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (714, 301, 158, 237, 539);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (715, 385, 223, 83, 784);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (717, 24, 254, 170, 775);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (718, 267, 56, 177, 738);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (719, 125, 77, 358, 831);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (721, 284, 51, 269, 533);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (722, 339, 177, 34, 701);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (723, 81, 236, 85, 639);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (724, 91, 192, 97, 558);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (726, 254, 321, 323, 598);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (727, 266, 178, 298, 679);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (728, 278, 403, 359, 661);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (730, 320, 206, 341, 467);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (731, 68, 52, 121, 497);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (732, 184, 391, 22, 643);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (734, 329, 254, 64, 416);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (735, 191, 252, 288, 710);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (736, 275, 364, 212, 495);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (738, 330, 351, 21, 817);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (739, 320, 167, 178, 508);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (740, 24, 383, 119, 792);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (741, 38, 307, 228, 435);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (743, 271, 190, 126, 545);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (744, 387, 339, 103, 647);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (745, 319, 12, 199, 544);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (747, 394, 67, 73, 440);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (748, 251, 332, 355, 602);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (749, 157, 197, 397, 457);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (750, 32, 83, 58, 784);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (752, 68, 243, 367, 577);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (753, 369, 400, 347, 573);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (754, 338, 132, 300, 426);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (756, 233, 107, 18, 520);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (757, 139, 63, 282, 750);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (758, 186, 15, 391, 625);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (760, 281, 98, 259, 598);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (761, 8, 120, 212, 497);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (762, 18, 317, 302, 724);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (763, 320, 240, 214, 792);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (765, 71, 141, 200, 521);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (766, 120, 94, 75, 806);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (768, 164, 37, 380, 522);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (769, 236, 325, 231, 676);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (770, 319, 95, 103, 541);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (771, 322, 128, 49, 612);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (773, 320, 267, 95, 611);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (774, 281, 304, 192, 737);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (775, 139, 24, 151, 676);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (777, 233, 144, 60, 412);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (778, 242, 316, 244, 835);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (779, 295, 243, 113, 498);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (780, 191, 302, 170, 631);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (781, 338, 286, 348, 803);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (782, 387, 127, 132, 456);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (783, 373, 66, 387, 572);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (784, 274, 6, 331, 429);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (785, 275, 337, 196, 642);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (786, 18, 109, 384, 494);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (787, 176, 308, 177, 531);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (788, 8, 211, 376, 439);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (789, 242, 45, 158, 717);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (790, 326, 169, 28, 621);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (791, 321, 48, 142, 681);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (792, 51, 26, 4, 691);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (793, 113, 46, 360, 793);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (794, 18, 133, 114, 826);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (795, 236, 253, 248, 407);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (796, 274, 88, 65, 511);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (797, 239, 213, 373, 710);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (798, 91, 126, 347, 720);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (799, 339, 104, 45, 617);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (800, 301, 105, 402, 513);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (801, 38, 42, 303, 579);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (802, 317, 140, 171, 623);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (803, 387, 216, 160, 786);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (804, 38, 43, 134, 551);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (805, 231, 245, 255, 529);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (806, 176, 8, 271, 417);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (807, 325, 176, 149, 509);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (808, 340, 104, 361, 810);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (809, 397, 293, 212, 454);
commit;
prompt 600 records committed...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (810, 281, 193, 7, 644);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (811, 209, 142, 389, 590);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (812, 133, 292, 396, 662);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (813, 281, 11, 311, 659);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (814, 219, 135, 129, 451);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (815, 173, 6, 338, 546);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (816, 8, 392, 66, 651);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (817, 251, 366, 308, 708);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (818, 81, 259, 217, 482);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (819, 229, 181, 23, 602);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (820, 229, 346, 394, 451);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (821, 397, 195, 270, 522);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (822, 262, 323, 178, 833);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (823, 359, 358, 323, 535);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (824, 233, 232, 237, 401);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (825, 81, 239, 32, 572);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (826, 296, 209, 116, 798);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (827, 24, 290, 4, 772);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (828, 157, 233, 207, 820);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (829, 275, 275, 298, 729);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (830, 71, 298, 204, 408);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (831, 155, 176, 50, 791);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (832, 81, 212, 111, 832);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (833, 127, 306, 72, 463);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (834, 330, 229, 159, 636);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (835, 71, 227, 295, 662);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (836, 7, 86, 46, 829);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (837, 317, 136, 187, 831);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (838, 195, 92, 325, 440);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (839, 165, 237, 105, 797);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (840, 117, 214, 269, 410);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (841, 244, 151, 337, 637);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (842, 270, 404, 331, 560);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (843, 68, 367, 280, 797);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (844, 259, 147, 259, 833);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (845, 361, 78, 168, 666);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (846, 254, 51, 185, 569);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (847, 157, 310, 91, 547);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (848, 244, 230, 213, 707);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (849, 274, 179, 364, 739);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (850, 245, 323, 140, 413);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (851, 331, 76, 391, 415);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (852, 395, 359, 108, 692);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (900, 43, 71, 375, 512);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (901, 268, 213, 339, 723);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (902, 273, 171, 275, 481);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (903, 273, 325, 352, 784);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (904, 273, 386, 31, 806);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (905, 200, 86, 117, 661);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (906, 43, 218, 114, 837);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (907, 273, 383, 243, 753);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (908, 200, 227, 169, 721);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (909, 43, 57, 363, 484);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (910, 43, 116, 351, 640);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (911, 268, 293, 395, 801);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (912, 273, 144, 263, 563);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (913, 43, 6, 193, 515);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (914, 141, 223, 55, 413);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (245, 118, 3, 351, 623);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (255, 192, 4, 275, 568);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (261, 94, 2, 333, 420);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (264, 177, 2, 86, 577);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (269, 399, 1, 226, 677);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (277, 159, 2, 257, 582);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (282, 134, 2, 203, 779);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (288, 378, 2, 36, 575);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (294, 341, 1, 371, 613);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (300, 143, 1, 300, 515);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (304, 42, 4, 214, 707);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (309, 220, 4, 10, 435);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (314, 20, 1, 188, 697);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (320, 160, 3, 22, 774);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (324, 248, 4, 65, 606);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (328, 308, 3, 186, 770);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (512, 303, 401, 131, 418);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (336, 213, 4, 210, 484);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (340, 226, 4, 36, 691);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (344, 292, 2, 343, 724);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (513, 35, 340, 401, 516);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (353, 247, 4, 288, 765);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (357, 323, 1, 234, 656);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (361, 97, 3, 355, 695);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (365, 58, 1, 205, 749);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (516, 271, 22, 85, 569);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (373, 144, 1, 103, 466);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (679, 369, 271, 60, 410);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (683, 267, 108, 363, 553);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (687, 266, 34, 312, 453);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (691, 267, 43, 277, 658);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (696, 403, 79, 68, 518);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (700, 24, 337, 50, 811);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (703, 32, 72, 163, 814);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (707, 7, 135, 362, 866);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (712, 325, 183, 88, 708);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (716, 395, 133, 107, 438);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (720, 395, 242, 341, 735);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (725, 155, 353, 353, 429);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (729, 2, 366, 314, 615);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (733, 155, 162, 298, 418);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (737, 186, 246, 177, 786);
commit;
prompt 700 records committed...
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (742, 113, 221, 356, 701);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (746, 24, 219, 298, 659);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (751, 245, 89, 253, 769);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (755, 18, 258, 260, 570);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (759, 394, 257, 128, 681);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (764, 12, 89, 150, 498);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (767, 147, 399, 253, 542);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (772, 305, 361, 305, 435);
insert into ACTIVITY (activityid, actionid, accountid, workerid, customer_id)
values (776, 251, 296, 250, 560);
commit;
prompt 709 records loaded
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
values (35, 'Water Park', 'GA-8LD533 IntelÂ®845GL Chipset VC/SC/Lan.', '9:30 AM - 7:30 PM', 111);
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
values (110, 'Universal Studio', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 IntelÂ®845E Chipset.', '11:00 AM - 7:00 PM', 109);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (111, 'Museum', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.', '10:00 AM - 9:00 PM', 209);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (112, 'Water Park', 'AMD XP 2000+ Box/with AMD Fan', '8:00 AM - 4:00 PM', 80);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (113, 'Beach', 'LG 32x10x40 and 16x CD-RW/DVD OEM', '10:00 AM - 7:00 PM', 297);
insert into ATTRACTIONS (attraction_id, attraction_name, description, opening_hours, location_id)
values (114, 'Amusement Park', 'GA-8LD533 IntelÂ®845GL Chipset VC/SC/Lan.', '10:00 AM - 7:00 PM', 369);
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
values (144, 'Art Gallery', 'GA-8LD533 IntelÂ®845GL Chipset VC/SC/Lan.', '8:00 AM - 5:00 PM', 89);
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
values (217, 'Public Garden', 'Gigabyte GA-7VAC SKT A AMDÂ® DDR400 / KT333.', '10:00 AM - 6:00 PM', 211);
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
values (373, 'National Park', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 IntelÂ®845E Chipset.', '9:00 AM - 6:00 PM', 275);
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
values (388, 'Beach', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 IntelÂ®845E Chipset.', '8:30 AM - 5:00 PM', 240);
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
prompt Loading LOAN...
insert into LOAN (loanid, numofpaymet, loansum)
values (1, 12, 600000);
insert into LOAN (loanid, numofpaymet, loansum)
values (2, 8, 108788);
insert into LOAN (loanid, numofpaymet, loansum)
values (3, 5, 816539);
insert into LOAN (loanid, numofpaymet, loansum)
values (4, 12, 25098);
insert into LOAN (loanid, numofpaymet, loansum)
values (5, 10, 335247);
insert into LOAN (loanid, numofpaymet, loansum)
values (6, 3, 727511);
insert into LOAN (loanid, numofpaymet, loansum)
values (7, 9, 439305);
insert into LOAN (loanid, numofpaymet, loansum)
values (8, 8, 484944);
insert into LOAN (loanid, numofpaymet, loansum)
values (9, 3, 99943);
insert into LOAN (loanid, numofpaymet, loansum)
values (10, 11, 814048);
insert into LOAN (loanid, numofpaymet, loansum)
values (11, 9, 849398);
insert into LOAN (loanid, numofpaymet, loansum)
values (12, 11, 550016);
insert into LOAN (loanid, numofpaymet, loansum)
values (13, 9, 783928);
insert into LOAN (loanid, numofpaymet, loansum)
values (14, 3, 142518);
insert into LOAN (loanid, numofpaymet, loansum)
values (15, 10, 438728);
insert into LOAN (loanid, numofpaymet, loansum)
values (16, 11, 52266);
insert into LOAN (loanid, numofpaymet, loansum)
values (17, 1, 39648);
insert into LOAN (loanid, numofpaymet, loansum)
values (18, 6, 350472);
insert into LOAN (loanid, numofpaymet, loansum)
values (19, 7, 853338);
insert into LOAN (loanid, numofpaymet, loansum)
values (20, 7, 881222);
insert into LOAN (loanid, numofpaymet, loansum)
values (21, 6, 630224);
insert into LOAN (loanid, numofpaymet, loansum)
values (22, 3, 597531);
insert into LOAN (loanid, numofpaymet, loansum)
values (23, 4, 357458);
insert into LOAN (loanid, numofpaymet, loansum)
values (24, 6, 925590);
insert into LOAN (loanid, numofpaymet, loansum)
values (25, 2, 827721);
insert into LOAN (loanid, numofpaymet, loansum)
values (26, 1, 279470);
insert into LOAN (loanid, numofpaymet, loansum)
values (27, 7, 746517);
insert into LOAN (loanid, numofpaymet, loansum)
values (28, 4, 65310);
insert into LOAN (loanid, numofpaymet, loansum)
values (29, 4, 358377);
insert into LOAN (loanid, numofpaymet, loansum)
values (30, 6, 805736);
insert into LOAN (loanid, numofpaymet, loansum)
values (31, 2, 836074);
insert into LOAN (loanid, numofpaymet, loansum)
values (32, 6, 232042);
insert into LOAN (loanid, numofpaymet, loansum)
values (33, 9, 915766);
insert into LOAN (loanid, numofpaymet, loansum)
values (34, 4, 446398);
insert into LOAN (loanid, numofpaymet, loansum)
values (35, 1, 502701);
insert into LOAN (loanid, numofpaymet, loansum)
values (36, 5, 537085);
insert into LOAN (loanid, numofpaymet, loansum)
values (37, 10, 242878);
insert into LOAN (loanid, numofpaymet, loansum)
values (38, 3, 230545);
insert into LOAN (loanid, numofpaymet, loansum)
values (39, 3, 291793);
insert into LOAN (loanid, numofpaymet, loansum)
values (40, 3, 453743);
insert into LOAN (loanid, numofpaymet, loansum)
values (41, 1, 762172);
insert into LOAN (loanid, numofpaymet, loansum)
values (42, 11, 916116);
insert into LOAN (loanid, numofpaymet, loansum)
values (43, 4, 588326);
insert into LOAN (loanid, numofpaymet, loansum)
values (44, 12, 65122);
insert into LOAN (loanid, numofpaymet, loansum)
values (45, 12, 785529);
insert into LOAN (loanid, numofpaymet, loansum)
values (46, 10, 22160);
insert into LOAN (loanid, numofpaymet, loansum)
values (47, 9, 350538);
insert into LOAN (loanid, numofpaymet, loansum)
values (48, 11, 374366);
insert into LOAN (loanid, numofpaymet, loansum)
values (49, 10, 272171);
insert into LOAN (loanid, numofpaymet, loansum)
values (50, 7, 911554);
insert into LOAN (loanid, numofpaymet, loansum)
values (51, 5, 401563);
insert into LOAN (loanid, numofpaymet, loansum)
values (52, 6, 680332);
insert into LOAN (loanid, numofpaymet, loansum)
values (53, 3, 155504);
insert into LOAN (loanid, numofpaymet, loansum)
values (54, 12, 957133);
insert into LOAN (loanid, numofpaymet, loansum)
values (55, 2, 289992);
insert into LOAN (loanid, numofpaymet, loansum)
values (56, 1, 11698);
insert into LOAN (loanid, numofpaymet, loansum)
values (57, 10, 233899);
insert into LOAN (loanid, numofpaymet, loansum)
values (58, 10, 749275);
insert into LOAN (loanid, numofpaymet, loansum)
values (59, 12, 707378);
insert into LOAN (loanid, numofpaymet, loansum)
values (60, 6, 621522);
insert into LOAN (loanid, numofpaymet, loansum)
values (61, 1, 620417);
insert into LOAN (loanid, numofpaymet, loansum)
values (62, 11, 378924);
insert into LOAN (loanid, numofpaymet, loansum)
values (63, 6, 473670);
insert into LOAN (loanid, numofpaymet, loansum)
values (64, 7, 555211);
insert into LOAN (loanid, numofpaymet, loansum)
values (65, 8, 757461);
insert into LOAN (loanid, numofpaymet, loansum)
values (66, 5, 778037);
insert into LOAN (loanid, numofpaymet, loansum)
values (67, 8, 78594);
insert into LOAN (loanid, numofpaymet, loansum)
values (68, 5, 266960);
insert into LOAN (loanid, numofpaymet, loansum)
values (69, 5, 991378);
insert into LOAN (loanid, numofpaymet, loansum)
values (70, 6, 127477);
insert into LOAN (loanid, numofpaymet, loansum)
values (71, 7, 789972);
insert into LOAN (loanid, numofpaymet, loansum)
values (72, 1, 307610);
insert into LOAN (loanid, numofpaymet, loansum)
values (73, 8, 712989);
insert into LOAN (loanid, numofpaymet, loansum)
values (74, 2, 317351);
insert into LOAN (loanid, numofpaymet, loansum)
values (75, 1, 327959);
insert into LOAN (loanid, numofpaymet, loansum)
values (76, 10, 73939);
insert into LOAN (loanid, numofpaymet, loansum)
values (77, 12, 57060);
insert into LOAN (loanid, numofpaymet, loansum)
values (78, 7, 482768);
insert into LOAN (loanid, numofpaymet, loansum)
values (79, 3, 90252);
insert into LOAN (loanid, numofpaymet, loansum)
values (80, 10, 616410);
insert into LOAN (loanid, numofpaymet, loansum)
values (81, 3, 165711);
insert into LOAN (loanid, numofpaymet, loansum)
values (82, 8, 592051);
insert into LOAN (loanid, numofpaymet, loansum)
values (83, 5, 951201);
insert into LOAN (loanid, numofpaymet, loansum)
values (84, 12, 516334);
insert into LOAN (loanid, numofpaymet, loansum)
values (85, 3, 17761);
insert into LOAN (loanid, numofpaymet, loansum)
values (86, 12, 102376);
insert into LOAN (loanid, numofpaymet, loansum)
values (87, 3, 621881);
insert into LOAN (loanid, numofpaymet, loansum)
values (88, 2, 816490);
insert into LOAN (loanid, numofpaymet, loansum)
values (89, 11, 813011);
insert into LOAN (loanid, numofpaymet, loansum)
values (90, 10, 673853);
insert into LOAN (loanid, numofpaymet, loansum)
values (91, 10, 563093);
insert into LOAN (loanid, numofpaymet, loansum)
values (92, 6, 24166);
insert into LOAN (loanid, numofpaymet, loansum)
values (93, 8, 928465);
insert into LOAN (loanid, numofpaymet, loansum)
values (94, 11, 954044);
insert into LOAN (loanid, numofpaymet, loansum)
values (95, 12, 473303);
insert into LOAN (loanid, numofpaymet, loansum)
values (96, 9, 165656);
insert into LOAN (loanid, numofpaymet, loansum)
values (97, 7, 427487);
insert into LOAN (loanid, numofpaymet, loansum)
values (98, 10, 415915);
insert into LOAN (loanid, numofpaymet, loansum)
values (99, 9, 331519);
insert into LOAN (loanid, numofpaymet, loansum)
values (100, 10, 915172);
commit;
prompt 100 records committed...
insert into LOAN (loanid, numofpaymet, loansum)
values (101, 1, 136901);
insert into LOAN (loanid, numofpaymet, loansum)
values (102, 10, 261235);
insert into LOAN (loanid, numofpaymet, loansum)
values (103, 12, 5104);
insert into LOAN (loanid, numofpaymet, loansum)
values (104, 5, 779210);
insert into LOAN (loanid, numofpaymet, loansum)
values (105, 7, 287020);
insert into LOAN (loanid, numofpaymet, loansum)
values (106, 6, 390402);
insert into LOAN (loanid, numofpaymet, loansum)
values (107, 12, 418533);
insert into LOAN (loanid, numofpaymet, loansum)
values (108, 4, 341352);
insert into LOAN (loanid, numofpaymet, loansum)
values (109, 4, 712617);
insert into LOAN (loanid, numofpaymet, loansum)
values (110, 1, 430709);
insert into LOAN (loanid, numofpaymet, loansum)
values (111, 10, 289074);
insert into LOAN (loanid, numofpaymet, loansum)
values (112, 8, 574501);
insert into LOAN (loanid, numofpaymet, loansum)
values (113, 4, 616834);
insert into LOAN (loanid, numofpaymet, loansum)
values (114, 2, 827052);
insert into LOAN (loanid, numofpaymet, loansum)
values (115, 7, 417423);
insert into LOAN (loanid, numofpaymet, loansum)
values (116, 8, 216551);
insert into LOAN (loanid, numofpaymet, loansum)
values (117, 5, 895029);
insert into LOAN (loanid, numofpaymet, loansum)
values (118, 7, 998070);
insert into LOAN (loanid, numofpaymet, loansum)
values (119, 7, 548264);
insert into LOAN (loanid, numofpaymet, loansum)
values (120, 9, 201501);
insert into LOAN (loanid, numofpaymet, loansum)
values (121, 9, 27555);
insert into LOAN (loanid, numofpaymet, loansum)
values (122, 5, 551729);
insert into LOAN (loanid, numofpaymet, loansum)
values (123, 9, 788772);
insert into LOAN (loanid, numofpaymet, loansum)
values (124, 9, 161005);
insert into LOAN (loanid, numofpaymet, loansum)
values (125, 8, 524491);
insert into LOAN (loanid, numofpaymet, loansum)
values (126, 7, 563336);
insert into LOAN (loanid, numofpaymet, loansum)
values (127, 9, 592053);
insert into LOAN (loanid, numofpaymet, loansum)
values (128, 9, 982357);
insert into LOAN (loanid, numofpaymet, loansum)
values (129, 1, 947284);
insert into LOAN (loanid, numofpaymet, loansum)
values (130, 8, 919996);
insert into LOAN (loanid, numofpaymet, loansum)
values (131, 3, 300521);
insert into LOAN (loanid, numofpaymet, loansum)
values (132, 11, 435913);
insert into LOAN (loanid, numofpaymet, loansum)
values (133, 5, 480357);
insert into LOAN (loanid, numofpaymet, loansum)
values (134, 2, 724502);
insert into LOAN (loanid, numofpaymet, loansum)
values (135, 11, 254211);
insert into LOAN (loanid, numofpaymet, loansum)
values (136, 12, 852957);
insert into LOAN (loanid, numofpaymet, loansum)
values (137, 11, 68641);
insert into LOAN (loanid, numofpaymet, loansum)
values (138, 9, 759671);
insert into LOAN (loanid, numofpaymet, loansum)
values (139, 1, 461033);
insert into LOAN (loanid, numofpaymet, loansum)
values (140, 5, 881994);
insert into LOAN (loanid, numofpaymet, loansum)
values (141, 4, 121042);
insert into LOAN (loanid, numofpaymet, loansum)
values (142, 1, 21101);
insert into LOAN (loanid, numofpaymet, loansum)
values (143, 2, 828960);
insert into LOAN (loanid, numofpaymet, loansum)
values (144, 12, 294493);
insert into LOAN (loanid, numofpaymet, loansum)
values (145, 3, 773851);
insert into LOAN (loanid, numofpaymet, loansum)
values (146, 11, 304390);
insert into LOAN (loanid, numofpaymet, loansum)
values (147, 7, 961154);
insert into LOAN (loanid, numofpaymet, loansum)
values (148, 4, 857054);
insert into LOAN (loanid, numofpaymet, loansum)
values (149, 4, 718087);
insert into LOAN (loanid, numofpaymet, loansum)
values (150, 6, 864768);
insert into LOAN (loanid, numofpaymet, loansum)
values (151, 1, 513034);
insert into LOAN (loanid, numofpaymet, loansum)
values (152, 11, 273024);
insert into LOAN (loanid, numofpaymet, loansum)
values (153, 9, 584786);
insert into LOAN (loanid, numofpaymet, loansum)
values (154, 2, 132176);
insert into LOAN (loanid, numofpaymet, loansum)
values (155, 6, 111275);
insert into LOAN (loanid, numofpaymet, loansum)
values (156, 9, 172546);
insert into LOAN (loanid, numofpaymet, loansum)
values (157, 8, 898216);
insert into LOAN (loanid, numofpaymet, loansum)
values (158, 5, 485795);
insert into LOAN (loanid, numofpaymet, loansum)
values (159, 3, 836749);
insert into LOAN (loanid, numofpaymet, loansum)
values (160, 7, 179039);
insert into LOAN (loanid, numofpaymet, loansum)
values (161, 1, 591038);
insert into LOAN (loanid, numofpaymet, loansum)
values (162, 3, 103990);
insert into LOAN (loanid, numofpaymet, loansum)
values (163, 1, 273398);
insert into LOAN (loanid, numofpaymet, loansum)
values (164, 2, 30132);
insert into LOAN (loanid, numofpaymet, loansum)
values (165, 8, 77401);
insert into LOAN (loanid, numofpaymet, loansum)
values (166, 9, 860708);
insert into LOAN (loanid, numofpaymet, loansum)
values (167, 1, 108056);
insert into LOAN (loanid, numofpaymet, loansum)
values (168, 6, 762016);
insert into LOAN (loanid, numofpaymet, loansum)
values (169, 8, 891980);
insert into LOAN (loanid, numofpaymet, loansum)
values (170, 1, 300303);
insert into LOAN (loanid, numofpaymet, loansum)
values (171, 10, 306193);
insert into LOAN (loanid, numofpaymet, loansum)
values (172, 5, 961249);
insert into LOAN (loanid, numofpaymet, loansum)
values (173, 2, 895934);
insert into LOAN (loanid, numofpaymet, loansum)
values (174, 8, 657814);
insert into LOAN (loanid, numofpaymet, loansum)
values (175, 5, 842611);
insert into LOAN (loanid, numofpaymet, loansum)
values (176, 5, 71986);
insert into LOAN (loanid, numofpaymet, loansum)
values (177, 7, 34826);
insert into LOAN (loanid, numofpaymet, loansum)
values (178, 9, 958657);
insert into LOAN (loanid, numofpaymet, loansum)
values (179, 11, 997066);
insert into LOAN (loanid, numofpaymet, loansum)
values (180, 1, 766664);
insert into LOAN (loanid, numofpaymet, loansum)
values (181, 6, 664470);
insert into LOAN (loanid, numofpaymet, loansum)
values (182, 6, 169775);
insert into LOAN (loanid, numofpaymet, loansum)
values (183, 2, 210833);
insert into LOAN (loanid, numofpaymet, loansum)
values (184, 4, 390099);
insert into LOAN (loanid, numofpaymet, loansum)
values (185, 11, 446700);
insert into LOAN (loanid, numofpaymet, loansum)
values (186, 9, 413220);
insert into LOAN (loanid, numofpaymet, loansum)
values (187, 11, 504214);
insert into LOAN (loanid, numofpaymet, loansum)
values (188, 6, 448047);
insert into LOAN (loanid, numofpaymet, loansum)
values (189, 9, 792108);
insert into LOAN (loanid, numofpaymet, loansum)
values (190, 1, 252164);
insert into LOAN (loanid, numofpaymet, loansum)
values (191, 1, 464970);
insert into LOAN (loanid, numofpaymet, loansum)
values (192, 6, 174182);
insert into LOAN (loanid, numofpaymet, loansum)
values (193, 8, 879689);
insert into LOAN (loanid, numofpaymet, loansum)
values (194, 3, 27360);
insert into LOAN (loanid, numofpaymet, loansum)
values (195, 8, 787700);
insert into LOAN (loanid, numofpaymet, loansum)
values (196, 2, 149525);
insert into LOAN (loanid, numofpaymet, loansum)
values (197, 12, 230443);
insert into LOAN (loanid, numofpaymet, loansum)
values (198, 2, 263032);
insert into LOAN (loanid, numofpaymet, loansum)
values (199, 6, 385157);
insert into LOAN (loanid, numofpaymet, loansum)
values (200, 1, 989304);
commit;
prompt 200 records committed...
insert into LOAN (loanid, numofpaymet, loansum)
values (201, 5, 843910);
insert into LOAN (loanid, numofpaymet, loansum)
values (202, 12, 135202);
insert into LOAN (loanid, numofpaymet, loansum)
values (203, 10, 54500);
insert into LOAN (loanid, numofpaymet, loansum)
values (204, 9, 94248);
insert into LOAN (loanid, numofpaymet, loansum)
values (205, 6, 905633);
insert into LOAN (loanid, numofpaymet, loansum)
values (206, 3, 997464);
insert into LOAN (loanid, numofpaymet, loansum)
values (207, 10, 711484);
insert into LOAN (loanid, numofpaymet, loansum)
values (208, 10, 452335);
insert into LOAN (loanid, numofpaymet, loansum)
values (209, 11, 45574);
insert into LOAN (loanid, numofpaymet, loansum)
values (210, 1, 978186);
insert into LOAN (loanid, numofpaymet, loansum)
values (211, 7, 188580);
insert into LOAN (loanid, numofpaymet, loansum)
values (212, 2, 521952);
insert into LOAN (loanid, numofpaymet, loansum)
values (213, 9, 163458);
insert into LOAN (loanid, numofpaymet, loansum)
values (214, 9, 629149);
insert into LOAN (loanid, numofpaymet, loansum)
values (215, 5, 585053);
insert into LOAN (loanid, numofpaymet, loansum)
values (216, 6, 161516);
insert into LOAN (loanid, numofpaymet, loansum)
values (217, 1, 822052);
insert into LOAN (loanid, numofpaymet, loansum)
values (218, 5, 644635);
insert into LOAN (loanid, numofpaymet, loansum)
values (219, 4, 194948);
insert into LOAN (loanid, numofpaymet, loansum)
values (220, 1, 627518);
insert into LOAN (loanid, numofpaymet, loansum)
values (221, 12, 197388);
insert into LOAN (loanid, numofpaymet, loansum)
values (222, 8, 641938);
insert into LOAN (loanid, numofpaymet, loansum)
values (223, 2, 982045);
insert into LOAN (loanid, numofpaymet, loansum)
values (224, 2, 639013);
insert into LOAN (loanid, numofpaymet, loansum)
values (225, 1, 586924);
insert into LOAN (loanid, numofpaymet, loansum)
values (226, 6, 2319);
insert into LOAN (loanid, numofpaymet, loansum)
values (227, 6, 632722);
insert into LOAN (loanid, numofpaymet, loansum)
values (228, 12, 496539);
insert into LOAN (loanid, numofpaymet, loansum)
values (229, 10, 493638);
insert into LOAN (loanid, numofpaymet, loansum)
values (230, 3, 772407);
insert into LOAN (loanid, numofpaymet, loansum)
values (231, 4, 155780);
insert into LOAN (loanid, numofpaymet, loansum)
values (232, 2, 269484);
insert into LOAN (loanid, numofpaymet, loansum)
values (233, 8, 259057);
insert into LOAN (loanid, numofpaymet, loansum)
values (234, 2, 638015);
insert into LOAN (loanid, numofpaymet, loansum)
values (235, 11, 56189);
insert into LOAN (loanid, numofpaymet, loansum)
values (236, 2, 43879);
insert into LOAN (loanid, numofpaymet, loansum)
values (237, 1, 266236);
insert into LOAN (loanid, numofpaymet, loansum)
values (238, 4, 945421);
insert into LOAN (loanid, numofpaymet, loansum)
values (239, 10, 67780);
insert into LOAN (loanid, numofpaymet, loansum)
values (240, 4, 232641);
insert into LOAN (loanid, numofpaymet, loansum)
values (241, 5, 703659);
insert into LOAN (loanid, numofpaymet, loansum)
values (242, 3, 799064);
insert into LOAN (loanid, numofpaymet, loansum)
values (243, 9, 446872);
insert into LOAN (loanid, numofpaymet, loansum)
values (244, 2, 949240);
insert into LOAN (loanid, numofpaymet, loansum)
values (245, 5, 892086);
insert into LOAN (loanid, numofpaymet, loansum)
values (246, 9, 212694);
insert into LOAN (loanid, numofpaymet, loansum)
values (247, 8, 830834);
insert into LOAN (loanid, numofpaymet, loansum)
values (248, 6, 444814);
insert into LOAN (loanid, numofpaymet, loansum)
values (249, 8, 172340);
insert into LOAN (loanid, numofpaymet, loansum)
values (250, 4, 325945);
insert into LOAN (loanid, numofpaymet, loansum)
values (251, 4, 657589);
insert into LOAN (loanid, numofpaymet, loansum)
values (252, 11, 600717);
insert into LOAN (loanid, numofpaymet, loansum)
values (253, 11, 354025);
insert into LOAN (loanid, numofpaymet, loansum)
values (254, 3, 686357);
insert into LOAN (loanid, numofpaymet, loansum)
values (255, 8, 147053);
insert into LOAN (loanid, numofpaymet, loansum)
values (256, 3, 495508);
insert into LOAN (loanid, numofpaymet, loansum)
values (257, 1, 734184);
insert into LOAN (loanid, numofpaymet, loansum)
values (258, 1, 589828);
insert into LOAN (loanid, numofpaymet, loansum)
values (259, 5, 845514);
insert into LOAN (loanid, numofpaymet, loansum)
values (260, 8, 24368);
insert into LOAN (loanid, numofpaymet, loansum)
values (261, 1, 670893);
insert into LOAN (loanid, numofpaymet, loansum)
values (262, 10, 483511);
insert into LOAN (loanid, numofpaymet, loansum)
values (263, 12, 737942);
insert into LOAN (loanid, numofpaymet, loansum)
values (264, 2, 583972);
insert into LOAN (loanid, numofpaymet, loansum)
values (265, 5, 720800);
insert into LOAN (loanid, numofpaymet, loansum)
values (266, 6, 434141);
insert into LOAN (loanid, numofpaymet, loansum)
values (267, 2, 911246);
insert into LOAN (loanid, numofpaymet, loansum)
values (268, 9, 824775);
insert into LOAN (loanid, numofpaymet, loansum)
values (269, 12, 342588);
insert into LOAN (loanid, numofpaymet, loansum)
values (270, 10, 656801);
insert into LOAN (loanid, numofpaymet, loansum)
values (271, 4, 791457);
insert into LOAN (loanid, numofpaymet, loansum)
values (272, 6, 457758);
insert into LOAN (loanid, numofpaymet, loansum)
values (273, 2, 158391);
insert into LOAN (loanid, numofpaymet, loansum)
values (274, 1, 108130);
insert into LOAN (loanid, numofpaymet, loansum)
values (275, 11, 935864);
insert into LOAN (loanid, numofpaymet, loansum)
values (276, 12, 127598);
insert into LOAN (loanid, numofpaymet, loansum)
values (277, 8, 781134);
insert into LOAN (loanid, numofpaymet, loansum)
values (278, 1, 136966);
insert into LOAN (loanid, numofpaymet, loansum)
values (279, 11, 393068);
insert into LOAN (loanid, numofpaymet, loansum)
values (280, 7, 349283);
insert into LOAN (loanid, numofpaymet, loansum)
values (281, 2, 205817);
insert into LOAN (loanid, numofpaymet, loansum)
values (282, 1, 205425);
insert into LOAN (loanid, numofpaymet, loansum)
values (283, 6, 618994);
insert into LOAN (loanid, numofpaymet, loansum)
values (284, 6, 507154);
insert into LOAN (loanid, numofpaymet, loansum)
values (285, 3, 753740);
insert into LOAN (loanid, numofpaymet, loansum)
values (286, 5, 665415);
insert into LOAN (loanid, numofpaymet, loansum)
values (287, 11, 963824);
insert into LOAN (loanid, numofpaymet, loansum)
values (288, 10, 913396);
insert into LOAN (loanid, numofpaymet, loansum)
values (289, 5, 594655);
insert into LOAN (loanid, numofpaymet, loansum)
values (290, 4, 602598);
insert into LOAN (loanid, numofpaymet, loansum)
values (291, 5, 714873);
insert into LOAN (loanid, numofpaymet, loansum)
values (292, 10, 932962);
insert into LOAN (loanid, numofpaymet, loansum)
values (293, 7, 815867);
insert into LOAN (loanid, numofpaymet, loansum)
values (294, 4, 737778);
insert into LOAN (loanid, numofpaymet, loansum)
values (295, 3, 702410);
insert into LOAN (loanid, numofpaymet, loansum)
values (296, 2, 167932);
insert into LOAN (loanid, numofpaymet, loansum)
values (297, 10, 66261);
insert into LOAN (loanid, numofpaymet, loansum)
values (298, 1, 396730);
insert into LOAN (loanid, numofpaymet, loansum)
values (299, 12, 472404);
insert into LOAN (loanid, numofpaymet, loansum)
values (300, 8, 703317);
commit;
prompt 300 records committed...
insert into LOAN (loanid, numofpaymet, loansum)
values (301, 8, 751283);
insert into LOAN (loanid, numofpaymet, loansum)
values (302, 9, 536473);
insert into LOAN (loanid, numofpaymet, loansum)
values (303, 4, 17216);
insert into LOAN (loanid, numofpaymet, loansum)
values (304, 10, 424286);
insert into LOAN (loanid, numofpaymet, loansum)
values (305, 8, 804836);
insert into LOAN (loanid, numofpaymet, loansum)
values (306, 7, 839970);
insert into LOAN (loanid, numofpaymet, loansum)
values (307, 8, 70226);
insert into LOAN (loanid, numofpaymet, loansum)
values (308, 7, 381849);
insert into LOAN (loanid, numofpaymet, loansum)
values (309, 4, 9134);
insert into LOAN (loanid, numofpaymet, loansum)
values (310, 8, 869272);
insert into LOAN (loanid, numofpaymet, loansum)
values (311, 8, 964398);
insert into LOAN (loanid, numofpaymet, loansum)
values (312, 3, 232964);
insert into LOAN (loanid, numofpaymet, loansum)
values (313, 4, 882484);
insert into LOAN (loanid, numofpaymet, loansum)
values (314, 5, 282099);
insert into LOAN (loanid, numofpaymet, loansum)
values (315, 11, 54776);
insert into LOAN (loanid, numofpaymet, loansum)
values (316, 11, 736086);
insert into LOAN (loanid, numofpaymet, loansum)
values (317, 10, 139002);
insert into LOAN (loanid, numofpaymet, loansum)
values (318, 9, 109856);
insert into LOAN (loanid, numofpaymet, loansum)
values (319, 8, 691935);
insert into LOAN (loanid, numofpaymet, loansum)
values (320, 2, 315153);
insert into LOAN (loanid, numofpaymet, loansum)
values (321, 3, 690278);
insert into LOAN (loanid, numofpaymet, loansum)
values (322, 12, 102092);
insert into LOAN (loanid, numofpaymet, loansum)
values (323, 10, 778346);
insert into LOAN (loanid, numofpaymet, loansum)
values (324, 12, 677014);
insert into LOAN (loanid, numofpaymet, loansum)
values (325, 9, 232965);
insert into LOAN (loanid, numofpaymet, loansum)
values (326, 3, 129386);
insert into LOAN (loanid, numofpaymet, loansum)
values (327, 1, 867699);
insert into LOAN (loanid, numofpaymet, loansum)
values (328, 1, 503282);
insert into LOAN (loanid, numofpaymet, loansum)
values (329, 4, 378320);
insert into LOAN (loanid, numofpaymet, loansum)
values (330, 6, 649683);
insert into LOAN (loanid, numofpaymet, loansum)
values (331, 1, 838150);
insert into LOAN (loanid, numofpaymet, loansum)
values (332, 5, 193641);
insert into LOAN (loanid, numofpaymet, loansum)
values (333, 6, 359666);
insert into LOAN (loanid, numofpaymet, loansum)
values (334, 5, 240056);
insert into LOAN (loanid, numofpaymet, loansum)
values (335, 1, 124512);
insert into LOAN (loanid, numofpaymet, loansum)
values (336, 4, 677580);
insert into LOAN (loanid, numofpaymet, loansum)
values (337, 8, 292807);
insert into LOAN (loanid, numofpaymet, loansum)
values (338, 10, 183921);
insert into LOAN (loanid, numofpaymet, loansum)
values (339, 11, 510385);
insert into LOAN (loanid, numofpaymet, loansum)
values (340, 4, 290564);
insert into LOAN (loanid, numofpaymet, loansum)
values (341, 2, 3370);
insert into LOAN (loanid, numofpaymet, loansum)
values (342, 7, 129666);
insert into LOAN (loanid, numofpaymet, loansum)
values (343, 5, 491214);
insert into LOAN (loanid, numofpaymet, loansum)
values (344, 1, 703647);
insert into LOAN (loanid, numofpaymet, loansum)
values (345, 4, 414090);
insert into LOAN (loanid, numofpaymet, loansum)
values (346, 6, 804742);
insert into LOAN (loanid, numofpaymet, loansum)
values (347, 10, 189295);
insert into LOAN (loanid, numofpaymet, loansum)
values (348, 1, 927523);
insert into LOAN (loanid, numofpaymet, loansum)
values (349, 11, 499030);
insert into LOAN (loanid, numofpaymet, loansum)
values (350, 2, 798174);
insert into LOAN (loanid, numofpaymet, loansum)
values (351, 9, 836718);
insert into LOAN (loanid, numofpaymet, loansum)
values (352, 10, 370009);
insert into LOAN (loanid, numofpaymet, loansum)
values (353, 11, 793739);
insert into LOAN (loanid, numofpaymet, loansum)
values (354, 11, 398522);
insert into LOAN (loanid, numofpaymet, loansum)
values (355, 4, 824233);
insert into LOAN (loanid, numofpaymet, loansum)
values (356, 2, 956971);
insert into LOAN (loanid, numofpaymet, loansum)
values (357, 1, 474346);
insert into LOAN (loanid, numofpaymet, loansum)
values (358, 4, 499267);
insert into LOAN (loanid, numofpaymet, loansum)
values (359, 9, 304077);
insert into LOAN (loanid, numofpaymet, loansum)
values (360, 4, 324683);
insert into LOAN (loanid, numofpaymet, loansum)
values (361, 7, 992601);
insert into LOAN (loanid, numofpaymet, loansum)
values (362, 3, 567647);
insert into LOAN (loanid, numofpaymet, loansum)
values (363, 3, 360719);
insert into LOAN (loanid, numofpaymet, loansum)
values (364, 11, 59630);
insert into LOAN (loanid, numofpaymet, loansum)
values (365, 5, 282832);
insert into LOAN (loanid, numofpaymet, loansum)
values (366, 6, 671919);
insert into LOAN (loanid, numofpaymet, loansum)
values (367, 1, 745551);
insert into LOAN (loanid, numofpaymet, loansum)
values (368, 1, 14741);
insert into LOAN (loanid, numofpaymet, loansum)
values (369, 2, 517868);
insert into LOAN (loanid, numofpaymet, loansum)
values (370, 6, 574070);
insert into LOAN (loanid, numofpaymet, loansum)
values (371, 12, 171511);
insert into LOAN (loanid, numofpaymet, loansum)
values (372, 9, 680063);
insert into LOAN (loanid, numofpaymet, loansum)
values (373, 5, 442874);
insert into LOAN (loanid, numofpaymet, loansum)
values (374, 3, 882954);
insert into LOAN (loanid, numofpaymet, loansum)
values (375, 1, 166658);
insert into LOAN (loanid, numofpaymet, loansum)
values (376, 2, 620872);
insert into LOAN (loanid, numofpaymet, loansum)
values (377, 4, 259138);
insert into LOAN (loanid, numofpaymet, loansum)
values (378, 6, 273877);
insert into LOAN (loanid, numofpaymet, loansum)
values (379, 9, 498662);
insert into LOAN (loanid, numofpaymet, loansum)
values (380, 6, 971224);
insert into LOAN (loanid, numofpaymet, loansum)
values (381, 11, 76794);
insert into LOAN (loanid, numofpaymet, loansum)
values (382, 1, 762611);
insert into LOAN (loanid, numofpaymet, loansum)
values (383, 4, 156249);
insert into LOAN (loanid, numofpaymet, loansum)
values (384, 7, 998940);
insert into LOAN (loanid, numofpaymet, loansum)
values (385, 1, 927477);
insert into LOAN (loanid, numofpaymet, loansum)
values (386, 1, 54848);
insert into LOAN (loanid, numofpaymet, loansum)
values (387, 7, 890580);
insert into LOAN (loanid, numofpaymet, loansum)
values (388, 7, 726030);
insert into LOAN (loanid, numofpaymet, loansum)
values (389, 3, 344917);
insert into LOAN (loanid, numofpaymet, loansum)
values (390, 6, 941102);
insert into LOAN (loanid, numofpaymet, loansum)
values (391, 7, 329560);
insert into LOAN (loanid, numofpaymet, loansum)
values (392, 7, 614553);
insert into LOAN (loanid, numofpaymet, loansum)
values (393, 6, 495479);
insert into LOAN (loanid, numofpaymet, loansum)
values (394, 5, 774022);
insert into LOAN (loanid, numofpaymet, loansum)
values (395, 7, 639097);
insert into LOAN (loanid, numofpaymet, loansum)
values (396, 11, 315919);
insert into LOAN (loanid, numofpaymet, loansum)
values (397, 6, 886626);
insert into LOAN (loanid, numofpaymet, loansum)
values (398, 9, 988178);
insert into LOAN (loanid, numofpaymet, loansum)
values (399, 1, 763284);
insert into LOAN (loanid, numofpaymet, loansum)
values (400, 7, 479623);
commit;
prompt 400 records loaded
prompt Loading LOANTOACCOUNT...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-09-2001', 'dd-mm-yyyy'), 1, 176, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-04-2004', 'dd-mm-yyyy'), 0, 175, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-04-1990', 'dd-mm-yyyy'), 0, 357, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-04-2022', 'dd-mm-yyyy'), 0, 1, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-10-2009', 'dd-mm-yyyy'), 0, 308, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-02-1983', 'dd-mm-yyyy'), 0, 149, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-05-2018', 'dd-mm-yyyy'), 0, 175, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-2003', 'dd-mm-yyyy'), 0, 15, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-09-2006', 'dd-mm-yyyy'), 1, 383, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-02-1992', 'dd-mm-yyyy'), 0, 369, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-08-1995', 'dd-mm-yyyy'), 1, 322, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-04-1976', 'dd-mm-yyyy'), 1, 1, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-07-1991', 'dd-mm-yyyy'), 0, 208, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-05-1988', 'dd-mm-yyyy'), 0, 184, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-03-2000', 'dd-mm-yyyy'), 1, 361, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-03-2013', 'dd-mm-yyyy'), 0, 173, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-07-1988', 'dd-mm-yyyy'), 1, 309, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-10-1992', 'dd-mm-yyyy'), 0, 116, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-03-2015', 'dd-mm-yyyy'), 0, 122, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-04-2000', 'dd-mm-yyyy'), 1, 203, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-08-1979', 'dd-mm-yyyy'), 0, 364, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-05-1976', 'dd-mm-yyyy'), 1, 32, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1979', 'dd-mm-yyyy'), 0, 275, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-01-2020', 'dd-mm-yyyy'), 0, 201, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-06-2011', 'dd-mm-yyyy'), 0, 178, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-12-2021', 'dd-mm-yyyy'), 1, 126, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-04-2005', 'dd-mm-yyyy'), 0, 106, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-02-2017', 'dd-mm-yyyy'), 0, 84, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-09-1971', 'dd-mm-yyyy'), 0, 262, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-07-1990', 'dd-mm-yyyy'), 0, 283, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-08-1988', 'dd-mm-yyyy'), 0, 94, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-10-2015', 'dd-mm-yyyy'), 1, 154, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-08-1970', 'dd-mm-yyyy'), 0, 5, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-03-2013', 'dd-mm-yyyy'), 1, 267, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-10-1991', 'dd-mm-yyyy'), 0, 81, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-07-2005', 'dd-mm-yyyy'), 1, 74, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-08-2007', 'dd-mm-yyyy'), 0, 248, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-07-1992', 'dd-mm-yyyy'), 1, 283, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-06-2019', 'dd-mm-yyyy'), 0, 252, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-06-1993', 'dd-mm-yyyy'), 1, 242, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-12-2022', 'dd-mm-yyyy'), 1, 263, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-1983', 'dd-mm-yyyy'), 0, 362, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-03-2015', 'dd-mm-yyyy'), 0, 108, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-02-2000', 'dd-mm-yyyy'), 1, 363, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-04-2004', 'dd-mm-yyyy'), 0, 324, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-1972', 'dd-mm-yyyy'), 1, 133, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 0, 240, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-2001', 'dd-mm-yyyy'), 0, 29, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-06-1979', 'dd-mm-yyyy'), 1, 193, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-08-2020', 'dd-mm-yyyy'), 0, 106, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-04-1981', 'dd-mm-yyyy'), 0, 93, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-11-1975', 'dd-mm-yyyy'), 0, 146, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-11-2003', 'dd-mm-yyyy'), 0, 291, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-12-2021', 'dd-mm-yyyy'), 0, 204, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-04-1980', 'dd-mm-yyyy'), 0, 39, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-11-1981', 'dd-mm-yyyy'), 0, 249, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-11-2018', 'dd-mm-yyyy'), 1, 295, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-10-2022', 'dd-mm-yyyy'), 0, 249, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-05-1985', 'dd-mm-yyyy'), 0, 165, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-06-1978', 'dd-mm-yyyy'), 1, 228, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-08-2023', 'dd-mm-yyyy'), 1, 372, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-08-1979', 'dd-mm-yyyy'), 1, 150, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-03-1973', 'dd-mm-yyyy'), 0, 2, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-05-1984', 'dd-mm-yyyy'), 0, 360, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-01-1996', 'dd-mm-yyyy'), 1, 168, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-07-1994', 'dd-mm-yyyy'), 1, 35, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-06-2000', 'dd-mm-yyyy'), 1, 341, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-10-1996', 'dd-mm-yyyy'), 1, 346, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-10-1994', 'dd-mm-yyyy'), 0, 326, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-01-1996', 'dd-mm-yyyy'), 1, 396, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-07-2007', 'dd-mm-yyyy'), 0, 242, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-08-2006', 'dd-mm-yyyy'), 1, 38, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-03-1984', 'dd-mm-yyyy'), 1, 150, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-09-1991', 'dd-mm-yyyy'), 0, 118, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-01-2017', 'dd-mm-yyyy'), 0, 309, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-12-1971', 'dd-mm-yyyy'), 0, 141, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-07-1974', 'dd-mm-yyyy'), 1, 59, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-09-1971', 'dd-mm-yyyy'), 0, 169, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-08-2012', 'dd-mm-yyyy'), 1, 123, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-06-2024', 'dd-mm-yyyy'), 1, 134, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-11-1990', 'dd-mm-yyyy'), 0, 339, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-11-2015', 'dd-mm-yyyy'), 1, 181, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-12-1990', 'dd-mm-yyyy'), 0, 17, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-01-1971', 'dd-mm-yyyy'), 1, 40, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-05-2014', 'dd-mm-yyyy'), 1, 116, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-10-2014', 'dd-mm-yyyy'), 1, 216, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-03-2013', 'dd-mm-yyyy'), 1, 54, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-05-2005', 'dd-mm-yyyy'), 1, 208, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-03-1979', 'dd-mm-yyyy'), 1, 333, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-05-1989', 'dd-mm-yyyy'), 1, 282, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-08-1988', 'dd-mm-yyyy'), 1, 325, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-03-2021', 'dd-mm-yyyy'), 1, 103, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-12-1981', 'dd-mm-yyyy'), 1, 390, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-12-1980', 'dd-mm-yyyy'), 0, 57, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-06-1995', 'dd-mm-yyyy'), 0, 262, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-12-2005', 'dd-mm-yyyy'), 1, 369, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-06-2024', 'dd-mm-yyyy'), 1, 101, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-08-1980', 'dd-mm-yyyy'), 1, 392, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-04-1977', 'dd-mm-yyyy'), 0, 319, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-06-1991', 'dd-mm-yyyy'), 1, 220, 3);
commit;
prompt 100 records committed...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-10-1991', 'dd-mm-yyyy'), 0, 288, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-07-2022', 'dd-mm-yyyy'), 0, 37, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-05-1986', 'dd-mm-yyyy'), 0, 133, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-11-2024', 'dd-mm-yyyy'), 0, 190, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-06-1991', 'dd-mm-yyyy'), 0, 215, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-09-1987', 'dd-mm-yyyy'), 1, 301, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-09-2014', 'dd-mm-yyyy'), 1, 193, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-10-1979', 'dd-mm-yyyy'), 1, 290, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-07-2017', 'dd-mm-yyyy'), 0, 247, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-05-1987', 'dd-mm-yyyy'), 0, 2, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-08-1971', 'dd-mm-yyyy'), 0, 355, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-08-2015', 'dd-mm-yyyy'), 0, 65, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-04-2008', 'dd-mm-yyyy'), 0, 386, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-05-2018', 'dd-mm-yyyy'), 0, 132, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-01-1982', 'dd-mm-yyyy'), 1, 261, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-11-1973', 'dd-mm-yyyy'), 1, 51, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-04-1997', 'dd-mm-yyyy'), 1, 335, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-02-1974', 'dd-mm-yyyy'), 0, 201, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-05-2022', 'dd-mm-yyyy'), 0, 47, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-09-2024', 'dd-mm-yyyy'), 1, 377, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-06-1983', 'dd-mm-yyyy'), 0, 119, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1987', 'dd-mm-yyyy'), 0, 109, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-10-1996', 'dd-mm-yyyy'), 1, 69, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-02-1988', 'dd-mm-yyyy'), 0, 351, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-04-2004', 'dd-mm-yyyy'), 1, 353, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-11-1981', 'dd-mm-yyyy'), 1, 178, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-06-2017', 'dd-mm-yyyy'), 0, 384, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-01-1978', 'dd-mm-yyyy'), 1, 126, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-12-2015', 'dd-mm-yyyy'), 1, 90, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-04-1986', 'dd-mm-yyyy'), 0, 296, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-04-2015', 'dd-mm-yyyy'), 0, 28, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-11-2015', 'dd-mm-yyyy'), 0, 205, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-03-2019', 'dd-mm-yyyy'), 1, 189, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-05-1983', 'dd-mm-yyyy'), 0, 89, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-08-2012', 'dd-mm-yyyy'), 1, 92, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-05-1993', 'dd-mm-yyyy'), 0, 309, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-08-1997', 'dd-mm-yyyy'), 0, 99, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-04-1985', 'dd-mm-yyyy'), 0, 177, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-1974', 'dd-mm-yyyy'), 1, 76, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-04-2009', 'dd-mm-yyyy'), 0, 355, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-10-1999', 'dd-mm-yyyy'), 1, 152, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-02-1982', 'dd-mm-yyyy'), 1, 321, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-12-2002', 'dd-mm-yyyy'), 1, 51, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-02-1992', 'dd-mm-yyyy'), 0, 53, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-2013', 'dd-mm-yyyy'), 1, 147, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-2017', 'dd-mm-yyyy'), 0, 393, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-11-2003', 'dd-mm-yyyy'), 0, 97, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-04-1997', 'dd-mm-yyyy'), 0, 274, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-2018', 'dd-mm-yyyy'), 0, 266, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-10-1985', 'dd-mm-yyyy'), 1, 249, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-06-1974', 'dd-mm-yyyy'), 1, 136, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-05-1996', 'dd-mm-yyyy'), 1, 250, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-01-1973', 'dd-mm-yyyy'), 1, 289, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-11-1980', 'dd-mm-yyyy'), 0, 381, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-09-1981', 'dd-mm-yyyy'), 0, 332, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-2015', 'dd-mm-yyyy'), 1, 363, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-07-1982', 'dd-mm-yyyy'), 1, 205, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-05-2003', 'dd-mm-yyyy'), 1, 150, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-02-2009', 'dd-mm-yyyy'), 1, 75, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-05-2013', 'dd-mm-yyyy'), 1, 112, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-11-2019', 'dd-mm-yyyy'), 0, 360, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-11-2009', 'dd-mm-yyyy'), 1, 354, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-04-1974', 'dd-mm-yyyy'), 0, 251, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-01-2024', 'dd-mm-yyyy'), 1, 258, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-02-2021', 'dd-mm-yyyy'), 1, 74, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-02-2001', 'dd-mm-yyyy'), 1, 252, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-08-1976', 'dd-mm-yyyy'), 1, 270, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-01-1981', 'dd-mm-yyyy'), 0, 202, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-06-2014', 'dd-mm-yyyy'), 0, 195, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-01-2007', 'dd-mm-yyyy'), 1, 28, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-10-1985', 'dd-mm-yyyy'), 1, 358, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-1982', 'dd-mm-yyyy'), 1, 151, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-06-2006', 'dd-mm-yyyy'), 0, 72, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-04-1973', 'dd-mm-yyyy'), 1, 158, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-05-2003', 'dd-mm-yyyy'), 1, 135, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-01-2014', 'dd-mm-yyyy'), 0, 98, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-12-1978', 'dd-mm-yyyy'), 0, 136, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-04-2004', 'dd-mm-yyyy'), 1, 385, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-01-1998', 'dd-mm-yyyy'), 1, 398, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-11-2008', 'dd-mm-yyyy'), 1, 338, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-06-2012', 'dd-mm-yyyy'), 0, 336, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-10-1977', 'dd-mm-yyyy'), 0, 181, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-11-2012', 'dd-mm-yyyy'), 0, 7, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-07-1977', 'dd-mm-yyyy'), 0, 317, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-07-2011', 'dd-mm-yyyy'), 1, 311, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-06-1977', 'dd-mm-yyyy'), 1, 389, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-01-2005', 'dd-mm-yyyy'), 1, 19, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-12-2010', 'dd-mm-yyyy'), 0, 174, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-03-1987', 'dd-mm-yyyy'), 0, 6, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-10-2008', 'dd-mm-yyyy'), 0, 166, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-10-1977', 'dd-mm-yyyy'), 0, 399, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-12-2020', 'dd-mm-yyyy'), 0, 161, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-1983', 'dd-mm-yyyy'), 0, 215, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-1998', 'dd-mm-yyyy'), 1, 233, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-03-2005', 'dd-mm-yyyy'), 1, 355, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-04-1996', 'dd-mm-yyyy'), 0, 57, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-12-2001', 'dd-mm-yyyy'), 0, 134, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-1981', 'dd-mm-yyyy'), 1, 330, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-10-2024', 'dd-mm-yyyy'), 1, 372, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-02-1977', 'dd-mm-yyyy'), 1, 387, 1);
commit;
prompt 200 records committed...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-06-1995', 'dd-mm-yyyy'), 1, 173, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-01-2005', 'dd-mm-yyyy'), 0, 137, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-03-1970', 'dd-mm-yyyy'), 1, 165, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-10-2001', 'dd-mm-yyyy'), 1, 329, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-06-1981', 'dd-mm-yyyy'), 0, 66, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-06-2022', 'dd-mm-yyyy'), 1, 327, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-09-2018', 'dd-mm-yyyy'), 1, 199, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-01-1981', 'dd-mm-yyyy'), 1, 80, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-04-1987', 'dd-mm-yyyy'), 0, 70, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-03-2002', 'dd-mm-yyyy'), 1, 60, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-10-1996', 'dd-mm-yyyy'), 1, 131, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-03-1991', 'dd-mm-yyyy'), 0, 325, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-1982', 'dd-mm-yyyy'), 0, 218, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-12-2013', 'dd-mm-yyyy'), 0, 362, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-11-1990', 'dd-mm-yyyy'), 1, 202, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-01-2020', 'dd-mm-yyyy'), 1, 359, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-10-1972', 'dd-mm-yyyy'), 0, 71, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-02-2009', 'dd-mm-yyyy'), 0, 293, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-02-2021', 'dd-mm-yyyy'), 1, 235, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-1981', 'dd-mm-yyyy'), 1, 51, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-11-2005', 'dd-mm-yyyy'), 0, 56, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-08-2000', 'dd-mm-yyyy'), 0, 172, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-04-1983', 'dd-mm-yyyy'), 0, 204, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-01-2005', 'dd-mm-yyyy'), 0, 156, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-01-1975', 'dd-mm-yyyy'), 1, 12, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-08-2011', 'dd-mm-yyyy'), 0, 194, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-09-1976', 'dd-mm-yyyy'), 0, 303, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-02-1984', 'dd-mm-yyyy'), 1, 8, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-09-2017', 'dd-mm-yyyy'), 1, 67, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-02-2003', 'dd-mm-yyyy'), 1, 18, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-12-2024', 'dd-mm-yyyy'), 0, 124, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-02-2006', 'dd-mm-yyyy'), 0, 78, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-09-1997', 'dd-mm-yyyy'), 1, 255, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-01-1985', 'dd-mm-yyyy'), 0, 196, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-02-2000', 'dd-mm-yyyy'), 0, 341, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-06-2022', 'dd-mm-yyyy'), 0, 276, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-02-1993', 'dd-mm-yyyy'), 0, 113, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-06-2000', 'dd-mm-yyyy'), 0, 83, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-01-1999', 'dd-mm-yyyy'), 0, 336, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-04-1974', 'dd-mm-yyyy'), 0, 244, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-04-1995', 'dd-mm-yyyy'), 0, 210, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-11-1997', 'dd-mm-yyyy'), 0, 257, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1975', 'dd-mm-yyyy'), 0, 206, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-02-2011', 'dd-mm-yyyy'), 1, 140, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-04-1982', 'dd-mm-yyyy'), 1, 195, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-08-2009', 'dd-mm-yyyy'), 1, 130, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-03-1982', 'dd-mm-yyyy'), 0, 192, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-09-2003', 'dd-mm-yyyy'), 1, 114, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-12-2012', 'dd-mm-yyyy'), 1, 311, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-08-2022', 'dd-mm-yyyy'), 0, 271, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-05-1996', 'dd-mm-yyyy'), 1, 58, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-1993', 'dd-mm-yyyy'), 1, 28, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-10-1970', 'dd-mm-yyyy'), 1, 134, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-03-2008', 'dd-mm-yyyy'), 0, 328, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-12-2003', 'dd-mm-yyyy'), 1, 49, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-07-2011', 'dd-mm-yyyy'), 1, 79, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-10-2010', 'dd-mm-yyyy'), 1, 185, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-1995', 'dd-mm-yyyy'), 0, 16, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-08-2014', 'dd-mm-yyyy'), 0, 68, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-09-1973', 'dd-mm-yyyy'), 1, 396, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-02-2010', 'dd-mm-yyyy'), 0, 119, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-01-1984', 'dd-mm-yyyy'), 1, 182, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-10-1983', 'dd-mm-yyyy'), 0, 65, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-04-2021', 'dd-mm-yyyy'), 0, 82, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-10-2011', 'dd-mm-yyyy'), 1, 270, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-06-1993', 'dd-mm-yyyy'), 0, 91, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-11-2004', 'dd-mm-yyyy'), 0, 324, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-07-1990', 'dd-mm-yyyy'), 0, 54, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-09-1982', 'dd-mm-yyyy'), 1, 60, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-12-1988', 'dd-mm-yyyy'), 0, 205, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-1977', 'dd-mm-yyyy'), 1, 135, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-06-2022', 'dd-mm-yyyy'), 1, 352, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-11-1987', 'dd-mm-yyyy'), 1, 101, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-08-2010', 'dd-mm-yyyy'), 1, 126, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-12-1995', 'dd-mm-yyyy'), 0, 182, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-01-2016', 'dd-mm-yyyy'), 0, 208, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-05-2010', 'dd-mm-yyyy'), 1, 10, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-05-1995', 'dd-mm-yyyy'), 0, 270, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-1984', 'dd-mm-yyyy'), 0, 264, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-03-1985', 'dd-mm-yyyy'), 1, 392, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-10-2018', 'dd-mm-yyyy'), 1, 260, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-02-2004', 'dd-mm-yyyy'), 0, 211, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-04-1973', 'dd-mm-yyyy'), 1, 88, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-03-1995', 'dd-mm-yyyy'), 0, 162, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-05-2022', 'dd-mm-yyyy'), 1, 108, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-12-1993', 'dd-mm-yyyy'), 0, 218, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-04-2022', 'dd-mm-yyyy'), 1, 162, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-05-2002', 'dd-mm-yyyy'), 1, 318, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-02-1986', 'dd-mm-yyyy'), 0, 378, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-2014', 'dd-mm-yyyy'), 1, 161, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-06-1977', 'dd-mm-yyyy'), 0, 241, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-11-1973', 'dd-mm-yyyy'), 1, 78, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-06-2011', 'dd-mm-yyyy'), 1, 246, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-06-1984', 'dd-mm-yyyy'), 1, 250, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-06-2006', 'dd-mm-yyyy'), 0, 332, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-07-1975', 'dd-mm-yyyy'), 1, 151, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-02-2014', 'dd-mm-yyyy'), 0, 138, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-01-1975', 'dd-mm-yyyy'), 0, 215, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-02-2013', 'dd-mm-yyyy'), 0, 280, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-01-2001', 'dd-mm-yyyy'), 1, 132, 4);
commit;
prompt 300 records committed...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-05-1981', 'dd-mm-yyyy'), 0, 260, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-07-2011', 'dd-mm-yyyy'), 1, 160, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-01-1971', 'dd-mm-yyyy'), 1, 195, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 0, 275, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 1, 371, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-04-2014', 'dd-mm-yyyy'), 0, 334, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-09-1974', 'dd-mm-yyyy'), 0, 229, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-03-1992', 'dd-mm-yyyy'), 0, 70, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-05-1984', 'dd-mm-yyyy'), 1, 361, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-04-2015', 'dd-mm-yyyy'), 1, 110, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-10-2016', 'dd-mm-yyyy'), 1, 349, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-1990', 'dd-mm-yyyy'), 0, 18, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-12-1989', 'dd-mm-yyyy'), 0, 157, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-11-1983', 'dd-mm-yyyy'), 1, 115, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-10-1973', 'dd-mm-yyyy'), 0, 197, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-2004', 'dd-mm-yyyy'), 0, 15, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-09-2018', 'dd-mm-yyyy'), 0, 217, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-11-1983', 'dd-mm-yyyy'), 0, 51, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-02-1990', 'dd-mm-yyyy'), 1, 73, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-04-2008', 'dd-mm-yyyy'), 0, 79, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-11-2011', 'dd-mm-yyyy'), 1, 224, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-01-1973', 'dd-mm-yyyy'), 0, 172, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-06-2014', 'dd-mm-yyyy'), 0, 346, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-06-2018', 'dd-mm-yyyy'), 0, 155, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-03-2002', 'dd-mm-yyyy'), 0, 14, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-06-1973', 'dd-mm-yyyy'), 1, 32, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1973', 'dd-mm-yyyy'), 0, 387, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-09-1983', 'dd-mm-yyyy'), 1, 53, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-09-1989', 'dd-mm-yyyy'), 0, 294, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-03-2018', 'dd-mm-yyyy'), 1, 210, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-10-1971', 'dd-mm-yyyy'), 1, 132, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-04-1996', 'dd-mm-yyyy'), 0, 4, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-2011', 'dd-mm-yyyy'), 1, 139, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-10-1972', 'dd-mm-yyyy'), 1, 323, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-02-1973', 'dd-mm-yyyy'), 1, 285, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-07-1987', 'dd-mm-yyyy'), 0, 210, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-11-2024', 'dd-mm-yyyy'), 1, 1, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-02-1975', 'dd-mm-yyyy'), 0, 326, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-06-2017', 'dd-mm-yyyy'), 0, 278, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-06-1990', 'dd-mm-yyyy'), 1, 144, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-07-1994', 'dd-mm-yyyy'), 0, 271, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-2001', 'dd-mm-yyyy'), 1, 237, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-08-2012', 'dd-mm-yyyy'), 0, 23, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-06-1989', 'dd-mm-yyyy'), 1, 301, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-02-1971', 'dd-mm-yyyy'), 1, 239, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-08-1992', 'dd-mm-yyyy'), 0, 346, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-03-1975', 'dd-mm-yyyy'), 1, 322, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-11-2007', 'dd-mm-yyyy'), 0, 12, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-10-2022', 'dd-mm-yyyy'), 1, 63, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-10-2011', 'dd-mm-yyyy'), 0, 70, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-12-2024', 'dd-mm-yyyy'), 0, 26, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-05-2003', 'dd-mm-yyyy'), 0, 370, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-07-2013', 'dd-mm-yyyy'), 1, 367, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-12-1984', 'dd-mm-yyyy'), 1, 391, 2);
commit;
prompt 354 records loaded
prompt Loading ORDERS...
insert into ORDERS (order_id, order_date, customer_id, discount, accountid)
values (405, to_date('10-06-2024 00:53:48', 'dd-mm-yyyy hh24:mi:ss'), 1, 10, 124);
insert into ORDERS (order_id, order_date, customer_id, discount, accountid)
values (406, to_date('10-06-2024 00:55:13', 'dd-mm-yyyy hh24:mi:ss'), 1, 10, 124);
insert into ORDERS (order_id, order_date, customer_id, discount, accountid)
values (407, to_date('10-06-2024 00:57:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 10, 124);
insert into ORDERS (order_id, order_date, customer_id, discount, accountid)
values (401, to_date('10-06-2024 00:48:17', 'dd-mm-yyyy hh24:mi:ss'), 1, 10, 124);
insert into ORDERS (order_id, order_date, customer_id, discount, accountid)
values (402, to_date('10-06-2024 00:48:17', 'dd-mm-yyyy hh24:mi:ss'), 1, 10, 124);
insert into ORDERS (order_id, order_date, customer_id, discount, accountid)
values (404, to_date('10-06-2024 00:48:17', 'dd-mm-yyyy hh24:mi:ss'), 1, 10, 124);
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
prompt 400 records committed...
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
prompt 500 records committed...
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
prompt 600 records committed...
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
prompt 700 records committed...
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
prompt 800 records loaded

set feedback on
set define on
prompt Done
