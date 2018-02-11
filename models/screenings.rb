require_relative('../db/sql_runner')

class Screening

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @showing = options['showing']
    @ticket_id = options['ticket_id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i

  end


end
