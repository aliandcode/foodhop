require 'faker'
require 'date'

Review.destroy_all
Order.destroy_all
DishAvailability.destroy_all
Dish.destroy_all
User.destroy_all

cook_category = ["hobbyist", "professional cook"]

array_user = [
{ first_name: "Gregorio",
  last_name: "Fracassi",
  photo: "https://avatars2.githubusercontent.com/u/44582817?v=4",
  email: "gre.fra@gmail.com",
  password: "123456",
  phone_number: "+39-350-5555-90",
  category: "Amateur",
  bio: "Very good italian Food",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Ali",
  last_name: "Abbas",
  photo: "https://avatars1.githubusercontent.com/u/18402851?v=4",
  email: "ali.a@gmail.com",
  password: "123456",
  phone_number: "+39-313-5555-242",
  category: "Amateur",
  bio: "Make the best hummus ever",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Adam",
  last_name: "Somora",
  photo: "https://avatars1.githubusercontent.com/u/37966273?v=4",
  email: "adamsomsom@gmail.com",
  password: "123456",
  phone_number: "+39-371-0555-5789",
  category: "Amateur",
  bio: "Expert in sandwich preparation",
  address: "52 Corso Magenta, Milano, Italy",
  is_chef: true,
},
{ first_name: "Aymeric",
  last_name: "Azan",
  photo: "https://avatars0.githubusercontent.com/u/50101174?v=4",
  email: "aymeric@gmail.com",
  password: "123456",
  phone_number: "+39-311-0555-571",
  category: "Amateur",
  bio: "Makes the best fondue from Switzerland",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Francesco",
  last_name: "Ecclesie",
  photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/kjacdhhsb16lj3x3uif0.jpg",
  email: "Fra@gmail.com",
  password: "123456",
  phone_number: "+39-324-5555-896",
  category: "Amateur",
  bio: "Banana all the way!",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Sebastien",
  last_name: "Saunier",
  photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/lxpghuy9ljoa9mcwrrby.jpg",
  email: "sebastien.s@gmail.com",
  password: "123456",
  phone_number: "+39-313-5554-76",
  category: "Professional",
  bio: "Very good chef from Paris",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Angelo",
  last_name: "Colardo",
  photo: "https://avatars0.githubusercontent.com/u/47533338?v=4",
  email: "angelo.c@gmail.com",
  password: "123456",
  phone_number: "+39-371-1555-76",
  category: "Amateur",
  bio: "Make the best italian food",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Alexander",
  last_name: "Hill",
  photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/j8jofdljsj0jp1yhehum.jpg",
  email: "alexhill@gmail.com",
  password: "123456",
  phone_number: "+39-350-5555-1160",
  category: "Amateur",
  bio: "Italian food amateur from Manchester",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Luigi",
  last_name: "Manganiello",
  photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/jfxxykkc6fxrdbghzjuo.jpg",
  email: "luigi@gmail.com",
  password: "123456",
  phone_number: "+39-380-5552-97",
  category: "Amateur",
  bio: "Looking for good food around home",
  is_chef: false,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Arbi",
  last_name: "Velaj",
  photo: "https://avatars2.githubusercontent.com/u/26385065?v=4load/c_fill,g_face,h_200,w_200/jfxxykkc6fxrdbghzjuo.jpg",
  email: "arbi@gmail.com",
  password: "123456",
  phone_number: "+39-311-0055-518",
  category: "Professional",
  bio: "Make the best salads",
  is_chef: true,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Pietro",
  last_name: "Ventimiglia",
  photo: "https://avatars1.githubusercontent.com/u/50101372?v=4",
  email: "pietro@gmail.com",
  password: "123456",
  phone_number: "+39-311-0055-518",
  category: "Amateur",
  bio: "Like to discover new dishes",
  is_chef: false,
  address: "52 Corso Magenta, Milano, Italy"
},
{ first_name: "Alessio",
  last_name: "Bezzi",
  photo: "https://avatars1.githubusercontent.com/u/50101065?v=4",
  email: "bezzi@gmail.com",
  password: "123456",
  phone_number: "+39-330-5553-8272",
  category: "Amateur",
  bio: "Downloaded the app but still think that Fidelis is better",
  is_chef: false,
  address: "52 Corso Magenta, Milano, Italy"
}
]

