require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price, :ticket_sold, :boxoffice

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
    @ticket_sold = options['ticket_sold'].to_i
    @boxoffice = options['boxoffice'].to_i
  end

  def self.delete_all()
   sql = "DELETE FROM films"
   SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    film_hashes = SqlRunner.run(sql)
    return self.map_items(film_hashes)
  end

  def self.map_items(film_hashes)
    result = film_hashes.map{|film_hash| self.new(film_hash)}
    return result
  end

  def save()
    sql = "INSERT INTO films (title,price,ticket_sold,boxoffice)
          VALUES ($1,$2,$3,$4)
          RETURNING id"
    values = [@title,@price,@ticket_sold,@boxoffice]
    film = SqlRunner.run(sql, values).first()
    @id = film['id'].to_i
  end

  def update
    sql = "UPDATE films SET (title, price ,ticket_sold,boxoffice) =
    ($1, $2, $3, $4) WHERE id = $5"
    values = [@title, @price ,@ticket_sold,@boxoffice,@id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM films WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.name, customers.funds FROM films INNER JOIN tickets on films.id = tickets.film_id INNER JOIN customers ON customers.id = tickets.customer_id WHERE films.id= $1"
    values = [@id]
    customer_hashes = SqlRunner.run(sql, values)
    return Customer.map_items(customer_hashes)
  end

  def sell_ticket(ticket_price)
    @boxoffice += ticket_price
  end

  def tickets_sold()
    @ticket_sold +=1
  end

end
