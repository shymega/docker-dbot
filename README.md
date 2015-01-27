A Dockerfile for [dbot](http://github.com/reality/dbot)
======================================================

How do I use docker-dbot?
=========================

1. Configure config.json to your needs - this will be baked in to the final image.
2. Run 'docker build -t dbot .' (without the quotes) to build your image. You can provide a tag to the command as defined in the Docker documentation.
3. Run your dbot image with the following command: 'docker run -d dbot' - the dbot process in the image will use the config.json you configured earlier.

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
