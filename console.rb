require('pg')
require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

Customer.delete_all
Film.delete_all
Ticket.delete_all

customer1 = Customer.new({
  'name' => 'James Holt',
  'funds' => 50
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Lawrence Brown',
  'funds' => 80
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Linda Brown',
  'funds' => 70
  })
customer3.save()

customer4 = Customer.new({
  'name' => 'Mhari Hepburn',
  'funds' => 70
  })
customer4.save()

film1 = Film.new({
  'title' => 'The Last Jaws',
  'price' => 16
  })
film1.save()

film2 = Film.new({
  'title' => 'Bittersweet',
  'price' => 8
  })
film2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })
ticket1.save()

ticket2 = Ticket.new({
'customer_id' => customer2.id,
'film_id' => film2.id
})
ticket2.save()

ticket3 = Ticket.new({
'customer_id' => customer3.id,
'film_id' => film1.id
})
ticket3.save()

ticket4 = Ticket.new({
'customer_id' => customer4.id,
'film_id' => film2.id
})
ticket4.save()


film2.price = 12
film2.update()

customer4.funds = 20
customer4.update()

ticket2.film_id = film1.id
ticket2.update()

Ticket.view_all()
Film.view_all()
Customer.view_all()

second_customer_films = customer2.films()
first_film_customers = film1.customers()

binding.pry
nil
