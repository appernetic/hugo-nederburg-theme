#!/bin/bash

# clean
rm -rf demo

# prepare
mkdir -p demo/themes/hugo-nederburg-theme
rsync -av exampleSite/ demo
rsync -av --exclude='demo' --exclude='exampleSite' --exclude='.git' . demo/themes/hugo-nederburg-theme

# build
hugo --source demo

# release
rm -rf ./resources && cp -r ./demo/resources ./resources

#.PHONY: prepare release build demo clean
#
#build: prepare
#	$(HUGO_BIN) --source demo
#
#demo: prepare
#	$(HUGO_BIN) server --buildDrafts --source demo
#
#release: build
#	rm -rf ./resources && cp -r ./demo/resources ./resources
#
#prepare: clean
#	mkdir -p demo/themes/hugo-coder
#	rsync -av exampleSite/ demo
#	rsync -av --exclude='demo' --exclude='exampleSite' --exclude='.git' . demo/themes/hugo-coder
#
#clean:
#	rm -rf demo