array_user.each do |user|

u = User.new(first_name: user[:first_name],
            last_name: user[:last_name],
            photo: user[:photo],
            email: user[:email],
            password: user[:password],
            phone_number: user[:phone_number],
            category: user[:category],
            bio: user[:bio],
            is_chef: user[:is_chef],
            address: user[:address])
u.save!

end



#############################################

allergens = ["Cereals containing gluten", "Crustaceans", "Eggs", "Fish", "Peanuts", "Soybeans", "Milk", "Nuts", "Celery", "Mustard", "Sesame seeds", "Sulphur dioxide and sulphites", "Lupin", "Molluscs"]
cuisine = []


array_dish = [
{ title: "Banana Split",
  ingredients: "Banana, Chocolate and love",
  photo: "https://www.academiedugout.fr/images/50593/948-580/banana-split-def.jpg?poix=50&poiy=50",
  user: User.where(is_chef: true).sample,
  allergens: "Cereals containing gluten",
  cuisine: "Dessert",
  price: 6,
},
{ title: "Pizza napoletana",
  ingredients: "Tomato, Mozarella, Black Olives, Anchovy",
  photo: "http://2.citynews-udinetoday.stgy.ovh/~media/original-hi/44502032175963/pizza-napoletana-2.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Milk",
  cuisine: "Italian",
  price: 11,
},
{ title: "Hummus",
  ingredients: "Chickpeas, Garlic, Cumin, Tahini",
  photo: "https://www.cookingclassy.com/wp-content/uploads/2014/03/hummus-31.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "gluten",
  cuisine: "Libanese",
  price: 9,
},
{ title: "Poke",
  ingredients: "Salmon, Avocado, Rice, Soya",
  photo: "https://res.cloudinary.com/serdy-m-dia-inc/image/upload/f_auto/fl_lossy/q_auto:eco/x_0,y_252,w_6000,h_3375,c_crop/w_576,h_324,c_scale/v1534976908/foodlavie/prod/recettes/bol-de-poke-au-saumon-marine-fbb51c81",
  user: User.where(is_chef: true).sample,
  allergens: "Soybeans",
  cuisine: "Japan",
  price: 13,
},
{ title: "Beef tartare",
  ingredients: "Beef, Egg, Salt, Ketchup, Onions",
  photo: "https://jesspryles.com/wp-content/uploads/2015/12/steak-tartare-39.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Eggs",
  cuisine: "European",
  price: 16,
},
{ title: "Spahetti alla Bolognese",
  ingredients: "Spahetti, Beef, Tomato, Onions",
  photo: "https://blog.giallozafferano.it/langolodicristina/wp-content/uploads/2015/08/SPAGHETTI-ALLA-BOLOGNESE.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Gluten",
  cuisine: "Italian",
  price: 7,
},
{ title: "Piadina",
  ingredients: "Ham, Cheese, Olive Oil",
  photo: "https://www.dissapore.com/wp-content/uploads/2018/06/piadina-copertina-1300x867.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "None",
  cuisine: "Italian",
  price: 4,
},
{ title: "Moroccan Couscous",
  ingredients: "Vegetables, Couscous",
  photo: "http://www.authenticworldfood.com/data/r3/00000153-00000327.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Cereals containing gluten",
  cuisine: "Moroccan",
  price: 9,
},
{ title: "Pizza margherita",
  ingredients: "Tomato, Mozarella, Basilic",
  photo: "http://www.gastronauta.it/uploads/thumbs/editor/images/520_280(2)_crsize_820_460.png",
  user: User.where(is_chef: true).sample,
  allergens: "Cereals containing gluten",
  cuisine: "Italian",
  price: 8,
},
{ title: "Risotto alla Milanese ",
  ingredients: "Rice, Cheese, Safran",
  photo: "https://www.eccolecco.it/wp-content/uploads/risotto-giallo.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Milk",
  cuisine: "Italian",
  price: 10,
},
{ title: "Miso soup",
  ingredients: "Water, Vegetables",
  photo: "https://food-images.files.bbci.co.uk/food/recipes/springmisosoup_72270_16x9.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "None",
  cuisine: "Japan",
  price: 4,
},
{ title: "Club Sandwich",
  ingredients: "Ham, Eggs, Salad, Tomato",
  photo: "https://www.lospicchiodaglio.it/img/news/club-sandwich-il-panino-di-new-york.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Eggs",
  cuisine: "European",
  price: 9,
},
{ title: "Sea-bass Ceviche",
  ingredients: "Fish, Avocado, Spices",
  photo: "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F07.2F30.2F2a8fed96-e8b2-4011-825f-dde99156f7eb.2Ejpeg/748x372/quality/80/crop-from/center/ceviche-de-dorade-avocat-coco.jpeg",
  user: User.where(is_chef: true).sample,
  allergens: "None",
  cuisine: "Peruvian",
  price: 11,
},
{ title: "Chicken Noodles",
  ingredients: "Chicken, Vegetables, Rice Noodles, Eggs",
  photo: "https://supervalu.ie/thumbnail/720x400/var/files/good-food-karma/recipe/48779/egg-noodle-stir-fry-recipe-main.jpg?fill=1",
  user: User.where(is_chef: true).sample,
  allergens: "Eggs",
  cuisine: "Asian",
  price: 7,
},
{ title: "schnitzel",
  ingredients: " Veal Meat",
  photo: "https://www.dessertfortwo.com/wp-content/uploads/2014/12/Schnitzel-2.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "None",
  cuisine: "German",
  price: 9,
},
{ title: "Cordon Bleu",
  ingredients: "Ham, Chicken, Cheese",
  photo: "https://www.feuilledechoux.fr/wp-content/uploads/2013/03/recette-cordon-bleu-maison.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Milk",
  cuisine: "French",
  price: 5,
},
{ title: "Spare Ribs",
  ingredients: "Porc meet, Spices",
  photo: "https://img.taste.com.au/eVxpCYaO/taste/2016/11/chipotle-pork-ribs-103431-1.jpeg",
  user: User.where(is_chef: true).sample,
  allergens: "None",
  cuisine: "American",
  price: 8,
},
{ title: "Spaghetti alla vongole",
  ingredients: "Spaghetti, Garlic, Pepper, Clams",
  photo: "https://wips.plug.it/cips/buonissimo.org/cms/2012/04/spaghetti-alle-vongole.jpg?w=712&a=c&h=406",
  user: User.where(is_chef: true).sample,
  allergens: "Crustaceans",
  cuisine: "Italian",
  price: 13,
},
{ title: "Ratatouille",
  ingredients: "Vegetables, Rosemary, Olive Oil",
  photo: "http://www.delonghi.com/Global/recipes/multifry/10.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "None",
  cuisine: "French",
  price: 12,
},
{ title: "Parmigiana",
  ingredients: "Eggplant, Potatoes, Cheese",
  photo: "https://www.puglia.com/wp-content/uploads/2017/10/melanzane-di-sant-oronzo-salento-ricetta.jpg",
  user: User.where(is_chef: true).sample,
  allergens: "Milk",
  cuisine: "Italian",
  price: 12,
}
]

array_dish.each do |dish|

d = Dish.new(title: dish[:title],
            ingredients: dish[:ingredients],
            photo: dish[:photo],
            user_id: dish[:user].id,
            allergens: dish[:allergens],
            price: dish[:price])

d.cuisine << dish[:cuisine]
d.save!

end

#######################################

60.times do
  review = Review.new
  review.stars = rand(1..5)
  review.comment = Faker::Restaurant.review
  review.user = User.all.sample
  review.dish = Dish.all.sample
  review.save!
end

30.times do
  dish_availability = DishAvailability.new
  dish_availability.date = Time.at(rand * (Time.now.to_f - 0.0.to_f))
  dish_availability.portion_available = "#{rand(1..12)} servings"
  dish_availability.dish = Dish.all.sample
  dish_availability.price = rand(25..200)/10.0
  dish_availability.save!
end

40.times do
  order = Order.new
  order.user = User.all.sample
  order.dish_availability = DishAvailability.all.sample
  order.status = ["pending", "archived"][rand(0..1)]
  order.save!
end



