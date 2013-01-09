ENVIRONMENTS = {
  :staging => {remote: 'vilapinto-staging', host: 'http://vilapinto.herokuapp.com' },
  :production => {remote: 'vilapinto-production', host: 'http://www.ceavilapinto.org.br'}
}

namespace :deploy do
  ENVIRONMENTS.keys.each do |env|
    desc "Deploy to #{env}"
    task env do
      Rake::Task['deploy:before_deploy'].invoke(env, host)
      Rake::Task['deploy:update_code'].invoke(env, host)
      Rake::Task['deploy:after_deploy'].invoke(env, host)
    end
  end

  task :before_deploy, :env, :host do |t, args|
  end

  task :after_deploy, :env, :host do |t, args|
    Rake::Task['sitemap:refresh'].invoke host
    puts "Deployment Complete"
  end

  task :update_code, :env, :host do |t, args|
  end
end
