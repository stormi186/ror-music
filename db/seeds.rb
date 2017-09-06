# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'user1', email: 'user1@gmail.com', 
						password: 'password1')
User.create(username: 'user2', email: 'user2@gmail.com', 
						password: 'password2')
User.create(username: 'user3', email: 'user3@gmail.com', 
						password: 'password3')
User.create(username: 'admin1', email: 'admin1@gmail.com', 
						password: 'adminadmin', role: 1)
User.create(username: 'admin2', email: 'admin2@gmail.com', 
						password: 'adminadmin', role: 1)
User.create(username: 'superadmin', email: 'superadmin@gmail.com', 
						password: 'superadmin', role: 2)

Genre.create(name: 'Rock', user_id: 6)
Genre.create(name: 'Pop', user_id: 6)
Genre.create(name: 'Electronic', user_id: 6)
Genre.create(name: 'Jazz', user_id: 6)
Genre.create(name: 'Folk', user_id: 6)
Genre.create(name: 'Indie', user_id: 6)
Genre.create(name: 'RnB', user_id: 6)
Genre.create(name: 'Rap', user_id: 6)
Genre.create(name: 'Dance', user_id: 6)

Artist.create(name: 'Ed Sheeran', picture: 'https://a3-images.myspacecdn.com/images04/6/5942712ded0843c387a877eb995c8b1b/300x300.jpg', user_id: 6)
Album.create(name: 'Divide', cover: 'https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png', year: 2017, artist_id: 1, genre_id: 2, user_id: 6)
Track.create(name: 'Shape of You', youtubelink: 'https://www.youtube.com/watch?v=JGwWNGJdvx8', duration: '4:23', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'Castle on the Hill', youtubelink: 'https://www.youtube.com/watch?v=K0ibBPhiaG0', duration: '4:48', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'How Would You Feel', youtubelink: 'https://www.youtube.com/watch?v=wY473jAptyw', duration: '4:45', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'Galway Girl', youtubelink: 'https://www.youtube.com/watch?v=87gWaABqGYs', duration: '3:20', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'Perfect', youtubelink: 'https://www.youtube.com/watch?v=1UQzJfsT2eo', duration: '4:24', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'New Man', youtubelink: 'https://www.youtube.com/watch?v=EwzD8U4u76k', duration: '3:09', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'Happier', youtubelink: 'https://www.youtube.com/watch?v=8TpcBDJZsJA', duration: '3:28', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'Dive', youtubelink: 'https://www.youtube.com/watch?v=Wv2rLZmbPMA', duration: '3:59', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'Supermarket Flowers', youtubelink: 'https://www.youtube.com/watch?v=bIB8EWqCPrQ', duration: '3:42', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)
Track.create(name: 'What Do I Know', youtubelink: 'https://www.youtube.com/watch?v=6B9J3lEyffA', duration: '3:58', genre_id: 2, artist_id: 1, album_id: 1, user_id: 6)

Artist.create(name: 'Calvin Harris', picture: 'https://a4-images.myspacecdn.com/images04/1/2b69174db2ee4fc494f2667ca48f2820/300x300.jpg', user_id: 6)
Album.create(name: '18 Months', cover: 'http://d3cprjxvoejtmm.cloudfront.net/images/2012/09/disco-calvin-harris-300x300.jpg', year: 2012, artist_id: 2, genre_id: 3, user_id: 6)
Track.create(name: 'Bounce', youtubelink: 'https://www.youtube.com/watch?v=ooZwmeUfuXg', duration: '3:51', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'Feel So Close', youtubelink: 'https://www.youtube.com/watch?v=dGghkjpNCQ8', duration: '4:07', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'We Found Love', youtubelink: 'https://www.youtube.com/watch?v=tg00YEETFzg', duration: '4:36', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'Let\'s Go', youtubelink: 'https://www.youtube.com/watch?v=LYZ6gXWZfZM', duration: '4:07', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'We\'ll Be Coming Back', youtubelink: 'https://www.youtube.com/watch?v=kPC_evpbwDM', duration: '4:08', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'Sweet Nothing', youtubelink: 'https://www.youtube.com/watch?v=17ozSeGw-fY', duration: '4:29', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'I Need Your Love', youtubelink: 'https://www.youtube.com/watch?v=AtKZKl7Bgu0', duration: '3:47', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'Drinking From the Bottle', youtubelink: 'https://www.youtube.com/watch?v=uztCqjxrkjQ', duration: '5:34', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)
Track.create(name: 'Thinking About You', youtubelink: 'https://www.youtube.com/watch?v=cl3b7dDBLpo', duration: '4:37', genre_id: 3, artist_id: 2, album_id: 2, user_id: 6)

