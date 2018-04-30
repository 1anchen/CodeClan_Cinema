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

  def popular_time()
    sql = "SELECT showing_times.start_time FROM films INNER JOIN tickets ON films.id = tickets.film_id INNER JOIN screenings ON tickets.screening_id = screenings.id INNER JOIN showing_times ON screenings.showing_time_id = showing_times.id WHERE films.id= $1"
    values = [@id]
    showing_time_hashes = SqlRunner.run(sql, values)
    showing_time_hash = Showing_time.map_items(showing_time_hashes)
    # showing_time_hash.select {|e| showing_time_hash.count(e) > 1}.uniq

    # it is not return a array of hash, still need to find the popular time
    # showing_time_hash.values
    # popular_time = showing_time_hash.select{ |k,v| showing_time_hash.count(v) > 1 }.uniq
    # return popular_time
  end

end
