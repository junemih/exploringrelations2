-- What was the most purchased track of 2013?

SELECT tracks.TrackId, tracks.Name, COUNT(*) AS occurrence_count
FROM invoice_items
JOIN tracks ON invoice_items.TrackId = tracks.TrackId
JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
WHERE strftime('%Y', invoices.InvoiceDate) = '2013'
GROUP BY invoice_items.TrackId
HAVING COUNT(*) = (
  SELECT COUNT(*) AS highest_count
  FROM invoice_items
  JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
  WHERE strftime('%Y', invoices.InvoiceDate) = '2013'
  GROUP BY invoice_items.TrackId
  ORDER BY COUNT(*) DESC
  LIMIT 1
)
ORDER BY tracks.Name ASC;