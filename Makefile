DOCKER_IMAGE := deis/example-go
BUILD_IMAGE := $(DOCKER_IMAGE)-build
RELEASE_IMAGE := $(DOCKER_IMAGE):latest

build:
	docker build -t $(BUILD_IMAGE) .
	docker cp `docker run -d $(BUILD_IMAGE)`:/go/bin/example-go image/
	docker build -t $(RELEASE_IMAGE) image
	rm -rf image/example-go

clean:
	-docker rmi $(DOCKER_IMAGE) $(BUILD_IMAGE) $(RELEASE_IMAGE)
