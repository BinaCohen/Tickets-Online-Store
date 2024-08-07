ALTER TABLE Customers
ADD phone_number VARCHAR2(10);

update customers
set phone_number = phone_numer
where phone_numer in (
select phone_numer from (
SELECT phone_numer, COUNT(*)
FROM Customers
GROUP BY phone_numer
HAVING COUNT(*) > 1))

select * from customers

ALTER TABLE Customers
RENAME COLUMN phone_numer TO old_phone_numer;

ALTER TABLE Tickets
MODIFY valid_from DEFAULT SYSDATE;
