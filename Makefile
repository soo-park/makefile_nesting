OS := $(shell uname)
SHELL := /bin/bash

include sample_sub/Makefile

run-app-from-main:
	@echo '==================== running the app from main Makefile ==================='
	make -C	sample_sub run-app &
	echo X >> logfile
	make call-something-in-self

call-something-in-self:
	@echo '==================== call something in self ==================='
	echo O >> logfile