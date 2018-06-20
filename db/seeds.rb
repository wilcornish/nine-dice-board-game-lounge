require_relative( "../models/customer.rb" )
require_relative( "../models/loan.rb" )
require_relative( "../models/game.rb" )
require_relative( "../models/genre.rb" )
require_relative( "../models/play_time.rb" )
require_relative("../models/player_count.rb")
require("pry-byebug")

Loan.delete_all()
Customer.delete_all()
Game.delete_all()
Genre.delete_all()
PlayTime.delete_all()
PlayerCount.delete_all()

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

play_time1 = PlayTime.new({
  'play_time' => 20
  })

play_time2 = PlayTime.new({
  'play_time' => 30
  })

play_time3 = PlayTime.new({
  'play_time' => 45
  })


play_time1.save
play_time2.save
play_time3.save

player_count1 = PlayerCount.new({
  'player_count' => 3
  })

player_count2 = PlayerCount.new({
  'player_count' => 4
  })

player_count3 = PlayerCount.new({
  'player_count' => 5
  })

player_count1.save
player_count2.save
player_count3.save

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
  'player_count_id' => player_count1.id,
  'play_time_id' => play_time2.id
  })

game2  = Game.new({
   'name' => 'Mysterium',
   'owner' => 'Wil',
   'genre_id' => genre2.id,
   'player_count_id' => player_count3.id,
   'play_time_id' => play_time3.id
   })

game3 = Game.new({
    'name' => 'Barenpark',
    'owner' => 'Al',
    'genre_id' => genre3.id,
    'player_count_id' => player_count2.id,
    'play_time_id' => play_time1.id
    })

game4 = Game.new({
    'name' => 'Azul',
    'owner' => 'Wil',
    'genre_id' => genre3.id,
    'player_count_id' => player_count3.id,
    'play_time_id' => play_time2.id
    })


game5 = Game.new({
    'name' => 'Pandemic',
    'owner' => 'Dave',
    'genre_id' => genre2.id,
    'player_count_id' => player_count2.id,
    'play_time_id' => play_time3.id
    })

game6= Game.new({
    'name' => 'Space Alert',
    'owner' => 'Tom',
    'genre_id' => genre1.id,
    'player_count_id' => player_count1.id,
    'play_time_id' => play_time2.id
    })


game7 = Game.new({
    'name' => 'Dr Panic',
    'owner' => 'Clare',
    'genre_id' => genre1.id,
    'player_count_id' => player_count2.id,
    'play_time_id' => play_time1.id
    })


game8 = Game.new({
    'name' => 'Sub Terra',
    'owner' => 'Alfred',
    'genre_id' => genre3.id,
    'player_count_id' => player_count3.id,
    'play_time_id' => play_time3.id
    })


game9 = Game.new({
    'name' => 'FUSE',
    'owner' => 'Clare',
    'genre_id' => genre2.id,
    'player_count_id' => player_count2.id,
    'play_time_id' => play_time1.id
    })

game1.save()
game2.save()
game3.save()
game9.save()
game8.save()
game7.save()
game6.save()
game5.save()
game4.save()

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
