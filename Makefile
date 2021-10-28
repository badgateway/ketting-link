.PHONY: build
build: tsbuild

.PHONY: clean
clean:
	-rm -r browser/
	-rm -r dist/

.PHONY: test
test: lint
	./node_modules/.bin/nyc ./node_modules/.bin/mocha

.PHONY: test-debug
test-debug:
	./node_modules/.bin/mocha --inspect-brk

.PHONY: lint
lint:
	./node_modules/.bin/eslint --quiet 'src/**/*.ts' 'test/**/*.ts'

.PHONY: fix
fix:
	./node_modules/.bin/eslint --quiet 'src/**/*.ts' 'test/**/*.ts' --fix

.PHONY: tsbuild
tsbuild:
	./node_modules/.bin/tsc

.PHONY: watch
watch:
	./node_modules/.bin/tsc --watch
