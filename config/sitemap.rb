require 'aws-sdk'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.chancetochance.world"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['AWS_S3_BUCKET']}"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
bucket: ENV["AWS_S3_BUCKET"],
aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
region: ENV["AWS_REGION"])

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  #Defaults: :priority => 0.5, :changefreq => 'weekly',
  #         :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  add '/plans'
  add plans_path, :priority => 1.0, :changefreq => 'weekly'

  Plan.find_each do |plan|
    add plan_path(plan), :priority => 0.7, :changefreq => 'daily'
    add '/plans/#{plan.id}/inquirys', :priority => 0.5, :changefreq => 'daily'
    add '/plans/#{plan.id}/confirm', :priority => 0.5, :changefreq => 'daily'
    add '/plans/#{plan.id}/eureka', :priority => 0.5, :changefreq => 'daily'
  end

  add '/guiders/sign_up'
  add '/guiders/sign_in'
  add '/guiders/password/new'
  Guider.find_each do |guider|
    
     add '/guiders/#{guider.id}/accepted', :priority => 0.5, :changefreq => 'daily'
  end

  add '/categorys'
  add categorys_path, :priority => 0.8, :changefreq => 'weekly'

  add '/tests'
  add tests_path, :priority => 0.8, :changefreq => 'weekly'
  Test.find_each do |test|
    add test_path(test), :priority => 0.7, :changefreq => 'daily'
  end

  add '/professios'
  add professions_path, :priority => 0.8, :changefreq => 'weekly'
  Profession.find_each do |profession|
    add profession_path(profession), :priority => 0.7, :changefreq => 'daily'
  end
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
