require('pry')
require_relative('models/ticket.rb')
require_relative('models/film.rb')
require_relative('models/customer.rb')
require_relative('models/screening.rb')
require_relative('models/showing_time.rb')

Customer.delete_all()
Film.delete_all()
Showing_time.delete_all()
Screening.delete_all()
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

customer4 =Customer.new({
  "name" => "Roy",
  "funds" => 10
  })
customer4.save()

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

showing_time1 = Showing_time.new ({
    "start_time" => "19:00:00"
  })
showing_time1.save()

showing_time2 = Showing_time.new ({
    "start_time" => "19:30:00"
  })
showing_time2.save()

showing_time3 = Showing_time.new ({
    "start_time" => "20:00:00"
  })
showing_time3.save()

showing_time4 = Showing_time.new ({
    "start_time" => "20:30:00"
  })
showing_time4.save()

showing_time5 = Showing_time.new ({
    "start_time" => "21:00:00"
  })
showing_time5.save()

showing_time6 = Showing_time.new ({
    "start_time" => "21:30:00"
  })
showing_time6.save()

showing_time7 = Showing_time.new ({
    "start_time" => "22:00:00"
  })
showing_time7.save()

showing_time8 = Showing_time.new ({
    "start_time" => "22:30:00"
  })
showing_time8.save()

showing_time9 = Showing_time.new ({
    "start_time" => "23:00:00"
  })
showing_time9.save()

showing_time10 = Showing_time.new ({
    "start_time" => "23:30:00"
  })
showing_time10.save()

screening1 = Screening.new ({
  "screen_no" => 1,
  'seat' => 100,
  "showing_time_id" => showing_time1.id,
  "film_id"=> film2.id
    })
screening1.save()

screening2 = Screening.new ({
  "screen_no" => 2,
  'seat' => 80,
  "showing_time_id" => showing_time2.id,
  "film_id"=> film2.id
    })
screening2.save()

screening3 = Screening.new ({
  "screen_no" => 3,
  'seat' => 50,
  "showing_time_id" => showing_time3.id,
  "film_id"=> film3.id
    })
screening3.save()

screening4 = Screening.new ({
  "screen_no" => 4,
  'seat' => 30,
  "showing_time_id" => showing_time4.id,
  "film_id"=> film1.id
    })
screening4.save()

screening5 = Screening.new ({
  "screen_no" => 1,
  'seat' => 100,
  "showing_time_id" => showing_time4.id,
  "film_id"=> film1.id
    })
screening5.save()

screening6 = Screening.new ({
  "screen_no" => 2,
  'seat' => 80,
  "showing_time_id" => showing_time6.id,
  "film_id"=> film2.id
    })
screening6.save()

screening7 = Screening.new ({
  "screen_no" => 3,
  'seat' => 50,
  "showing_time_id" => showing_time7.id,
  "film_id"=> film3.id
    })
screening7.save()

screening8 = Screening.new ({
  "screen_no" => 4,
  'seat' => 30,
  "showing_time_id" => showing_time8.id,
  "film_id"=> film1.id
    })
screening8.save()

screening9 = Screening.new ({
  "screen_no" => 1,
  'seat' => 100,
  "showing_time_id" => showing_time9.id,
  "film_id"=> film2.id
    })
screening9.save()

screening10 = Screening.new ({
  "screen_no" => 2,
  'seat' => 80,
  "showing_time_id" => showing_time10.id,
  "film_id"=> film3.id
    })
screening10.save()






ticket1 =Ticket.new ({
  "film_id"=> film1.id,
  "customer_id"=> customer1.id,
  "screening_id"=> screening4.id,
  "price" => film1.price,
  "seat_no" => "B12"
  })

  # customer1 SEE film1 AT screen4 ON time4

 customer1.buy_ticket(ticket1.price)
 film1.sell_ticket(ticket1.price)
 film1.tickets_sold()
 film1.update()
 customer1.update()

 screening4.seat_left()
 screening4.update()


ticket1.save()

ticket2 =Ticket.new ({
  "film_id"=> film2.id,
  "customer_id"=> customer2.id,
  "screening_id"=> screening9.id,
  "price" => film2.price,
  "seat_no" => "H11"
  })

  # customer2 SEE film2 AT screen9 ON time9
  customer2.buy_ticket(ticket2.price)
  film2.sell_ticket(ticket2.price)
  film2.tickets_sold()
  film2.update()
  customer2.update()

  screening9.seat_left()
  screening9.update()

ticket2.save()

ticket3 =Ticket.new ({
  "film_id"=> film3.id,
  "customer_id"=> customer3.id,
  "screening_id"=> screening7.id,
  "price" => film3.price,
  "seat_no" => "C05"
  })

  # customer3 SEE film3 AT screen7 ON time7
  customer3.buy_ticket(ticket3.price)
  film3.sell_ticket(ticket3.price)
  film3.tickets_sold()
  film3.update()
  customer3.update()

  screening7.seat_left()
  screening7.update()

ticket3.save()




ticket4 =Ticket.new ({
  "film_id"=> film1.id,
  "customer_id"=> customer2.id,
  "screening_id"=> screening5.id,
  "price" => film1.price,
  "seat_no" => "F10"
  })

  # customer2 SEE film1 AT screen5 ON time4
  customer2.buy_ticket(ticket4.price)
  film1.sell_ticket(ticket4.price)
  film1.tickets_sold()
  film1.update()
  customer2.update()

  screening5.seat_left()
  screening5.update()

ticket4.save()


ticket5 =Ticket.new ({
  "film_id"=> film1.id,
  "customer_id"=> customer3.id,
  "screening_id"=> screening5.id,
  "price" => film1.price,
  "seat_no" => "G09"
  })

  # customer3 SEE film1 AT screen5 ON time4
  customer3.buy_ticket(ticket5.price)
  film1.sell_ticket(ticket5.price)
  film1.tickets_sold()
  film1.update()
  customer3.update()

  screening5.seat_left()
  screening5.update()

ticket5.save()


ticket6 =Ticket.new ({
  "film_id"=> film2.id,
  "customer_id"=> customer3.id,
  "screening_id"=> screening1.id,
  "price" => film2.price,
  "seat_no" => "C19"
  })

  # customer3 see film2 AT screen2 ON time1
  customer3.buy_ticket(ticket6.price)
  film2.sell_ticket(ticket6.price)
  film2.tickets_sold()
  film2.update()
  customer3.update()

  screening1.seat_left()
  screening1.update()

ticket6.save()

ticket7 =Ticket.new ({
  "film_id"=> film2.id,
  "customer_id"=> customer4.id,
  "screening_id"=> screening9.id,
  "price" => film2.price,
  "seat_no" => "D02"
  })

  # customer4 see film2 AT screen1 ON time9
  customer4.buy_ticket(ticket7.price)
  film2.sell_ticket(ticket7.price)
  film2.tickets_sold()
  film2.update()
  customer4.update()

  screening9.seat_left()
  screening9.update()
  
ticket7.save()





binding.pry
nil
