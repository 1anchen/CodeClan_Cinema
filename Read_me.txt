
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Below is the details of this task
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CodeClan Cinema (CCC (again))

Create a system that handles bookings for our newly built cinema! It's enough if you can call your methods in pry, don't worry about an interface.

Your app should have:

Customers

+name
+funds

Films

+title
+price

Tickets

+customer_id
+film_id
Y
our app should be able to:

Create customers, films and tickets
CRUD actions (create, read, update, delete) customers, films and tickets.
Show which films a customer has booked to see, and see which customers are coming to see one film.
Basic extensions:

Buying tickets should decrease the funds of the customer by the price
Check how many tickets were bought by a customer
Check how many customers are going to watch a certain film
Advanced extensions:

Create a screenings table that lets us know what time films are showing
Write a method that finds out what is the most popular time (most tickets sold) for a given film
Limit the available tickets for screenings.
Add any other extensions you think would be great to have at a cinema!

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
There are 3 sub folders created,
db - is for the database and the SqlRunner that opens and close the the connection
models - for all ruby files
specs - for testing files

A photo of the design drawing has also been included.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
