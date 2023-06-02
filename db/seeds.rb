# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

puts "destroying all bookings"
Booking.destroy_all

puts "destroying all ads"
Ad.destroy_all

puts "destroying all users"
User.destroy_all

puts "starting seeding"

puts "seeding users"
cdion = User.create!(email: "celine.dion@gmail.com", password: "123456", first_name: "Céline", last_name: "Dion")
celine = User.create!(email: "celine.chader@gmail.com", password: "123456", first_name: "Céline", last_name: "Chader")
boubou = User.create!(email: "boubouboubs@gmail.com", password: "123456", first_name: "Stéphanie", last_name: "Boubou")
armelle = User.create!(email: "armelle.rabbani@gmail.com", password: "123456", first_name: "Armelle", last_name: "Rabbani")
amal = User.create!(email: "amal.rabbani@gmail.com", password: "123456", first_name: "Amal", last_name: "Rabbani")
david = User.create!(email: "david.serrano@gmail.com", password: "123456", first_name: "David", last_name: "Serrano")
baptiste = User.create!(email: "baptiste@lewagon.com", password: "123456", first_name: "Baptiste", last_name: "Lewagon")

cdion.photo.attach(io: File.open('app/assets/images/cdion.jpg'), filename: "#{cdion.first_name}.jpg")
celine.photo.attach(io: File.open('app/assets/images/celine.jpg'), filename: "#{celine.first_name}.jpg")
boubou.photo.attach(io: File.open('app/assets/images/boubou.jpg'), filename: "#{boubou.first_name}.jpg")
armelle.photo.attach(io: File.open('app/assets/images/armelle.jpg'), filename: "#{armelle.first_name}.jpg")
david.photo.attach(io: File.open('app/assets/images/david.jpg'), filename: "#{david.first_name}.jpg")
baptiste.photo.attach(io: File.open('app/assets/images/baptiste.jpg'), filename: "#{baptiste.first_name}.jpg")

puts "seeding ads"
file = URI.open('https://bjs-materiel-tp.fr/7849-thickbox_default/diable-multi-taches-altrad-avec-bavette-rabattable-et-roues-pleines-250-kg.jpg')
ad_cdion1 = Ad.create!(
  name: "Diable multi-tâches",
  category: "Diable",
  user: cdion,
  description: "Diable avec bavette repliable, max. 300 kg, hauteur 1100 mm, roues increvables, poignées de sécurité.",
  address: "12 rue de Rivoli, Paris",
  price: 10
)
ad_cdion1.photos.attach(io: file, filename: "#{ad_cdion1.name}.jpg", content_type: "image/jpg")

file = URI.open('https://www.manutan.fr/fstrz/r/s/www.manutan.fr/img/S/GRP/ST/AIG7413829.jpg?frz-v=80')
ad_cdion2 = Ad.create!(
  name: "Bétonnière jaune",
  category: "Bétonnière",
  user: cdion,
  description: "Belle bétonnière jaune presque neuve avec volant démultiplié pour les travaux de construction. Disponible tout de suite",
  address: "30 rue de Longchamp, Paris",
  price: 110
)
ad_cdion2.photos.attach(io: file, filename: "#{ad_cdion2.name}.png", content_type: "image/png")

file = URI.open('https://www.miotools.fr/thumbnail/d3/b2/f5/1669798465/menzer_lhs225_vcm530pro_hauptbild_geraeteansicht_72dpi_1100x1100px_nl_1920x1920.jpg')
ad_cdion3 = Ad.create!(
  name: "Ponceuse girafe Menzer",
  category: "Ponceuse girafe",
  user: cdion,
  description: "La ponceuse girafe MENZER LHS 225 est conçue pour les travaux de construction à sec, de peinture et de rénovation. Son moteur puissant est optimisé pour les travaux exigeants grâce à son entraînement direct.",
  address: "43 rue Saint Denis, Paris",
  price: 110
)
ad_cdion3.photos.attach(io: file, filename: "#{ad_cdion3.name}.png", content_type: "image/png")

