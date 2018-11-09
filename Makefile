OS := $(shell uname)
SHELL := /bin/bash
TODAY=`date +'%y.%m.%d %H:%M:%S'`
.PHONY: myapp-fake clean whatever all-fakes

run-app-from-main:
	@echo '==================== running the app from main Makefile ==================='
	make -C	sample_sub run-app &
	echo run-app-from-main: $(TODAY) >> logfile
	make call-something-in-self
	make -C	sample_sub2 run-app &

call-something-in-self:
	@echo '==================== call something in self ==================='
	echo call-something-in-self: $(TODAY) >> logfile
	make myapp-fake

# TODO: make kill work
stop-app:
	kill $(lsof -n -i :3000 | pgrep {${arr[1]}})
	kill $(lsof -n -i :3006 | pgrep {${arr[1]}})

stop-app2:
	make --ignore-errors stop-app

# =========
SPL1 := sample_sub
SPL2 := sample_sub2
SPL3 := sample_sub2/sample_sub2_sub

ALL_SPL_PATHS := $(SPL1) $(SPL2) $(SPL3)
SUP_SPL_PATHS := $(SPL1) $(SPL2)

# single case works
run_install_and_touch_on_first:
	cd $(SPL3) && npm install && touch logfile.txt

# show that the iteration is working
iterate:
	for dir in $(ALL_SPL_PATHS); do \
		echo $$dir; \
		done

# runs on each folder -- compare with below
install:
	for dir in $(ALL_SPL_PATHS); do \
		(cd $(notdir $$dir) && npm install); \
		done

touch:
	for dir in $(ALL_SPL_PATHS); do \
		(cd $(notdir $$dir) && touch logfile.txt); \
		done

delete_in_parent:
	for dir in $(ALL_SPL_PATHS); do \
		(cd $(notdir $$dir) && rm -rf node_modules && rm -f logfile.txt); \
		done

include common/Makefile

delete_all:
	for dir in $(ALL_SPL_PATHS); do \
		(cd $(notdir $$dir) && make delete); \
		done
