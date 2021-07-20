DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS expenses;
CREATE TABLE members (
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    employee_id INTEGER PRIMARY KEY NOT NULL
);
CREATE TABLE expenses (
  id INTEGER PRIMARY KEY NOT NULL,
  created_datetime TEXT NOT NULL,
  serviced_datetime TEXT NOT NULL,
  status TEXT NOT NULL,
  amount REAL NOT NULL,
  employee_id INTEGER NOT NULL,
    FOREIGN KEY (employee_id)
                      REFERENCES members (employee_id)
);
INSERT INTO members (first_name, last_name, email, employee_id)
VALUES ('Jane', 'Doe', 'jane@get-carrot.com', 1),
       ('Todd', 'Smith', 'todd@get-carot.com', 2);

INSERT INTO expenses (id, created_datetime, serviced_datetime, status, amount, employee_id)
VALUES (1, '2018-03-01T12:03:46.464116', '2018-03-01', 'RECEIVED', 10000, 1),
       (2, '2018-03-01T12:44:24.689154', '2018-03-01', 'APPROVED', 20000, 1),
       (3, '2018-03-01T12:44:25.532359', '2018-02-15', 'PAID', 5050, 1),
       (4, '2018-03-01T12:44:26.072410', '2018-02-28', 'DENIED', 2490, 2),
       (5, '2018-03-01T12:44:26.518451', '2018-01-01', 'RECEIVED', 1000000, 2);
