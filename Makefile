OWNER = sshow
NAME = vpn-pptp
IMAGE = $(OWNER)/$(NAME)

VERSION = 0.1

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .

clean:
	docker rm -f $(NAME)-test

clean-all:
	make clean
	docker volume rm pptpd-logs pptpd-users

install:
	make build
	docker run -d \
		--privileged \
		--net=host \
		--name="$(NAME)" \
		-p 1723:1723 \
		-v pptpd-logs:/var/log \
		-v pptpd-users:/mnt/pptpd \
		--restart=unless-stopped \
		--env TZ=Europe/Oslo \
		$(IMAGE):$(VERSION)

debug:
	make clean
	make build
	docker run -d \
		--privileged \
		--net=host \
		--name="$(NAME)-test" \
		-p 1723:1723 \
		-v pptpd-logs:/var/log \
		-v pptpd-users:/mnt/pptpd \
		--restart=unless-stopped \
		--env TZ=Europe/Oslo \
		$(IMAGE):$(VERSION)
	sleep 2
	docker logs $(NAME)-test
	docker exec -it $(NAME)-test bash
