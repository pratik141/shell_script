#!/bin/bash

########################################################
##  author name:  Pratik Anand
##  author email: anandpratik141@gmail.com
########################################################

# This script is for checking whether packeges installed or not
# if not this will install
# mvn java git and nodejs

. Versionfile
sourceURL=''
packageList=(mvn nodejs git java)

installJava(){

    ## checking git exist or not 
    # cd /tmp/; git clone $sourceURL/java8 # download location 
    # cd java8
    # tar -xzf <file name> ## Put the archive name here 

    # JDK='jdk1.8.0_20' ## setting java file version

    # echo "Moving $JDK folder to /usr/lib/jvm"
    # sudo cp -r $JDK /usr/lib/jvm/
    # echo "Moved Successfully"

    # echo "setting java command"
    # sudo ln -sf /usr/lib/jvm/$JDK/bin/java /etc/alternatives/java
    # sudo ln -sf /etc/alternatives/java /usr/bin/java

    # echo "setting javac command"
    # sudo ln -sf /usr/lib/jvm/$JDK/bin/javac /etc/alternatives/javac
    # sudo ln -sf /etc/alternatives/javac /usr/bin/javac

    # echo "setting jar command"
    # sudo ln -sf /usr/lib/jvm/$JDK/bin/jar /etc/alternatives/jar
    # sudo ln -sf /etc/alternatives/jar /usr/bin/jar

    # echo "setting javadoc command"
    # sudo ln -sf /usr/lib/jvm/$JDK/bin/javadoc /etc/alternatives/javadoc
    # sudo ln -sf /etc/alternatives/javadoc /usr/bin/javadoc
    # echo export JAVA_HOME=/usr/lib/jvm/$JDK/ >> /home/bamboo/.bashrc
    echo "Installion done"
}

installMVN(){
    # cd /tmp/ ; git clone $sourceURL/mvn
    # cd mvn ;tar -xvzf 
    # cd /usr/local ; sudo tar --strip-components 1 -xzf /tmp/mvn/<name>
    # export PATH=$PATH:/usr/local/git/bin:/usr/local/bin
    echo "Installion done"
}

installNodeJs(){
    curl --insecure https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz -o /tmp/node-v4.2.3-linux-x64.tar.gz
    cd /usr/local ; sudo tar --strip-components 1 -xzf /tmp/node-v4.2.3-linux-x64.tar.gz
    rm /tmp/node-v4.2.3-linux-x64.tar.gz
    export PATH=$PATH:/usr/local/git/bin:/usr/local/bin
    node -v
    echo "Installion done"
}

installGit(){
    yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel -y 
    yum install gcc perl-ExtUtils-MakeMaker -y 
    cd /usr/src ; curl -o https://www.kernel.org/pub/software/scm/git/git-1.8.2.3.tar.gz
    tar xzf git-1.8.2.3.tar.gz
    echo "Installion done"
}

installPackage()
{
  case $1 in
  mvn )
    echo "Installing mvn"
    installMVN
    ;;

  nodejs )
    echo Installing $1
    installNodeJs
    ;;

  git )
    echo Installing $1
    installGit
    ;;

  java )
    echo Installing $1
    installJava
    ;;
esac
}


for i in "${packageList[@]}"
  do

    Vout=`yum info $i |grep 'Version  '`

    if [[ -z $Vout ]]; then
      echo $i not exist
      installPackage $i
    else
      Current_Version=`echo $Vout |cut -d ':' -f 2`
      echo $i is already installed 
    fi
  done
