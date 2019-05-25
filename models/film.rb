require_relative('../db/sql_runner.rb')

class Film
  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    films = Sql_Runner.run(sql, values)[0]
    @id = films['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    Sql_Runner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM films"
    values = []
    films = Sql_Runner.run(sql, values)
    return films.map { |film| Film.new(film) }
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    Sql_Runner.run(sql, values)
  end

#
end
