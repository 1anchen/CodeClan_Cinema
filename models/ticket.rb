require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screening_id, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @film_id= options['film_id']
    @screening_id= options['screening_id']
    @price = options['price']
    @seat_no = options['seat_no']
  end

  def self.delete_all()
   sql = "DELETE FROM tickets"
   SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_hashes = SqlRunner.run(sql)
    return self.map_items(ticket_hashes)
  end

  def self.map_items(ticket_hashes)
    result = ticket_hashes.map{|ticket_hash| self.new(ticket_hash)}
    return result
  end


  def save()
    sql = "INSERT INTO tickets (customer_id,film_id,screening_id,price,seat_no)
          VALUES ($1,$2,$3,$4,$5)
          RETURNING id"
    values = [@customer_id,@film_id,@screening_id,@price,@seat_no]
    ticket = SqlRunner.run(sql, values).first()
    @id = ticket['id'].to_i
  end

  def update
    sql = "UPDATE tickets SET (customer_id,film_id,screening_id,price,seat_no) =
    ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@customer_id, @film_id, @screening_id, @price,@seat_no, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(ticket_hashes)
    result = ticket_hashes.map{|ticket_hash| self.new(ticket_hash)}
    return result
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
