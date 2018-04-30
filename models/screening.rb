require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :screen_no, :seat, :showing_time_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @screen_no = options['screen_no'].to_i
    @seat = options['seat'].to_i
    @showing_time_id = options['showing_time_id']
    @film_id= options['film_id']
  end

  def self.delete_all()
   sql = "DELETE FROM screenings"
   SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings_hashes = SqlRunner.run(sql)
    return self.map_items(screenings_hashes)
  end

  def self.map_items(screenings_hashes)
    result = screenings_hashes.map{|screenings_hash| self.new(screenings_hash)}
    return result
  end


  def save()
    sql = "INSERT INTO screenings (screen_no,seat,showing_time_id,film_id)
          VALUES ($1,$2,$3,$4)
          RETURNING id"
    values = [@screen_no,@seat,@showing_time_id,@film_id]
    screenings = SqlRunner.run(sql, values).first()
    @id = screenings['id'].to_i
  end

  def update
    sql = "UPDATE screenings SET (screen_no,seat,showing_time_id,film_id) =
    ($1,$2,$3,$4) WHERE id = $5"
    values = [@screen_no,@seat,@showing_time_id,@film_id,@id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(screenings_hashes)
    result = screenings_hashes.map{|screenings_hash| self.new(screenings_hash)}
    return result
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def seat_left
    @seat -=1
  end
end
