Given(/^The database is cleaned$/) do
	Card.find(1).destroy
end