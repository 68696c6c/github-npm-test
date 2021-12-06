image-ci:
	docker build -t npm-test:ci .

release: image-ci
	docker-compose run --rm ci sh -c "\
		echo //$(NPM_DOMAIN)/:_authToken=$(NPM_TOKEN) >> .npmrc && \
		echo @68696c6c:registry=https://$(NPM_DOMAIN) >> .npmrc && \
		echo publishing packages to registry: $(NPM_DOMAIN) && \
		cat lerna.json && \
		cat .npmrc && \
		yarn release --yes"
