 raspberrypi+dht22
1、从dht22温湿度传感器读取温湿度并保存到sqlite3数据库中。
2、创建ruby on rails的应用程序，使用hightcharts图标将收集到温湿度展示出来。

1. rvm安装
(1)\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
(2)echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
(3)source /etc/profile
(4)source ~/.rvm/scripts/rvm
(5)type rvm | head -n 1 
  >>>> rvm is a function

2.install ruby 
(1)rvm list known
(2)rvm install version

3.install rails
(1)gem -v 
(2)gem install rails

