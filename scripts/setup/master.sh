cat <<EOF >~/.ssh/id_pdd
-----BEGIN OPENSSH PRIVATE KEY-----
PASTE PRIVATE KEY GENERATED IN PREVIOUS STEP (NOT YOUR PERSONAL PRIVATE ONE) HERE
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 600 ~/.ssh/id_pdd
echo "IdentityFile /home/$USER/.ssh/id_pdd" >~/.ssh/config

sudo apt install default-jdk scala git wget -y
wget https://dlcdn.apache.org/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz 
tar -xf spark-3.3.2-bin-hadoop3.tgz
rm spark-3.3.2-bin-hadoop3.tgz
sudo mv spark-3.3.2-bin-hadoop3 /opt/spark
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz
tar -xf hadoop-3.3.2.tar.gz
rm hadoop-3.3.2.tar.gz
sudo mv hadoop-3.3.2 /opt/hadoop
echo "export SPARK_HOME=/opt/spark" >> ~/.profile
echo "export PATH=$PATH:/opt/spark/bin:/opt/spark/sbin:/opt/hadoop/bin:/opt/hadoop/sbin:$HOME/.local/bin" >> ~/.profile
echo "export HADOOP_HOME=/opt/hadoop" >> ~/.profile
echo "export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")" >> ~/.profile
echo "export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")" >> /opt/hadoop/etc/hadoop/hadoop-env.sh
echo "export PYSPARK_PYTHON=/usr/bin/python3" >> ~/.profile
echo "export SPARK_MASTER_HOST=master" >> ~/.profile
. ~/.profile

echo -e "worker1\nworker2" >$HADOOP_HOME/etc/hadoop/workers

cat <<EOF > $HADOOP_HOME/etc/hadoop/core-site.xml
<configuration>
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://master:9000</value>
    <description>NameNode URI</description>
  </property>
</configuration>
EOF

mkdir -p $HADOOP_HOME/namenode
cat <<EOF > $HADOOP_HOME/etc/hadoop/hdfs-site.xml
<configuration>
  <property>
    <name>dfs.replication</name>
    <value>2</value>
  </property>

  <property>
    <name>dfs.namenode.name.dir</name>
    <value>file:///opt/hadoop/namenode</value>
  </property>
</configuration>
EOF


start-master.sh
# tail -f /opt/spark/logs/spark-$USER-org.apache.spark.deploy.master.Master-1-$(hostname).out