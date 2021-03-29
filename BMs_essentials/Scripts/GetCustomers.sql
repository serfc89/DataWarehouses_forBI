CREATE PROCEDURE classicmodels.GetCustomers()
BEGIN
	BEGIN
	SELECT 
		customerName, 
		city, 
		state, 
		postalCode, 
		country
	FROM
		customers
	ORDER BY customerName;    
END