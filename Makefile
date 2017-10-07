image := superwatermelon/buildbox
tag := test

.PHONY: default image test release

default: image test

image:
	docker build --tag $(image):$(tag) .

test:
	IMAGE=$(image):$(tag) bats test/suite.bats

release:
	docker tag $(image):$(tag) $(image):latest
	scripts/docker-login
	docker push $(image):$(tag)
	docker push $(image):latest
