#!/bin/bash
#Install Git on RHEL flaverous
# prerequisites
yum install -y wget \
curl-devel expat-devel gettext-devel openssl-devel zlib-devel \
gcc perl-ExtUtils-MakeMaker
cd /opt
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.30.1.tar.gz
 git --version
if [ $? -eq 0 ]; 
then
    #remove the default git version from yum repo
    yum remove git -y
fi
# extract the git tarball
tar -zxf git-2.30.1.tar.gz
cd git-2.30.1

# installing latest version of git 
make prefix=/usr/local/git all
make prefix=/usr/local/git install
# set the global path
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc
 
git --version | grep 2.30
[ $? -eq 0 ] && echo "Git installed latest version successfully"
# clean up
cd /opt; rm -rf git-2.30.1 git-2.30.1.tar.gz