circleci-python-build
===

Example showcasing CircleCI + python custom build

## Usecase

So lets assume we have a python application we want to bundle with deterministic-zip to be able to get an idempotent
artifact (e.g. for deployment). The python version needs to be python 3.9 otherwise things will break.

We setup a CircleCI pipeline which works smooth and provides all of this, but occasionally devs would like to deploy
manually.

So in this cases we need:

- Python 3.9
- pip3
- deterministic-zip
- a linux host to ensure the dependencies dont differ

We could add this requirements to the README and add install links. But who reads documentation, right?

Instead of that you can just run `make build-local`. Easy, right?

With the power of rind we dont need to care about what the user has installed etc. he just needs make & docker. Thats
it!

And you will get the exact same result as in the CircleCI pipeline.

> This also works for Visual Code and dev containers without special config, no evil dind!
