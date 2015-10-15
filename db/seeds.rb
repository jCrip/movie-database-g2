Movie.destroy_all
Review.destroy_all
Genre.destroy_all

movies = []

(1..50).each do |m|
  movies << Movie.create(
      title: Faker::Company.name,
      description: Faker::Lorem.paragraph(3),
      realease_date: Faker::Date.between(20.years.ago, 1.week.ago),
      studio: Faker::Name.name
    )
end

reviews = []

(1..200).each do |r|
  reviews << Review.create(
      content: Faker::Lorem.paragraph(3),
      movie: movies[rand(movies.length)]
    )
end

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