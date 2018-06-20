require_relative( "../models/customer.rb" )
require_relative( "../models/loan.rb" )
require_relative( "../models/game.rb" )
require_relative( "../models/genre.rb" )
require("pry-byebug")

Loan.delete_all()
Customer.delete_all()
Game.delete_all()
Genre.delete_all()

genre1 = Genre.new({
  'genre' => 'Comedy'
  })

genre2 = Genre.new({
  'genre' => 'Co-operative'
  })

genre3 = Genre.new({
  'genre' => 'Tile-laying'
  })

genre1.save()
genre2.save()
genre3.save()

customer1 = Customer.new({
  'badge_number' => 450,
  'name' => 'Grant Howitt'
  })

customer2 = Customer.new({
  'badge_number' => 451,
  'name' => 'Gav Thorpe'
  })

customer3 = Customer.new({
    'badge_number' => 452,
    'name' => 'Kieron Gillen'
    })

customer1.save()
customer2.save()
customer3.save()

game1 = Game.new({
  'name' => 'Galaxy Trucker',
  'owner' => 'Clare',
  'genre_id' => genre1.id,
  'player_count' => 3,
  'play_time' => 30
  })

game2  = Game.new({
   'name' => 'Mysterium',
   'owner' => 'Wil',
   'genre_id' => genre2.id,
   'player_count' => 5,
   'play_time' => 45
   })

game3 = Game.new({
    'name' => 'Barenpark',
    'owner' => 'Al',
    'genre_id' => genre3.id,
    'player_count' => 4,
    'play_time' => 20
    })

game1.save()
game2.save()
game3.save()

loan1 = Loan.new({
  'customer_id' => customer1.id,
  'game_id' => game1.id,
  'day_borrowed' => 'Saturday'
  })

loan2 = Loan.new({
  'customer_id' => customer2.id,
  'game_id' => game2.id,
  'day_borrowed' => 'Friday',
  'returned' => true
  })

loan1.save()
loan2.save()

binding.pry
nil
