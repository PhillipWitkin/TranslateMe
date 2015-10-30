# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Card.delete_all
Category.delete_all
User.delete_all
Favorite.delete_all
Tag.delete_all
Translation.delete_all


Card.create(english_phrase: "What time is it?", explanation: "Used when you want to know the time!!!")
Card.create(english_phrase: "WTF", explanation: "Procalamation of surprise and frustration")
Card.create(english_phrase: "My code is broken", explanation: "Used when you are very sad.")
Card.create(english_phrase: "hashtag no thorns", explanation: "All is well; no problems.")

Category.create(category_name: "code")
Category.create(category_name: "WDI")
Category.create(category_name: "Knope")
Category.create(category_name: "if you're ever bored")

User.create(username: "tom_danny", password: "hello", admin: true)
User.create(username: "anna", password: "rockstar", admin: true)
User.create(username: "liz", password: "hello", admin: true)
User.create(username: "phil", password: "hello", admin: true)
User.create(username: "colby", password: "hello", admin: true)

Favorite.create(user_id: 1, card_id: 2)
Favorite.create(user_id: 1, card_id: 3)
Favorite.create(user_id: 2, card_id: 4)
Favorite.create(user_id: 3, card_id: 1)
Favorite.create(user_id: 3, card_id: 2)
Favorite.create(user_id: 3, card_id: 3)
Favorite.create(user_id: 4, card_id: 4)
Favorite.create(user_id: 5, card_id: 2)

Tag.create(card_id: 1, category_id: 1)
Tag.create(card_id: 2, category_id: 2)
Tag.create(card_id: 3, category_id: 3)
Tag.create(card_id: 4, category_id: 4)

Translation.create(card_id: 2, user_id: 1, translation: "Koji kurac", language: "Croatian", phonetic: "Koh-yee koohratz", meaning: "Which dick??")
Translation.create(card_id: 2, user_id: 2, translation: "他妈的", language: "Chinese", phonetic: "Tā mā de?", meaning: "His/her mom's, darn it")
Translation.create(card_id: 1, user_id: 1, translation: "Koliko je sati?", language: "Croatian", phonetic: "Koh-leeko ye saati?", meaning: "How much hours?")
Translation.create(card_id: 1, user_id: 3, translation: "¿Qué hora es?", language: "Spanish", phonetic: "Kay ora es?", meaning: "What hour is it?")
Translation.create(card_id: 3, user_id: 4, translation: "Moji kodovi su razbijeni", language: "Croatian", phonetic: "Moyee kodovi su raz-bee-yeni", meaning: "My code is broken")