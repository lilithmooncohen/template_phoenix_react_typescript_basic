.EXPORT_ALL_VARIABLES:
# Make will use bash instead of sh
SHELL := /usr/bin/env bash
MIX_ENV := dev
MIX_APP := {{ cookiecutter.app_name }}
MIX_APP_VERSION := $(shell cat VERSION)
SECRET_KEY_BASE := wNDtXNxUkXflzc33ge+eHkYGkuuxORqLyb+H/KIO/DhmHGT9CyxrtuKeP1SQSMsR
DATABASE_URL := ecto://postgres:postgres@localhost/{{ cookiecutter.app_name }}

# All is the first target in the file so it will get picked up when you just run 'make' on its own
all: compose_pull deps_get deps_compile format npm_install release

.PHONY: compose_pull
compose_pull:
	docker-compose pull

.PHONY: deps_get
deps_get:
	mix deps.get

.PHONY: deps_compile
deps_compile:
	mix deps.compile

.PHONY: format
format:
	mix format

.PHONY: check_formatted
check_formatted:
	mix format --check-formatted --dry-run

.PHONY: docs
docs:
	mix docs

.PHONY: npm_install
npm_install:
	/bin/bash -c "cd assets && npm install"

.PHONY: up
up:
	docker-compose up -d postgres && sleep 5

.PHONY: seed
seed:
	mix ecto.reset

.PHONY: test
test:
	MIX_ENV=test mix test
	/bin/bash -c "cd assets && npm run test -- --watchAll=false"

.PHONY: run
run:
	@echo -----------------------------------
	@echo ENDPOINTS
	@echo -----------------------------------
	@echo App: http://localhost:3000
	@echo -----------------------------------
	iex -S mix phx.server

.PHONY: npm_build
npm_build:
	/bin/bash -c "cd assets && npm run build"

.PHONY: digest
digest: npm_build
	mix phx.digest

.PHONY: release
release: digest
	mix release

.PHONY: down
down:
	docker-compose down

.PHONY: run_release
run_release:
	@echo -----------------------------------
	@echo ENDPOINTS
	@echo -----------------------------------
	@echo App: http://localhost:4000
	@echo -----------------------------------
	_build/${MIX_ENV}/rel/${MIX_APP}/bin/${MIX_APP} eval "{{ cookiecutter.module_name }}.Release.migrate"
	_build/${MIX_ENV}/rel/${MIX_APP}/bin/${MIX_APP} start

.PHONY: build_release_container
build_release_container:
	docker-compose build web

.PHONY: run_release_container
run_release_container:
	@echo -----------------------------------
	@echo ENDPOINTS
	@echo -----------------------------------
	@echo App: http://localhost:4000
	@echo -----------------------------------
	docker-compose run web bin/${MIX_APP} eval "{{ cookiecutter.module_name }}.Release.migrate"
	docker-compose up web
