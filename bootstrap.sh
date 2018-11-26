apt-get install -y mariadb-server
printf '[mysqld]\nbind-address = 0.0.0.0' >> /etc/mysql/my.cnf
systemctl restart mariadb

apt-get install -y git
git clone https://github.com/datacharmer/test_db.git

# configuring mariadb server
echo "INSTALL SONAME 'ha_blackhole';" | mysql
cd test_db && mysql < employees.sql && mysql -t < test_employees_sha.sql
mysql < /vagrant/mariadb_configure

# installing some recommended tools
apt-get install -y nethogs netsniff-ng sysstat iotop

# installing perf
apt-get install -y linux-tools

