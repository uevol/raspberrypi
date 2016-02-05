# raspberrypi
#从dht22温湿度传感器读取温湿度并保存到sqlite3数据库中，创建ruby on rails的应用程序，使用hightcharts图标将收集到温湿度展示出来。



#1. rvm安装
\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
source /etc/profile
source ~/.rvm/scripts/rvm
type rvm | head -n 1 >>>> rvm is a function

#2.install ruby 
rvm list known
rvm install version

#3.install rails
gem -v 
gem install rails

