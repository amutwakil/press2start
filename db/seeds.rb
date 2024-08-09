# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


#fun_factor_rating
# has_many ratings
# 	| id | option
# 	------------------------------------------------
# 	| 1  |  "LIT 🔥🔥"
# 	| 2  |   "meh 😐"
# 	| 3  |   "hot garbage 🚮"

#replayability_rating
# has_many ratings
# 	| id   |  option
# 	------------------------------------------------
# 	| 1   | "run it back 🏃‍🏃‍"
# 	| 2   | "one & done"

#endgame_appeal_rating
# has_many ratings
# 	| id |  option
# 	------------------------------------------------
# 	| 1	 |  "without question ❔"
# 	| 2  |  "if I had more time ⌚"

# rating_sets
# belongs_to game
# belongs to :fun_factor_rating
# 	\ id \ game_id \ fun_factor_rating_id \ replayability_rating_id   \ endgame_appeal_rating_id
# 	------------------------------------------------------------------------------------------------
# 	\ 1   \ 10      \ 2 ('meh')                   \ 2 ('one & done')                  \ 1 ("without question")
#   \ 2    \ 15      \ 2 ('meh')                   \ 1 ('run it back')                 \ 2 ('if I had more time')

Platform.create(display_name: "PlayStation 1")
Developer.create(display_name: "Konami")
Publisher.create(display_name: "Konami")
Genre.create(name: "action")
genres = %w(arcade platformer fighting racing shooter sports survival horror action adventure beat-em-up
puzzler mmo moba rpg strategy)
genres << "battle royale"
genres.each do |genre|
  Genre.create(name: genre)
end
Game.create(title: "Metal Gear Solid 1",
            summary: "a masterpiece in narrative & action",
            year: 1998,
            review: "The one that started it all",
            genre: Genre.last,
            publisher: Publisher.last,
            developer: Developer.last,
            platform: Platform.last
)