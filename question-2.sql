-- Show the sales agent's full name and invoices associated with each sales agent.

SELECT
  employees.FirstName || ' ' || employees.LastName AS agent_name,
  invoices.InvoiceId, 
  invoices.InvoiceDate,
  invoices.BillingAddress,
  invoices.BillingCity,
  invoices.BillingState,
  invoices.BillingCountry,
  invoices.BillingPostalCode,
  invoices.total
  
FROM
  employees
  JOIN customers ON employees.EmployeeId = customers.SupportRepId
  JOIN invoices ON customers.CustomerId = invoices.CustomerId
  
ORDER BY
  agent_name,
  invoices.InvoiceDate;