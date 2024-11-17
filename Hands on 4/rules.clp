
(defrule customer-no-purchase
  (customer (customer-id ?id) (name ?name))
  (not (order (order-id ?order-id) (customer-id ?id)))
=>
  (printout t "El cliente " ?name " no ha realizado ninguna compra." crlf))

(defrule product-purchase-info
  (order (order-id ?order-id))
  (line-item (order-id ?order-id) (product-id ?product-id) (quantity ?quantity))
  (product (product-id ?product-id) (name ?product-name))
=>
  (printout t "Se compraron " ?quantity " unidades de " ?product-name crlf))

(defrule determine-preference
  (customer (customer-id ?id) (name ?name))
  (line-item (order-id ?order-id) (product-id ?product-id) (quantity ?quantity))
  (product (product-id ?product-id) (category ?category))
  (preference (customer-id ?id) (preferred-category ?current-pref))
=>
  (if (> ?quantity 5)
    then
      (retract (preference (customer-id ?id) (preferred-category ?current-pref)))
      (assert (preference (customer-id ?id) (preferred-category ?category)))
      (printout t "La preferencia de " ?name " se actualizó a " ?category crlf)))

(defrule offer-discount
  (customer (customer-id ?id) (name ?name) (phone ?phone))
  (preference (customer-id ?id) (preferred-category ?preferred-category))
=>
  (printout t "Enviando mensaje a " ?name " (" ?phone "): ¡10% de descuento en productos de " ?preferred-category "!" crlf))
