# Building the website with a Docker container

Run these scripts in the project directory (for instance: `$ cd ~/Sites/artur.zek`).

# Installation

Fetch the Docker image:

`docker pull some1else/artur`

# First run

If you have a fresh repository, this command will copy node_modules & lockfiles into the project. Run it once, or when dependencies change.

```
docker run --rm -i -p 9080:9080 -v ${PWD}:/mnt/repo some1else/artur:latest sh -s <<EOF
echo Copying node_modules
cp -Rf node_modules /mnt/repo/
echo Copying lockfiles
cp -f Gemfile.lock /mnt/repo/
cp -f yarn.lock /mnt/repo/
EOF
```

# Build & serve the site

The container will then build the website into the `build` folder.

The website preview will be accessible on [http://localhost:9080](http://localhost:9080)

```
docker run --rm -i -p 9080:9080 -v ${PWD}:/mnt/repo some1else/artur:latest sh -s <<EOF
cd /mnt/repo
bundle exec make build
node ./node_modules/node-static/bin/cli.js -a 0.0.0.0 -p 9080 build
EOF
```

# Stop running containers

If you want to rebuild the website, or stop previewing the website, run this command in another terminal window:

```
docker stop $(docker ps -a -q)
```
