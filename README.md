# Prepare and Build
Built to prepare a DigitalOcean VPS for PaperMC

### Prepare:
```sh
git clone https://github.com/ChrisDesigns/prepare-and-build-papermc && cd prepare-and-build-papermc/
chmod +x setup.sh
./setup.sh
```

### Build:
```sh
docker-compose up
```

### Notes:
This was built for 2GB of ram and 2 CPUs as 1GB and 1 CPU isn't enough to run with this overhead.
