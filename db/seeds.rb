# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.delete_all

# Article Title data
bus = %w(Microsoft Apple Google Mashable Lifehacker McDonalds Applebees Facebook Twitter Engadget Amazon)
apps = %w(Chrome Safari Netscape Headphones Opera Firefox Spotify Youtube Terminal Office)
types = %w(Escalation Passwords Accounts Procedures Assignment Outages Problems Issues Puppies)
locations = %w(Connecticut Maine Vermont Florida Texas Washington Springfield Gotham Metropolis)

kba = 0

bus.each do |bu|
  apps.each do |app|
    types.each do |type|
      locations.each do |location|
        kba += 1

        title = "#{bu} - #{app} - #{type} - #{location} (#{kba})"
        contents = 
        "<h4>Section 1</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum purus lectus, nec suscipit orci pulvinar vel. Nunc pharetra, risus ut congue posuere, erat mi iaculis justo, nec tristique nulla mauris vel enim. Praesent eu lorem id tellus ultrices egestas. Nulla malesuada sapien ligula. Nullam aliquam lectus at massa gravida, et elementum augue congue. Donec tempus, massa eget imperdiet pellentesque, nulla risus tincidunt dui, tincidunt dictum ipsum sapien sit amet turpis. Quisque tempor semper euismod. Nam odio lectus, venenatis quis placerat eu, egestas non urna. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse ut diam eu leo blandit iaculis. Donec commodo fermentum lectus, tempus varius dolor rhoncus in. Aenean non magna auctor, commodo libero ut, consequat sapien. Quisque ullamcorper elit id venenatis dictum.</p>
        <h4>Section 2</h4>
        <p>Etiam rutrum cursus ultrices. Nulla facilisi. Nam semper ligula odio, id volutpat ipsum sodales vitae. Cras malesuada, purus at posuere tincidunt, felis eros fringilla nulla, in ultrices quam felis in justo. Morbi vel posuere ligula, a auctor arcu. Pellentesque eget sodales turpis. Mauris mattis malesuada auctor. Etiam tincidunt arcu condimentum libero mattis, quis elementum nulla aliquet. Curabitur eleifend magna ac arcu rhoncus sodales.</p>
        <h4>Section 3</h4>
        <p>Fusce ullamcorper eleifend orci nec rutrum. Nam sed erat erat. Quisque facilisis ut odio ut fermentum. Ut blandit cursus nunc et venenatis. Aenean ornare orci eget augue porta, a laoreet nunc imperdiet. Aliquam pretium diam et sapien placerat vehicula. Donec condimentum orci quis mi tempus, et euismod nulla cursus. Mauris dignissim purus eu augue fringilla, quis tincidunt neque venenatis. Morbi dictum nunc vitae ante fermentum, eu mollis mi accumsan. Duis sagittis metus mauris, sit amet tempus turpis interdum in.</p>"

        Article.create(title: title, kba: kba, content: contents)


      end
    end
  end
end

article = Article.where(kba: 8911).first
article.update(content: "version 2")
article.update(content: "version 3")
