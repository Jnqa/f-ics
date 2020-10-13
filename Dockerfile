FROM ruby:2.5-slim

LABEL Name=fics Version=0.0.1

EXPOSE 3047

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
ADD requirements.txt .
RUN gem install fastlane -NV && fastlane init
RUN npm install @slack/client@3.16.0 --save
RUN npm install dirty --save
RUN npm install moment --save
#RUN bash -r requirements.txt

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["ruby", "fics.rb"]
