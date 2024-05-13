ifeq ($(BR2_SHELL_DIR),)
$(error "This Makefile is meant to be run from br2 shell, run ./br2.shell")
endif

log.app: log_app.c 
	$(CC) $^ -o $@