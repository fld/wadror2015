# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Style.create name:"Lager", desc:'Lagers are brewed with bottom fermenting yeast that work slowly at around 34 degrees F, and are often further stored at cool temperature to mature.'
Style.create name:"Pale Ale", desc:'Of British origin, this style is now popular worldwide and the use of local ingredients, or imported, produces variances in character from region to region.'
Style.create name:"Weizen", desc:'A more powerful Dunkel Weizen (of "bock strength"), with a pronounced estery alcohol character, perhaps some spiciness from this, and bolder and more complex malt characters of dark fruits.'
Style.create name:"Porter", desc:'Inspired from the now wavering English Porter, the American Porter is the ingenuous creation from that.'
Style.create name:"IPA", desc:'This category of beer uses yeast that ferments at the "top" of the fermentation vessel, and typically at higher temperatures than lager yeast (60°-75°F), which, as a result, makes for a quicker fermentation period (7-8 days, or even less).'

b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042
b4 = Brewery.create name:"BrewDog", year:2007

b1.beers.create name:"Iso 3", style_id:1
b1.beers.create name:"Karhu", style_id:1
b1.beers.create name:"Tuplahumala", style_id:1
b2.beers.create name:"Huvila Pale Ale", style_id:2
b2.beers.create name:"X Porter", style_id:4
b3.beers.create name:"Hefezeizen", style_id:3
b3.beers.create name:"Helles", style_id:1

u1 = User.create! username:"test1", password:"Test1", password_confirmation:"Test1"
u2 = User.create! username:"test2", password:"Test2", password_confirmation:"Test2"
u3 = User.create! username:"test3", password:"Test3", password_confirmation:"Test3"