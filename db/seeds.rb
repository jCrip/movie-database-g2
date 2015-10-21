User.destroy_all
Movie.destroy_all
Review.destroy_all
Genre.destroy_all

users = []

users << User.create(
  name: 'Juan Cristobal',
  lastname: 'Pazos',
  username: 'juancri',
  email: 'admin@imdb.com',
  password: 'password',
  role: 'admin'
)
users << User.create(
  name: 'Maida',
  lastname: 'Claro',
  username: 'mai_clear',
  email: 'editor@imdb.com',
  password: 'password',
  role: 'editor'
)
users << User.create(
  name: 'Carlos',
  lastname: 'Anderson',
  username: 'neo',
  email: 'basic@imdb.com',
  password: 'password',
  role: 'basic'
)

genres = []

genres << Genre.create(name: 'Action')
genres << Genre.create(name: 'Comedy')
genres << Genre.create(name: 'ScyFy')
genres << Genre.create(name: 'Horror')
genres << Genre.create(name: 'Drama')
genres << Genre.create(name: 'Adventure')
genres << Genre.create(name: 'Thriller')
genres << Genre.create(name: 'Documental')
genres << Genre.create(name: 'Musical')
genres << Genre.create(name: 'Animated')

studios = ['American International Pictures', 'Blinding Edge Pictures', 'Blue Sky Studios', 'CBS Films', 'Cinemation Industries', 'Columbia Pictures Industries, Inc.', 'Compass International Pictures', 'Dimension Films', 'DreamWorks', 'Electric Entertainment', 'Embassy Pictures', 'Five & Two Pictures', 'Four Star Television', 'Fox Film Corporation', 'Fox Searchlight Pictures', 'Goldwyn Pictures', 'Hallmark Productions', 'Happy Madison Productions', 'Imagine Entertainment', 'Legendary Pictures', 'Lionsgate Entertainment', 'Metro Goldwyn Mayer', 'New Line Cinema', 'Original Film', 'Orion Pictures', 'Paramount Pictures', 'Republic Pictures', 'Skydance Productions', 'Sony Pictures Classics', 'Spyglass Entertainment', 'Square Pictures', 'Twentieth Century-Fox', 'Universal Studios', 'Disneynature', 'Lucasfilm', 'Marvel Studios', 'Pixar', 'Touchstone Pictures', 'Walt Disney Pictures', 'Warner Brothers', 'Western Film Exchange']

movies = []

(1..50).each do |m|
  movies << Movie.create(
    title: Faker::Address.street_name,
    description: Faker::Lorem.paragraph(20, true, 10),
    realease_date: Faker::Date.between(20.years.ago, 1.week.ago),
    studio: studios[rand(studios.length)],
    user: users[rand(users.length)]
  )
end

reviews = []

(1..300).each do |r|
  reviews << Review.create(
    content: Faker::Lorem.paragraph(3),
    movie: movies[rand(movies.length)],
    user: users[rand(users.length)]
  )
end

120.times do
  MovieGenre.create(
    movie: movies.sample,
    genre: genres.sample
  )
end
