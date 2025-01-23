SCRIPTS := $(wildcard ./scripts/*.sh)

all: $(SCRIPTS)
	@for script in $(SCRIPTS); do \
		echo "Running $$script"; \
		sh $$script; \
	done