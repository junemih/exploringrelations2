-- Which sales agent made the most in sales in 2010?

SELECT employees.FirstName || ' ' || employees.LastName AS SalesAgent, SUM(invoice_items.Quantity) AS TotalSales
FROM employees
JOIN customers ON employees.EmployeeId = customers.SupportRepId
JOIN invoices ON customers.CustomerId = invoices.CustomerId
JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
WHERE strftime('%Y', invoices.InvoiceDate) = '2010'
GROUP BY employees.EmployeeId
ORDER BY TotalSales DESC
LIMIT 1;