ALTER TABLE Branch
ADD location_id NUMBER;

ALTER TABLE Branch
ADD CONSTRAINT fk_branch_location
FOREIGN KEY (location_id)
REFERENCES Locations(location_id);

ALTER TABLE Customers
DROP COLUMN old_phone_numer;

ALTER TABLE activity
ADD customer_id NUMBER;

ALTER TABLE activity
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);


ALTER TABLE activity
DROP COLUMN ClientId;

DROP TABLE Client;

ALTER TABLE Orders
ADD AccountId NUMERIC(5);

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_account
FOREIGN KEY (AccountId)
REFERENCES Acount(AccountId);

-- Add the foreign key constraint
ALTER TABLE activity
ADD CONSTRAINT fk_worker
FOREIGN KEY (workerId)
REFERENCES worker(workerId);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_ticket
FOREIGN KEY (ticket_id)
REFERENCES tickets(ticket_id);