file = URI.open('https://media.adeo.com/marketplace/LMFR/82325623/596189.png?width=650&height=650&format=jpg&quality=80&fit=bounds')
ad_cdion4 = Ad.create!(
  name: "Nettoyeur haute pression électrique",
  category: "Nettoyeur haute pression",
  user: cdion,
  description: "Nettoyeur haute pression électrique STERWINS 135 bars avec enrouleur série STERWINS.3Un confort de nettoyage assuré pour des moyennes surfaces (inférieur à 20m²).Le pistolet et la lance ergonomique de 29cm pour plus de maniabilité",
  address: "44 rue Oberkampf, Paris",
  price: 30
)
ad_cdion4.photos.attach(io: file, filename: "#{ad_cdion4.name}.png", content_type: "image/png")

file = URI.open('https://www.toupour.com/57231-product_page/broyeur-de-vegetaux-a-moteur-essence-7-cv-100-mm.jpg')
ad_cdion5 = Ad.create!(
  name: "Broyeur végétaux quasi-neuf",
  category: "Broyeur végétaux",
  user: cdion,
  description: "Grand débit et facilité d'utilisation, jusqu'à 5 m3/h de rendement, large trémie de remplissage offrant un grand confort de travail.",
  address: "21 rue Bonaparte, Paris",
  price: 203
)
ad_cdion5.photos.attach(io: file, filename: "#{ad_cdion5.name}.png", content_type: "image/png")

file = URI.open('https://www.euro-expos.com/photos/900/tondeuse-thermique-4-1-504mm-218cc-137782.webp')
ad_armelle = Ad.create!(
  name: "Tondeuse thermique en bon état",
  category: "Tondeuse",
  user: armelle,
  description: "Cette tondeuse thermique auto-propulsée est équipée d'un moteur 4 temps OHV d'une cylindrée de 224cc, soit environ 7,5 CV de puissance. Elle est conçue pour les utilisateurs qui veulent une facilité d'utilisation et des résultats de coupe de qualité.",
  address: "3 rue Blanche, Paris",
  price: 25
)
ad_armelle.photos.attach(io: file, filename: "#{ad_armelle.name}.png", content_type: "image/png")

file = URI.open('https://www.cgl.fr/wp-content/uploads/2021/04/MP-07-web-1.jpg')
ad_celine = Ad.create!(
  name: "Mini pelle Yanmar",
  category: "Mini pelle",
  user: celine,
  description: "Mini-pelle 2T500 cabine équipée d’un attache-godet rapide type Morin. Poids : 2 770kg.",
  address: "80 rue de Crimée, Paris",
  price: 195
)
ad_celine.photos.attach(io: file, filename: "#{ad_celine.name}.png", content_type: "image/png")

file = URI.open('https://www.manutan.fr/fstrz/r/s/www.manutan.fr/img/S/GRP/ST/AIG8752468.jpg?frz-v=81')
ad_david = Ad.create!(
  name: "Remorque tout terrain Superhond",
  category: "Remorque",
  user: david,
  description: "Plateforme roulante ABS ultra-solide.
  Étroit pour passer entre toutes les portes.
  Timon de poussée 3 positions.",
  address: "81 bd Ornano, Paris",
  price: 203
)
ad_david.photos.attach(io: file, filename: "#{ad_david.name}.png", content_type: "image/png")

file = URI.open('https://m.media-amazon.com/images/I/712Aw8rCPrL._SL1500_.jpg')
ad_baptiste = Ad.create!(
  name: "Superbe lève plaque rouge",
  category: "Lève plaque",
  user: baptiste,
  description: "Cet appareil pour soulever les panneaux ou plaque de plâtre est vite monté et sert d'aide de montage dans la construction de cloisons intérieures ou cloisons sèches. Il soulève tout.",
  address: "62 rue Alexandre Dumas, Paris",
  price: 19
)
ad_baptiste.photos.attach(io: file, filename: "#{ad_baptiste.name}.png", content_type: "image/png")

# puts "seeding bookings"
# booking1 = Booking.create!(
#   ad_id: ad_celine,
#   user_id: cdion,
#   start_date: "2023-06-12",
#   end_date: "2023-06-16"
# )

# booking2 = Booking.create!(
#   start_date: "2023-06-04",
#   end_date: "2023-06-13"
# )
# booking2.ad = ad_armelle
# booking2.user = cdion

# booking3 = Booking.create!(
#   start_date: "2023-06-02",
#   end_date: "2023-06-05"
# )
# booking3.ad = ad_david
# booking3.user = cdion

# booking4 = Booking.create!(
#   start_date: "2023-08-29",
#   end_date: "2023-08-30"
# )
# booking4.ad = ad_baptiste
# booking4.user = cdion

puts "finished seeding"
