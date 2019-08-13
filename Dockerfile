FROM ruby:1.9.3

# FROM ruby:2.5

RUN apt-get update 
RUN apt-get install -y build-essential 
RUN apt-get install -y imagemagick
RUN apt-get install -y nodejs

WORKDIR /tmp
COPY Gemfile /tmp
COPY Gemfile.lock /tmp

RUN bundle install

WORKDIR /app
COPY . /app

EXPOSE 3000

CMD ["bash"]