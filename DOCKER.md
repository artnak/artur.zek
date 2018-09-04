# Building the website with a Docker container

Run these scripts in the project directory (for instance: `$ cd ~/Sites/artur.zek`).

# Installation

Fetch the Docker image:

```
docker pull some1else/artur
```

# Build & serve the site

The container will build the website into the `build` folder.

The website preview will be accessible on [http://localhost:9080](http://localhost:9080)

```
docker run --rm -i -p 9080:9080 -v ${PWD}:/mnt/repo some1else/artur:latest sh -s <<EOF
echo Copying code into container
cp -Rn /mnt/repo/* ./
ls -alF
echo Running build command
bundle exec make build
echo Copying built artefact out of the container
cp -Rf ./build /mnt/repo/
echo Serving "build" at http://localhost:9080
node ./node_modules/node-static/bin/cli.js -a 0.0.0.0 -p 9080 build
EOF
```

# Stop running containers

If you want to rebuild the website, or stop previewing the website, run this command in another terminal window:

```
docker stop $(docker ps -a -q)
```
