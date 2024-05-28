CREATE TABLE Categories
(
  category_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  category_name VARCHAR2(40) NOT NULL,
  min_age INT NOT NULL
);

CREATE TABLE Customers
(
  customer_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer_name VARCHAR2(40) NOT NULL,
  phone_numer NUMERIC(10,0) NOT NULL,
  address_line_1 VARCHAR2(40) NOT NULL,
  address_line_2 VARCHAR2(40)
);

CREATE TABLE Orders
(
  order_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_date DATE NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Areas (
    area_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    area_name VARCHAR2(50)
);

CREATE TABLE Locations
(
  location_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  location_name VARCHAR2(40) NOT NULL,
  area_id INT NOT NULL,
  FOREIGN KEY (area_id) REFERENCES Areas(area_id)
);

CREATE TABLE Attractions
(
  attraction_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  attraction_name VARCHAR2(40) NOT NULL,
  Description VARCHAR2(100) NOT NULL,
  opening_hours VARCHAR2(40) NOT NULL,
  location_id INT NOT NULL,
  FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE Tickets
(
  ticket_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  price FLOAT NOT NULL,
  valid_from DATE NOT NULL,
  valid_until DATE NOT NULL,
  category_id INT NOT NULL,
  attraction_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id),
  FOREIGN KEY (attraction_id) REFERENCES Attractions(attraction_id)
);

CREATE TABLE Order_Items
(
  ticket_id INT NOT NULL,
  order_id INT NOT NULL,
  FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
