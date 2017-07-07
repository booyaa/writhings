.PHONY: build clean

build:
	cobalt clean --silent
	cobalt build --silent

publish: build
	cobalt import --branch master
	git checkout master
	git push -u origin master
	git checkout source

serve:
	cobalt serve

upgrade:
	cargo install --force cobalt-bin --features="syntax-highlight"