-- Show the customer's full name, Invoice ID, Date of the invoice and billing country of customers who are from Brazil.
SELECT 
  customers.FirstName || ' ' || customers.LastName AS full_name,
  invoices.InvoiceID,
  invoices.InvoiceDate,
  invoices.BillingCountry
FROM
  invoices
  JOIN customers ON invoices.CustomerId = customers.CustomerId
WHERE
  customers.country = 'Brazil';