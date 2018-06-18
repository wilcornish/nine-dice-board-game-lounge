require_relative( "../models/customer.rb" )
require_relative( "../models/loan.rb" )
require_relative( "../models/game.rb" )
require("pry-byebug")

Loan.delete_all()
Customer.delete_all()
Game.delete_all()

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
  'genre' => 'Comedy',
  'player_count' => 3,
  'play_time' => 30
  })

game2  = Game.new({
   'name' => 'Mysterium',
   'owner' => 'Wil',
   'genre' => 'co-operative',
   'player_count' => 5,
   'play_time' => 45
   })

game3 = Game.new({
    'name' => 'Barenpark',
    'owner' => 'Al',
    'genre' => 'tile-laying',
    'player_count' => 4,
    'play_time' => 20
    })

game1.save()
game2.save()
game3.save()

loan1 = Loan.new({
  'customer_id' => customer1.id,
  'game_id' => game1.id,
  'day_borrowed' => "Saturday"
  })

loan1.save()

binding.pry
nil
