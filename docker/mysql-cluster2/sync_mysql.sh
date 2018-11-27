#! /bin/bash

# stop master slave;
docker exec mysqlcluster_mysql-master_1 bash -c "mysql -u root -p'liugeyi' -e 'stop slave;'"

# get master cluster info
masterfile=$(docker exec mysqlcluster_mysql-master_1 bash -c "mysql -u root -p'liugeyi' -e 'show master status;'" | awk '{print $1}' | sed -n '2p')
masterpos=$(docker exec mysqlcluster_mysql-master_1 bash -c "mysql -u root -p'liugeyi' -e 'show master status;'" | awk '{print $2}' | sed -n '2p')
echo "this binlog file is" ${masterfile} "pos is" ${masterpos} "\n"

# basic slave command
basic_info="change master to master_host='mysql-master', master_user='slave', master_password='liugeyi', master_port=3306, master_log_file='master.log.file', master_log_pos=log.pos, master_connect_retry=30;"

# set slave1 info start
slave1info=${basic_info//slave/slave1}
slave1info=${slave1info//"master.log.file"/${masterfile}}
slave1info=${slave1info//log.pos/${masterpos}}

docker exec mysqlcluster_mysql-slave1_1 bash -c "mysql -u root -p'liugeyi' -e 'stop slave;'"
docker exec mysqlcluster_mysql-slave1_1 bash -c "mysql -u root -p'liugeyi' -e ${slave1info}"
docker exec mysqlcluster_mysql-slave1_1 bash -c "mysql -u root -p'liugeyi' -e 'start slave;'"
echo "set slave1 info is ok!"
# set slave1 info end

# set slave2 info start
slave2info=${basic_info//slave/slave2}
slave2info=${slave2info//"master.log.file"/${masterfile}}
slave2info=${slave2info//log.pos/${masterpos}}

docker exec mysqlcluster_mysql-slave2_1 bash -c "mysql -u root -p'liugeyi' -e 'stop slave;'"
docker exec mysqlcluster_mysql-slave2_1 bash -c "mysql -u root -p'liugeyi' -e ${slave2info}"
docker exec mysqlcluster_mysql-slave2_1 bash -c "mysql -u root -p'liugeyi' -e 'start slave;'"
echo "set slave2 info is ok!"
# set slave2 info end
