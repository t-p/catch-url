I wrote this little script to integrate
[newsbeuter](http://newsbeuter.org/) into my
[rtorrent](http://libtorrent.rakshasa.no/) setup.  
What is does is simply parsing a URL from the newsbeuter queue,  
downloading the torrent file and putting it into the watch folder of my rtorrent setup.  
This is only tested with feeds from [eztv](http://eztv.it/).  
To use this, you can start it from your users crontab.  
If you working inside rvm don't forget to install the addressable gem into your
syslem: sudo gem install addressable
