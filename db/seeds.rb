Movie.destroy_all
Review.destroy_all

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