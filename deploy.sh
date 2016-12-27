#!/usr/bin/env bash
sudo apt-get update -y
sudo apt-get install -y  apache2
sudo apt-get install -y libapache2-mod-wsgi python-dev
sudo a2enmod wsgi
sudo apt-get install -y  python-pip
sudo pip install virtualenv
sudo apt-get install unzip
cd /var/www/
sudo wget https://github.com/achautha/FlaskApp/archive/master.zip
sudo unzip master.zip
sudo mv FlaskApp-master/ FlaskApp
sudo rm -rf master.zip
cd FlaskApp
sudo pip install -r requirements.txt
sudo mv FlaskApp.conf /etc/apache2/sites-available/FlaskApp.conf
myhost=`curl http://169.254.169.254/latest/meta-data/public-hostname`
sudo sed -i "s/mywebsite.com/$myhost/g" /etc/apache2/sites-available/FlaskApp.conf
sudo a2ensite FlaskApp
sudo a2dissite 000-default.conf
sudo service apache2 reload
sudo service apache2 restart
