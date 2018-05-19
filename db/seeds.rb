User.create!(
      email: "bb.campbell606@gmail.com",
      password: "password",
      password_confirmation: "password",
      name: "Bob McTest",
      roles: "user"
  )


Topic.create!(
      title: "debugging"
    )

Topic.create!(
      title: "development"
    )

Topic.create!(
      title: "best practices"
    )

Topic.create!(
      title: "live to ride"
    )

Topic.create!(
      title: "music"
    )

puts "4 Topics created"

4.times do |blog|
  Blog.create!(
      title: "My Blog Post #{blog}",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      description: "I made a bunch of dummy data, and this is one of the items",
      topic_id: Topic.first.id
    )
end

puts "blog posts created"


Skill.create!(
  title: "Rails",
  percent_utilized: 90
)  
Skill.create!(
  title: "Ruby",
  percent_utilized: 75
)
Skill.create!(
  title: "HTML/CSS",
  percent_utilized: 100
)
  Skill.create!(
  title: "JS/Jquery",
  percent_utilized: 60
)
    Skill.create!(
  title: "PHP",
  percent_utilized: 60
)

puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create!(
      title: "Portfolio title: #{portfolio_item}",
      subtitle: "Ruby on Rails",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      main_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=600×400&w=600&h=400",
      thumb_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350×200&w=350&h=200"
    )
end

puts "9 portfolio items created"


3.times do |technology|
  Portfolio.last.technologies.create!(
      name: "Technology #{technology}"
    )

end

puts "Created 3 technologies"

