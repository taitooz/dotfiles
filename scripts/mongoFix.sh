sudo rm /var/lib/mongodb/mongod.lock
sudo mongod --dbpath /var/lib/mongodb --repair
sudo chown mongodb /var/lib/mongodb/*
