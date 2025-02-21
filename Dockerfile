FROM node:20-slim

WORKDIR /app

COPY . /app

RUN \
	apt update ; \
	apt install --no-install-recommends -y git ca-certificates ; \
	git config --global --add safe.directory /github/workspace ; \
	yarn ; yarn build ; yarn package

ENTRYPOINT ["node", "/app/dist/index.js"]


