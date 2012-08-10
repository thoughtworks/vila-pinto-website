rvm use 1.9.3
bundle install
rake db:migrate
rake db:seed
rake comfortable_mexican_sofa:fixtures:import FROM=ceavilapinto.org.br TO=ceavilapinto.dev
