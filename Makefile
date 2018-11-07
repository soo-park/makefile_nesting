OS := $(shell uname)
SHELL := /bin/bash
.PHONY: myapp-fake clean whatever all-fakes

run-app-from-main:
	@echo '==================== running the app from main Makefile ==================='
	make -C	sample_sub run-app &
	echo X >> logfile
	make call-something-in-self

call-something-in-self:
	@echo '==================== call something in self ==================='
	echo O >> logfile
	make myapp-fake

kill-app-by-pid:
	kill $(lsof -n -i :3000 | grep LISTEN)