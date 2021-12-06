image-ci:
	docker build -t npm-test:ci .

release: image-ci
	docker-compose run --rm ci sh -c "\
		echo //$(NPM_DOMAIN)/:_authToken=$(NPM_TOKEN) >> .npmrc && \
		echo registry=https://$(NPM_DOMAIN) >> .npmrc && \
		echo publishing packages to registry: $(NPM_DOMAIN) && \
		cat lerna.json && \
		cat .npmrc && \
		git fetch --tags && \
		yarn release --yes"
