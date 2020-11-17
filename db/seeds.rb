# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

post = Post.create({
    title: "How to avoid a Pandas Pandemonium",
    slug: "how-to-avoid-a-pandas-pandemonium",
    subtitle: "A deep dive into common Pandas mistakes and what you can do to avoid them. Part I: Writing good code and spotting silent failures.",
    datetime: "2020-11-15 21:06:00",
    # body
    published: true,
    comments_enabled: true
})


post.hero_image.attach(io: File.open('app/assets/images/panda_pandemonium.jpeg'), filename: 'panda_pandemonium.jpeg', content_type: 'image/jpge')