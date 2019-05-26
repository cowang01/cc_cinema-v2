require_relative('../db/sql_runner')

class Film_Time
  attr_accessor :film_id, :show_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @show_time = options['show_time']
  end

  def save()
    sql = "INSERT INTO film_times (film_id, show_time) VALUES ($1, $2) RETURNING id;"
    values = [@film_id, @show_time]
    film_times = Sql_Runner.run(sql, values)[0]
    @id = film_times['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM film_times"
    values = []
    Sql_Runner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM film_times"
    values = []
    film_times = Sql_Runner.run(sql, values)
    return film_times.map { |film_time| Film_Time.new(film_time) }
  end

  def update()
    sql = "UPDATE film_times SET (film_id, show_time) = ($1, $2) WHERE id = $3"
    values = [@film_id, @show_time, @id]
    Sql_Runner.run(sql, values)
  end

end
