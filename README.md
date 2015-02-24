A Dockerfile for [dbot](http://github.com/reality/dbot)
======================================================

How do I use docker-dbot?
=========================

1. Configure either the config.json included in this repo, or the dbot repo.
2. Run 'docker build -t dbot .' (without the quotes) to build your image. You can use a different name if you wish, just make sure to use that for the next command below.
3. Run your docker-dbot image with the command: 'docker run -d -v /path/to/config.json:/home/dbot/dbot/config.json dbot' - This will use a volume in the container for the config.json you configured earlier.

Happy dbot'ing!

License
=======

docker-dbot is licensed under the same license as dbot - GNU GPLv3

See LICENCE

Contributing
============

Want to contribute? Fork this repo and submit a pull request. I'm always happy to read through any ideas and improvements you have to make for my projects. 

Bear in mind though, I am quite busy with education, so I'll try and sort out your issues quickly, but it could be a while!

Happy coding,
shymega
