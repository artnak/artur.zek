# Installation

Fetch the Docker image

`docker pull some1else/artur`

# Building the website

Run the container in the project directory.

The command will copy node_modules & lockfiles into the project.

It will then build the website into the `build` folder.

The website preview will be accessible on [http://localhost:9080](http://localhost:9080)

```
docker run --rm -i -p 9080:9080 -v ${PWD}:/mnt/repo some1else/artur:latest sh -s <<EOF
cp -Rf node_modules /mnt/repo/
cp -f Gemfile.lock /mnt/repo/
cp -f yarn.lock /mnt/repo/
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
