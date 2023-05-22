SHELL := /bin/bash

GOLANG       := golang:1.20

VERSION := 1.0

nakamaserver:
	docker build \
		-f zarf/docker/Dockerfile \
		-t nakamaserver:$(VERSION) \
		--build-arg BUILD_REF=$(VERSION) \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		.

dev-up:
	docker-compose -f zarf/docker-compose/docker-compose.yml up  