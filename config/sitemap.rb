require 'yaml'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = args[:host] || ENV['HOST']
SitemapGenerator::Sitemap.create do
  YAML.load_file('config/sitemap.yml').map do |url|
    add url['loc'], priority: url['priority']
  end
end
