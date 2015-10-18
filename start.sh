#!/bin/sh

if [ -z ${GAME_PATH+x} ]; then
  echo '$GAME_PATH is not set';
  exit 1;
fi

if [ -z ${GAME_TYPE+x} ]; then
  echo '$GAME_TYPE is not set';
  exit 1;
fi

# Update application
git pull
npm install

cat > config.js <<- END_OF_CONFIG
module.exports = {
  host: '0.0.0.0',
  port: 3000,
  type: 'linux',
  game: '$GAME_TYPE',
  path: '$GAME_PATH',
  prefix: '$SERVER_PREFIX',
  suffix: '$SERVER_SUFFIX',
  auth: {
    username: '$USERNAME',
    password: '$PASSWORD',
  },
};
END_OF_CONFIG

cd $GAME_PATH
node /app/app.js
