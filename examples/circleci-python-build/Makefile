clean:
	@rm -rf dist/ || true

build-local:
	curl -sS https://raw.githubusercontent.com/timo-reymann/rind/1.0.0/core/rind | bash -s - --runtime cimg/python:3.9 --main-cmd "make build" --setup-cmd "make setup" --artifacts "dist/" --log-level DEBUG

build: clean
	mkdir dist/
	cp main.py dist/
	pip3 install -r requirements.txt -t dist/
	deterministic-zip -r dist/bundle.zip dist/

setup:
	curl -sS https://raw.githubusercontent.com/timo-reymann/deterministic-zip/main/installer | bash
