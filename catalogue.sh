dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp /etc/systemd/system/catalogue.service
cp /etc/yum.repos.d/mongo.repo
useradd roboshop

mkdir /app

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
unzip /tmp/catalogue.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

dnf install mongodb-mongosh -y

mongosh --host MONGODB-SERVER-IPADDRESS </app/db/master-data.js


