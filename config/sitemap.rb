# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://thinqbt.com"

SitemapGenerator::Sitemap.create do
  add '/posts', :lastmod =>DateTime.now, :changefreq => 'daily', :priority => 1
  add '/subscribe', :changefreq => 'daily'
  add '/contact', :changefreq => 'weekly'
  add posts_path, changefreq: 'always', :priority => 0.8
   Post.find_each do |post|
    add post_path(post.slug), lastmod: post.updated_at, :changefreq => 'daily', :priority => 0.9
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
