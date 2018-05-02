# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Gossip.destroy_all

# d1 = Director.create(:last_name => "Cameron", :first_name => 	"James")

g1 = Gossip.create(:anonymous_author => "User1", :content => "I'm the first gossip in base !")
g2 = Gossip.create(:anonymous_author => "User2", :content => "I'm the second gossip in base !")
g3 = Gossip.create(:anonymous_author => "User3", :content => "I'm the third gossip in base !")
g4 = Gossip.create(:anonymous_author => "User4", :content => "I'm the fourth gossip in base !")

g1.comments.create(:anonymous_commentor => "Commentor1", :body => "Yeah, you're right")
g1.comments.create(:anonymous_commentor => "Commentor2", :body => "I'm agree")
g1.comments.create(:anonymous_commentor => "Commentor1", :body => "+1")

g3.comments.create(:anonymous_commentor => "Commentor1", :body => "Are you sure ?")
g3.comments.create(:anonymous_commentor => "Commentor2", :body => "Yes !")

g4.comments.create(:anonymous_commentor => "Commentor4", :body => "Am I alone ?")
