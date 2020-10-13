FROM ruby:2.5-slim

LABEL Name=fics Version=0.0.1

EXPOSE 3047

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
#ADD requirements.txt .
##RUN apt update
##RUN apt install ruby -y
##RUN apt install npm -y
#RUN bash -r requirements.txt

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["ruby", "fics.rb"]
