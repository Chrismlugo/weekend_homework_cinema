require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require ('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new(
  {
    'name' => 'Bilbo',
    'funds' => 30.00
  }
)
customer1.save()
customer2 = Customer.new(
  {
    'name' => 'Saruman',
    'funds' => 30.00
  }
)
customer2.save()
customer3 = Customer.new(
  {
    'name' => 'Chris',
    'funds' => 30.00
  }
)
customer3.save()

film1 = Film.new(
  {
    'title' => 'Forrest Gump',
    'price' => 10

    })
    film1.save()
film2 = Film.new(
  {
    'title' => 'No Country for old Men',
    'price' => 10
    })
    film2.save()
film3 = Film.new(
  {
    'title' => 'The Room(3D)',
    'price' => 15
    })
    film3.save()

    ticket1 = Ticket.new(
      {
        'customer_id' => customer1.id, 'film_id' => film2.id
      }
    )
    ticket1.save()

    ticket2 = Ticket.new(
      {
        'customer_id' => customer2.id, 'film_id' => film3.id
      }
    )
    ticket2.save()

    ticket3 = Ticket.new(
      {
        'customer_id' => customer3.id, 'film_id' => film1.id
      }
    )
    ticket3.save()

    ticket4 = Ticket.new(
      {
        'customer_id' => customer2.id, 'film_id' => film1.id
      }
    )
    ticket4.save()


    customer1.name = 'Bilbo Baggins'
    customer1.update()

    screening1 = Screening.new({
      'showing' => '18:00',
      'ticket_id' => ticket2.id
    }
    )
    screening1.save()

    screening2 = Screening.new({
      'showing' => '21:30',
      'ticket_id' => ticket1.id
    }
    )
    screening2.save()

    screening3 = Screening.new({
      'showing' => '20:20',
      'ticket_id' => ticket3.id
    }
    )
    screening3.save()

    ticket1.purchase()
    ticket2.purchase()
    ticket3.purchase()
    ticket4.purchase()













binding.pry

nil