Artist.create(name: 'David Guetta', picture: 'https://thumbnailer.mixcloud.com/unsafe/300x300/extaudio/b/2/8/5/37f0-d703-43f2-ac46-65719dacb415', user_id: 6)
Album.create(name: 'Nothing But The Beat', cover: 'https://images-na.ssl-images-amazon.com/images/I/61CiylsB9KL._SY300_QL70_.jpg', year: 2011, artist_id: 3, genre_id: 3, user_id: 6)
Track.create(name: 'Where Them Girls At', youtubelink: 'https://www.youtube.com/watch?v=p4kVWCSzfK4', duration: '3:48', genre_id: 3, artist_id: 3, album_id: 3, user_id: 6)
Track.create(name: 'Little Bad Girl', youtubelink: 'https://www.youtube.com/watch?v=9ha5ujHnYXg', duration: '3:32', genre_id: 3, artist_id: 3, album_id: 3, user_id: 6)
Track.create(name: 'Without You', youtubelink: 'https://www.youtube.com/watch?v=jUe8uoKdHao', duration: '3:31', genre_id: 3, artist_id: 3, album_id: 3, user_id: 6)
Track.create(name: 'Titanium', youtubelink: 'https://www.youtube.com/watch?v=JRfuAukYTKg', duration: '4:06', genre_id: 3, artist_id: 3, album_id: 3, user_id: 6)
Track.create(name: 'Turn me On', youtubelink: 'https://www.youtube.com/watch?v=YVw7eJ0vGfM', duration: '3:31', genre_id: 3, artist_id: 3, album_id: 3, user_id: 6)
Track.create(name: 'I Can Only Imagine', youtubelink: 'https://www.youtube.com/watch?v=TSNerxNwWtU', duration: '3:55', genre_id: 3, artist_id: 3, album_id: 3, user_id: 6)

Artist.create(name: 'Lady Gaga', picture: 'https://lastfm-img2.akamaized.net/i/u/300x300/1623ee43952b4e38ce4d0d66ec1267b0.jpg', user_id: 6)
Album.create(name: 'The Fame Monster', cover: 'https://images-na.ssl-images-amazon.com/images/I/51ZX3PEXBWL._SY300_QL70_.jpg', year: 2009, artist_id: 4, genre_id: 9, user_id: 6)
Track.create(name: 'Bad Romance', youtubelink: 'https://www.youtube.com/watch?v=qrO4YZeyl0I', duration: '5:08', genre_id: 9, artist_id: 4, album_id: 4, user_id: 6)
Track.create(name: 'Telephone', youtubelink: 'https://www.youtube.com/watch?v=EVBsypHzF3U', duration: '9:31', genre_id: 9, artist_id: 4, album_id: 4, user_id: 6)
Track.create(name: 'Alejandro', youtubelink: 'https://www.youtube.com/watch?v=niqrrmev4mA', duration: '8:41', genre_id: 9, artist_id: 4, album_id: 4, user_id: 6)
Track.create(name: 'Dance in the Dark', youtubelink: 'https://www.youtube.com/watch?v=-SBmJvwiDns', duration: '4:52', genre_id: 9, artist_id: 4, album_id: 4, user_id: 6)

Artist.create(name: 'Katy Perry', picture: 'http://akns-images.eonline.com/eol_images/Entire_Site/2015913/rs_300x300-151013131928-600.Katy-Perry-Concert-Chile.ms.101315_copy.jpg', user_id: 6)
Album.create(name: 'Teenage Dream', cover: 'https://i0.wp.com/musicawma.com/wp-content/uploads/2013/08/KATY-PERRY-Teenage-Dream.jpg', year: 2010, artist_id: 5, genre_id: 2, user_id: 6)
Track.create(name: 'California Gurls', youtubelink: 'https://www.youtube.com/watch?v=F57P9C4SAW4', duration: '3:55', genre_id: 2, artist_id: 5, album_id: 5, user_id: 6)
Track.create(name: 'Teenage Dream', youtubelink: 'https://www.youtube.com/watch?v=98WtmW-lfeE', duration: '3:50', genre_id: 2, artist_id: 5, album_id: 5, user_id: 6)
Track.create(name: 'Firework', youtubelink: 'https://www.youtube.com/watch?v=QGJuMBdaqIw', duration: '3:54', genre_id: 2, artist_id: 5, album_id: 5, user_id: 6)
Track.create(name: 'E.T.', youtubelink: 'https://www.youtube.com/watch?v=t5Sd5c4o9UM', duration: '5:09', genre_id: 2, artist_id: 5, album_id: 5, user_id: 6)
Track.create(name: 'Last Friday Night', youtubelink: 'https://www.youtube.com/watch?v=KlyXNRrsk4A', duration: '8:11', genre_id: 2, artist_id: 5, album_id: 5, user_id: 6)
Track.create(name: 'The One That Got Away', youtubelink: 'https://www.youtube.com/watch?v=Ahha3Cqe_fk', duration: '4:51', genre_id: 2, artist_id: 5, album_id: 5, user_id: 6)

