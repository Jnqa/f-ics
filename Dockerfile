FROM node:12.18-alpine
ENV NODE_ENV production
# Install npm requirements
ADD requirements.txt .
#RUN curl -sL https://git.io/vQhWq | ruby
#RUN bash gem install fastlane || echo "problem"
#RUN yarn install ruby
RUN yarn add ruby
#RUN yarn install -r requirements.txt
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3047
CMD ["node", "poll-itc.js"]
