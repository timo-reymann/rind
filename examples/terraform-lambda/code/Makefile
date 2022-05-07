clean:
	rm -rf dist/ || true
	mkdir dist/

build:
	cp handler.py dist/
	deterministic-zip -r dist/bundle.zip dist/

setup: clean
	pip3 install -r requirements.txt -t dist/
	curl -sS https://raw.githubusercontent.com/timo-reymann/deterministic-zip/main/installer | bash
