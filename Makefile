.PHONY: build clean

build:
	cobalt clean --silent
	cobalt build --silent

publish: 
	-git branch -D master
	rm -rf build/
	cobalt build
	cobalt import --branch master
	git checkout master
	touch .nojekyll
	git add .nojekyll
	git commit -m "Github Pages integration"
	git push -u -f origin master
	git checkout source
		
serve:
	cobalt serve

upgrade:
	cargo install --force cobalt-bin --features="syntax-highlight"