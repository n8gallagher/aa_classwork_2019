# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' , { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
f = User.create username: 'Freidak' 
pablo = User.create  username: 'Pablop' 
don = User.create  username: 'Donatello'  
mike = User.create  username: 'michelangello-thegreat'  
andy = User.create  username: 'worholfan' 

Artwork.delete_all

selfie = Artwork.create  title: 'Self-Portrait with Thorn Necklace and Hummingbird', image_url:'https://www.fridakahlo.org/images/paintings/self-portrait-with-necklace-of-thorns.jpg', artist_id: f.id
vie = Artwork.create  title: 'La Vie', image_url:'https://upload.wikimedia.org/wikipedia/en/thumb/1/11/La_Vie_by_Pablo_Picasso.jpg/210px-La_Vie_by_Pablo_Picasso.jpg', artist_id: pablo.id
dave = Artwork.create  title: 'David', image_url:'https://i.ytimg.com/vi/6kUUJJV_MNA/maxresdefault.jpg', artist_id: don.id
ceil = Artwork.create  title: 'Sistine Ceiling', image_url:'https://www.history.com/.image/t_share/MTU3ODc4Njg5NjgzNTQ3ODcx/hith-sistine-chape-2.jpg', artist_id: mike.id
soup = Artwork.create  title: 'Campbell Soup', image_url:'https://www.christies.com/img/LotImages/2010/NYR/2010_NYR_02355_0012_000(andy_warhol_campbells_soup_can).jpg', artist_id: andy.id

ArtworkShare.delete_all

artwork_shares = ArtworkShare.create([ {artwork_id: dave.id, viewer_id: f.id}, 
                                         {artwork_id: dave.id, viewer_id: pablo.id}, 
                                         {artwork_id: dave.id, viewer_id: don.id}, 
                                         {artwork_id: dave.id, viewer_id: andy.id}, 
                                         {artwork_id: andy.id, viewer_id: f.id}])