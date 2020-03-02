.PHONY: test build generate inspect deploy

export PATH := bin:$(PATH)
IMAGE_NAME=section-docs

all: build generate

build:
	docker build --tag $(IMAGE_NAME) .

generate:
	docker run --rm --volume "$$(pwd)/public:/src/public" $(IMAGE_NAME) hugo --environment production

inspect:
	docker run --rm -ti --volume "$$(pwd):/src" $(IMAGE_NAME) bash

deploy:
	aws s3 sync --acl public-read --delete public/ s3://section-www.section.io/docs/
