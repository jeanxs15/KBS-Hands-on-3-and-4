(deffacts customers
  (customer (customer-id 1) (name "Alice") (address "Street 123") (phone "555-1234") (age 28) (gender female))
  (customer (customer-id 2) (name "Bob") (address "Avenue 456") (phone "555-5678") (age 35) (gender male))
  (customer (customer-id 3) (name "Charlie") (address "Boulevard 789") (phone "555-9101") (age 22) (gender male)))

(deffacts products
  (product (product-id 100) (name "Smartphone") (category technology) (price 799.99))
  (product (product-id 101) (name "Laptop") (category technology) (price 1200.00))
  (product (product-id 102) (name "Chocolate") (category food) (price 5.00))
  (product (product-id 103) (name "Coffee Maker") (category home) (price 45.99)))

(deffacts orders
  (order (order-id 500) (customer-id 1))
  (order (order-id 501) (customer-id 2))
  (order (order-id 502) (customer-id 3)))

(deffacts line-items
  (line-item (order-id 500) (product-id 100) (quantity 1))
  (line-item (order-id 501) (product-id 101) (quantity 2))
  (line-item (order-id 502) (product-id 102) (quantity 10)))
