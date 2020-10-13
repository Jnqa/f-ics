FROM fastlanetools/fastlane:latest
#ENV NODE_ENV production
# Install npm requirements
# throw errors if Gemfile has been modified since Gemfile.lock
#ADD requirements.txt .
#RUN sudo apt-get update
#RUN sudo apt install npm
RUN gem install fastlane -NV
RUN npm install @slack/client@3.16.0 --save
#RUN npm install dirty --save
#RUN npm install moment --save
#RUN bash -r requirements.txt

#RUN yarn add ruby
#RUN yarn install -r requirements.txt
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
#RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3047
CMD ["node", "poll-itc.js"]



