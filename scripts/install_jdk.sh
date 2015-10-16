#!/bin/sh
#inflating jdk
cp -Rv  $HOME/Dropbox/java  $HOME;
cd  $HOME/java;
chmod u+x jdk-6u45-linux-i586.bin;
./jdk-6u45-linux-i586.bin;
#install jdk
cd  $HOME/Dropbox/java;
chmod u+x jdk-6u45-linux-i586.bin;
./jdk-6u45-linux-i586.bin;
sudo mv jdk1.6.0_45 /opt;
sudo update-alternatives --install "/usr/bin/java" "java" "/opt/jdk1.6.0_45/bin/java" 1;
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/jdk1.6.0_45/bin/javac" 1;
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/jdk1.6.0_45/bin/javaws" 1;
sudo update-alternatives --config java;
#extracting tools
cd  $HOME/java;
tar -zxvf apache-maven-2.2.1.tar.gz;
tar -zxvf apache-tomcat-6.0.36.tar.gz;
tar -zxvf ideaIC-12.1.4.tar.gz;
unzip nbvi-1.4.8.zip;
#install idea
mv idea-IC-129.713 idea;
cp -Rv  $HOME/java/idea  $HOME;
#install netbeans
cd  $HOME/java;
chmod +x netbeans-7.3-javaee-linux.sh;
sh netbeans-7.3-javaee-linux.sh;
#remove temp files
cd  $HOME/java;
rm -R idea;
rm apache-maven-2.2.1.tar.gz;
rm apache-tomcat-6.0.36.tar.gz;
rm netbeans-7.3-javaee-linux.sh;
rm jdk-6u45-linux-i586.bin;
rm nbvi-1.4.8.zip;
