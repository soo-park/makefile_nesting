OS := $(shell uname)
SHELL := /bin/bash

include ../common/Makefile.mk

run-app:
	@echo '==================== $(PATH)$(INPATH) ==================='
	npm install
	npm run build
	npm start

what:
	@echo '==================== $(PATH)$(INPATH) ==================='
