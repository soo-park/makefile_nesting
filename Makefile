OS := $(shell uname)
SHELL := /bin/bash

include sample_sub/Makefile

run-app-from-main: run-app
	@echo '==================== running the app from main Makefile ==================='

