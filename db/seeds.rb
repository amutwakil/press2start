# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# game_ratings
# belongs_to :game_rating_combo
#
# 	| id | game_id |game_rating_combo_id
# 	------------------------------------------------
# 	| 1  | 100     | 2
# 	| 2  | 100     | 5
# 	| 3  | 100     | 7
# 	| 4  | 250     | 2
# 	| 5  | 250     | 6
#
# game_rating_combos
# belongs_to :game_rating_category
#
# 	| id | game_rating_category |value |
# 	------------------------------------------------
# 	| 1  | 1				    | "LIT 🔥🔥" (string)
# 	| 2  | 1            | "meh 😐"
# 	| 3  | 1				    | "hot garbage 🚮"
# 	| 4  | 2 				    | "run it back 🏃‍🏃‍"
# 	| 5  | 2 				    | "one & done"
# 	| 6  | 3 				    | "without question ❔"
# 	| 7  | 3 				    | "if I had more time ⌚"
#
# game_rating_categories
#
# 	| id | name |
# 	------------------------------------------------
# 	 | 1 | enjoyment
# 	 | 2 | replayability
# 	 | 3 | worth finishing?

# GameRatingCategory.create(name: "enjoyment")
# GameRatingCategory.create(name: "replayability")
# GameRatingCategory.create(name: "worth finishing?")
# GameRatingCombo.create(game_rating_category: GameRatingCategory.first, value: "LIT 🔥🔥")

GameRatingCategory.create([
                            {name: 'enjoyment'},
                            {name: 'replayability'},
                            {name: "worth finishing?"}])

combos = ["LIT 🔥🔥", "meh 😐", "hot garbage 🚮"] #🈳🈳🈳🈳🈳 make this multidimensional to refactor

combos.each do |x|
  GameRatingCombo.create(game_rating_category: GameRatingCategory.first, value: x)
end

combos = ["run it back 🏃‍🏃‍", "one & done"]

combos.each do |x|
  GameRatingCombo.create(game_rating_category: GameRatingCategory.second, value: x)
end

combos = ["without question ❔", "if I had more time ⌚"]

combos.each do |x|
  GameRatingCombo.create(game_rating_category: GameRatingCategory.third, value: x)
end

Platform.create(name: "PC")
Platform.create(name: "PlayStation 1")
Developer.create(name: "Konami")
Publisher.create(name: "Konami")
Genre.create(name: "Action")
Game.create(title: "Metal Gear Solid 1", year: 1998, review: "The one that started it all",
            platform: Platform.last, developer: Developer.last,
            publisher: Publisher.last, genre: Genre.last)
combos = []
combos.push(GameRatingCombo.find(1))
combos.push(GameRatingCombo.find(4))
combos.push(GameRatingCombo.find(6))
combos.each do |x|
  GameRating.create(game: Game.last, game_rating_combo: x)
end
genres = %w(arcade platformer fighting racing shooter sports survival horror action adventure beat-em-up
puzzler mmo moba rpg strategy)
genres << "battle royale"
genres.each do |genre|
  Genre.create(name: genre)
end