require_relative('../db/sql_runner.rb')

class Showing_time

  attr_reader :id
  attr_accessor :start_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @start_time = options['start_time']
  end

  def self.delete_all()
   sql = "DELETE FROM showing_times"
   SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM showing_times"
    showing_time_hashes = SqlRunner.run(sql)
    return self.map_items(showing_time_hashes)
  end

  def self.map_items(showing_time_hashes)
    result = showing_time_hashes.map{|showing_time_hash| self.new(showing_time_hash)}
    return result
  end

  def save()
    sql = "INSERT INTO showing_times (start_time)
          VALUES ($1)
          RETURNING id"
    values = [@start_time]
    showing_time = SqlRunner.run(sql, values).first()
    @id = showing_time['id'].to_i
  end

  def update
    sql = "UPDATE showing_times SET (start_time) =
    ($1) WHERE id = $2"
    values = [@start_time, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM showing_times WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM showing_times WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def films()
    sql = "SELECT films.title FROM showing_times INNER JOIN screenings on showing_times.id = screenings.showing_time_id INNER JOIN films ON films.id = screenings.film_id WHERE showing_time_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    return Film.map_items(film_hashes)
  end


  # def tickets()
  #   sql = "SELECT tickets.* FROM showing_times INNER JOIN tickets ON showing_times.id = tickets.showing_time_id WHERE showing_times.id = $1"
  #   values = [@id]
  #   ticket_hashes = SqlRunner.run(sql, values)
  #   return Ticket.map_items(ticket_hashes)
  # end



end
