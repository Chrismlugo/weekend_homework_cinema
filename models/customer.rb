require_relative('../db/sql_runner')


class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name,@funds, @id]
    SqlRunner.run(sql, values)
  end

  # def update_wallet()
  #   sql = "UPDATE customers SET funds = (funds - $1) WHERE id = $2"
  #   values = [tickets.films.price, tickets.film_id]
  #   SqlRunner.run(sql, values)
  #
  # end

  # def ticket_count
  #
  # end


  def delete()
    sql = "DELETE FROM customers where id = $1"
    values = [@id]
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE tickets.customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end
  
  def tickets_count()
    sql = "SELECT * FROM tickets WHERE tickets.customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{|ticket| Ticket.new(ticket)}.count
  end

  def films()
      sql =
      "SELECT films.*
      FROM films
      INNER JOIN tickets
      ON films.id = tickets.film_id
      WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map{|film| Film.new(film)}
  end


  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end



end
