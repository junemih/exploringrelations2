-- Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT 
  invoice_items.Quantity, 
  invoice_items.InvoiceId, 
  invoice_items.InvoiceLineId,
  invoice_items.TrackId, 
  invoice_items.UnitPrice, 
  tracks.Name AS TrackName, 
  artists.Name AS ArtistName
FROM invoice_items
JOIN tracks ON invoice_items.TrackId = tracks.TrackId
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON albums.ArtistId = artists.ArtistId