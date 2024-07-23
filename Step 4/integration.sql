ALTER TABLE Branch
ADD location_id NUMBER;

ALTER TABLE Branch
ADD CONSTRAINT fk_branch_location
FOREIGN KEY (location_id)
REFERENCES Locations(location_id);

ALTER TABLE activity
ADD customer_id NUMBER;

ALTER TABLE activity
DROP COLUMN ClientId;

ALTER TABLE Orders
ADD AccountId NUMERIC(5);

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_account
FOREIGN KEY (AccountId)
REFERENCES Acount(AccountId);
