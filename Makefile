IMAGE_NAME := superwatermelon/buildbox
tag := $(if $(TAG),$(TAG),test)

default: image

image:
	docker build --tag $(IMAGE_NAME):$(tag) .

test:
	IMAGE=$(IMAGE_NAME):$(tag) bats test/suite.bats

release:
	docker tag $(IMAGE_NAME):$(tag) $(IMAGE_NAME):latest
	scripts/docker-login
	docker push $(IMAGE_NAME):$(tag)
	docker push $(IMAGE_NAME):latest

.PHONY: default image test release
