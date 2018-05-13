set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'images'

helpers do
  def nav_link(link_text, url, options = {})
    options[:class] ||= ""
    options[:class] << " current" if link_text == current_resource.data.navigation
    link_to(link_text, url, options)
  end
end

activate :blog do |blog|
  blog.name = "words"
  blog.prefix = ""
  blog.sources = "/words/{year}/{month}-{day}-{title}.html"
  blog.permalink = "/words/{year}/{month}/{day}/{title}.html"
  blog.layout = "words_article"
  blog.default_extension = ".md"
  blog.summary_separator = /READMORE/
end
page "/words/feed.xml", layout: false

activate :blog do |blog|
  blog.name = "thoughts"
  blog.prefix = ""
  blog.sources = "/thoughts/{year}/{month}/{day}-{slug}.html"
  blog.default_extension = ".md"

  blog.paginate = true

  blog.layout = "thought"

  # blog.calendar_template = "writing/calendar_template.html"

  blog.permalink = "/thoughts/{year}/{month}/{day}/{slug}.html"
end
page "/thoughts/microblog.rss", layout: false
