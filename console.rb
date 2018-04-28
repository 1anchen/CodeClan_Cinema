require('pry')
require_relative('models/ticket.rb')
require_relative('models/film.rb')
require_relative('models/customer.rb')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()


customer1 =Customer.new({
  "name" => "Brad",
  "funds" => 10
  })
customer1.save()

customer2 =Customer.new({
  "name" => "Reese",
  "funds" => 20
  })
customer2.save()

customer3 =Customer.new({
  "name" => "Mcauley",
  "funds" => 30
  })
customer3.save()

film1 = Film.new({
  "title" => 'Seven',
  "price" => 3,
  "ticket_sold" => 0,
  "boxoffice" => 0
  })
film1.save()

film2 = Film.new({
  "title" => 'Cruel Intentions',
  "price" => 4,
  "ticket_sold" => 0,
  "boxoffice" => 0
  })
film2.save()

film3 = Film.new({
  "title" => 'Home Alone',
  "price" => 5,
  "ticket_sold" => 0,
  "boxoffice" => 0
  })
film3.save()

ticket1 =Ticket.new ({
  "film_id"=> film1.id,
  "customer_id"=> customer1.id,
  "price" => film1.price
  })

  # customer1 see film1
 customer1.buy_ticket(ticket1.price)
 film1.sell_ticket(ticket1.price)
 film1.tickets_sold()
 film1.update()
 customer1.update()

ticket1.save()

ticket2 =Ticket.new ({
  "film_id"=> film2.id,
  "customer_id"=> customer2.id,
  "price" => film2.price
  })

  # customer2 see film2
  customer2.buy_ticket(ticket2.price)
  film2.sell_ticket(ticket2.price)
  film2.tickets_sold()
  film2.update()
  customer2.update()
ticket2.save()

ticket3 =Ticket.new ({
  "film_id"=> film3.id,
  "customer_id"=> customer3.id,
  "price" => film3.price
  })

  # customer3 see film3
  customer3.buy_ticket(ticket3.price)
  film3.sell_ticket(ticket3.price)
  film3.tickets_sold()
  film3.update()
  customer3.update()
ticket3.save()




ticket4 =Ticket.new ({
  "film_id"=> film1.id,
  "customer_id"=> customer2.id,
  "price" => film1.price
  })

  # customer2 see film1
  customer2.buy_ticket(ticket4.price)
  film1.sell_ticket(ticket4.price)
  film1.tickets_sold()
  film1.update()
  customer2.update()
ticket4.save()


ticket5 =Ticket.new ({
  "film_id"=> film1.id,
  "customer_id"=> customer3.id,
  "price" => film1.price
  })

  # customer3 see film1
  customer3.buy_ticket(ticket5.price)
  film1.sell_ticket(ticket5.price)
  film1.tickets_sold()
  film1.update()
  customer3.update()
ticket5.save()


ticket6 =Ticket.new ({
  "film_id"=> film2.id,
  "customer_id"=> customer3.id,
  "price" => film2.price
  })

  # customer3 see film2
  customer3.buy_ticket(ticket6.price)
  film2.sell_ticket(ticket6.price)
  film2.tickets_sold()
  film2.update()
  customer3.update()
ticket6.save()





binding.pry
nil
