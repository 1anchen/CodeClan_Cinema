require('minitest/autorun')
require('minitest/rg')
require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

class TestFilm < MiniTest::Test

  def setup
    @customer1 = Customer.new({
      "name" => "Brad",
      "funds" => 10
      })

    @film1 = Film.new({
      "title" => 'Seven',
      "price" => 3,
      "ticket_sold" => 0,
      "boxoffice" => 0
        })

     @ticket1 =Ticket.new ({
       "film_id"=> @film1.id,
       "customer_id"=> @customer1.id,
       "price" => @film1.price
          })
   end

 def test_price
   answer = 3
   result = @film1.price
   assert_equal(answer,result)
 end

 def test_ticket_sold
   answer = 0
   result = @film1.ticket_sold
   assert_equal(answer,result)
 end

 def test_price
   answer = 0
   result = @film1.boxoffice
   assert_equal(answer,result)
 end

 def test_sell_ticket
   @film1.sell_ticket(@ticket1.price)
   answer = 3
   result = @film1.boxoffice
   assert_equal(answer,result)
 end

 def test_tickets_sold
   @film1.tickets_sold()
   answer = 1
   result = @film1.ticket_sold
   assert_equal(answer,result)
 end

end
