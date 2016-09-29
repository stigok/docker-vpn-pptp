OWNER = sshow
NAME = vpn-pptp
IMAGE = $(OWNER)/$(NAME)

VERSION = 0.1

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .

clean:
	docker rm -f $(NAME)-test

testrun:
	docker volume create --name pptpd-logs
	docker run -d \
		--privileged \
		--net=host \
		--name="$(NAME)-test" \
		-p 1723:1723 \
		-v pptpd-logs:/var/log \
		--restart=unless-stopped \
		--env TZ=Europe/Oslo \
		$(IMAGE):$(VERSION)

