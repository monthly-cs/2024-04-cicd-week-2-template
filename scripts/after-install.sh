DIRECTORY=/home/ubuntu/project

cd $DIRECTORY

sudo npm i pm2 -g
sudo npm ci
sudo pm2 startOrReload ecosystem.config.json