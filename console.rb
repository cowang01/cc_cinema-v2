require('pg')
require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')
require_relative('./models/film_time.rb')

Ticket.delete_all
Film_Time.delete_all
Customer.delete_all
Film.delete_all


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

film11_times = Film_Time.new({
  'film_id' => film1.id,
  'show_time' => '16:00'
  })
film11_times.save()

film12_times = Film_Time.new({
  'film_id' => film1.id,
  'show_time' => '17:00'
  })
film12_times.save()

film13_times = Film_Time.new({
  'film_id' => film1.id,
  'show_time' => '12:00'
  })
film13_times.save()

film21_times = Film_Time.new({
  'film_id' => film2.id,
  'show_time' => '14:30'
  })
film21_times.save()

film22_times = Film_Time.new({
  'film_id' => film2.id,
  'show_time' => '19:30'
  })
film22_times.save()

# ticket1 = Ticket.new({
#   'customer_id' => customer1.id,
#   'film_id' => film2.id
#   })
# ticket1.save()
ticket1 = customer1.sale(film22_times)

# ticket2 = Ticket.new({
# 'customer_id' => customer2.id,
# 'film_id' => film2.id
# })
# ticket2.save()
ticket2 = customer2.sale(film21_times)

# ticket3 = Ticket.new({
# 'customer_id' => customer3.id,
# 'film_id' => film1.id
# })
# ticket3.save()
ticket3 = customer3.sale(film11_times)

# ticket4 = Ticket.new({
# 'customer_id' => customer4.id,
# 'film_id' => film2.id
# })
# ticket4.save()
ticket4 = customer4.sale(film22_times)

film2.price = 12
film2.update()

customer4.funds = 20
customer4.update()

ticket2.show_time_id = film22_times.id
ticket2.update()

#test
Ticket.view_all()
Film.view_all()
Customer.view_all()
#

second_customer_films = customer2.films_list()
first_film_customers = film1.customers_list()

all_customers1 = film1.customer_count()
customer1_tickets = customer1.films_list().count

film11_times.show_time = '18:00'
film11_times.update()

show_times_1 = film1.show_times()

binding.pry
nil
