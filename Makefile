OS := $(shell uname)
SHELL := /bin/bash

include sample_sub/Makefile

run-app-from-main:
	@echo '==================== running the app from main Makefile ==================='
	make -C	sample_sub run-app &
	touch text.txt
