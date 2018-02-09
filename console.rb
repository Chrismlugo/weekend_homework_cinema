require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

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












binding.pry

nil
