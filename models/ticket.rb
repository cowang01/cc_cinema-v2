require_relative('../db/sql_runner.rb')

class Ticket
  attr_accessor :customer_id, :show_time_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @show_time_id = options['show_time_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, show_time_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @show_time_id]
    tickets = Sql_Runner.run(sql, values)[0]
    @id = tickets['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    Sql_Runner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM tickets"
    values = []
    tickets = Sql_Runner.run(sql, values)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, show_time_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @show_time_id, @id]
    Sql_Runner.run(sql, values)
  end
#
end
