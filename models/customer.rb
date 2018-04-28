require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def self.delete_all()
   sql = "DELETE FROM customers"
   SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM customers"
    customer_hashes = SqlRunner.run(sql)
    return self.map_items(customer_hashes)
  end

  def self.map_items(customer_hashes)
    result = customer_hashes.map{|customer_hash| self.new(customer_hash)}
    return result
  end

  def save()
    sql = "INSERT INTO customers (name,funds)
          VALUES ($1,$2)
          RETURNING id"
    values = [@name,@funds]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i
  end

  def update
    sql = "UPDATE customers SET (name, funds) =
    ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def films()
    sql = "SELECT films.title, films.price, films.ticket_sold, films.boxoffice FROM customers INNER JOIN tickets on customers.id = tickets.customer_id INNER JOIN films ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    return Film.map_items(film_hashes)
  end

  def buy_ticket(ticket_price)
    @funds -= ticket_price
  end

  def tickets()
    sql = "SELECT tickets.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE customers.id = $1"
    values = [@id]
    ticket_hashes = SqlRunner.run(sql, values)
    return Ticket.map_items(ticket_hashes)
  end



end
