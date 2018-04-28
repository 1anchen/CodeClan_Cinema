require('minitest/autorun')
require('minitest/rg')
require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

class TestCustomer < MiniTest::Test

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

 def test_funds
   answer = 10
   result = @customer1.funds
   assert_equal(answer,result)
 end

 def test_buy_ticket
   @customer1.buy_ticket(@ticket1.price)
   answer = 7
   result = @customer1.funds
   assert_equal(answer,result)
 end
end
