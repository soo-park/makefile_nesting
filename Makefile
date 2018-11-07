OS := $(shell uname)
SHELL := /bin/bash
TODAY=`date +'%y.%m.%d %H:%M:%S'`
.PHONY: myapp-fake clean whatever all-fakes

run-app-from-main:
	@echo '==================== running the app from main Makefile ==================='
	make -C	sample_sub run-app &
	echo run-app-from-main: $(TODAY) >> logfile
	make call-something-in-self

call-something-in-self:
	@echo '==================== call something in self ==================='
	echo call-something-in-self: $(TODAY) >> logfile
	make myapp-fake

stop-app:
	kill $(lsof -n -i :3000 | pgrep LISTEN)