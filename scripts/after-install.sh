DIRECTORY=/home/ubuntu/project

cd $DIRECTORY

sudo npm i pm2 -g
sudo npm i
sudo pm2 start npm --name "next-server" -- start