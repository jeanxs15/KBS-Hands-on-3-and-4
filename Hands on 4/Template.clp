(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
  (slot phone)
  (slot age)
  (slot gender))

(deftemplate product
  (slot product-id)
  (slot name)
  (slot category)
  (slot price))

(deftemplate order
  (slot order-id)
  (slot customer-id))

(deftemplate line-item
  (slot order-id)
  (slot product-id)
  (slot quantity (default 1)))

(deftemplate preference
  (slot customer-id)
  (slot preferred-category))
