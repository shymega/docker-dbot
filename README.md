Dockerfile for the marvellous dbot
=============================================

This is a Dockerfile for the dbot IRC bot.

## Usage

- Configure either the config.json included in this repo, or the dbot
   repo.

- Run `docker build -t dbot .` to build your image. You can use a
   different name if you wish, just make sure to use that for the next
   command below.

3 Run your docker-dbot image with the command: `docker run -d -v
   /path/to/config.json:/home/dbot/dbot/config.json dbot` - This will
   use a volume in the container for the config.json you configured
   earlier.

Happy dbot'ing!

## License

docker-dbot is licensed under the same license as dbot - GNU GPLv3

See LICENCE

## Contributing

Want to contribute? Fork this repo and submit a pull request. I'm
always happy to read through any ideas and improvements you have to
make for my projects.

Happy hacking!
