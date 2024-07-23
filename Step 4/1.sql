-- Ensure that the worker_id column exists in both tables and has the same data type
-- For example:
-- ALTER TABLE worker ADD (worker_id NUMBER); 
-- ALTER TABLE activity ADD (worker_id NUMBER);

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
