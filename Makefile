UK_ROOT ?= $(PWD)/../../unikraft
UK_LIBS ?= $(PWD)/../../libs
LIBS := $(UK_LIBS)/mimalloc:$(UK_LIBS)/tinyalloc:$(UK_LIBS)/tlsf:$(UK_LIBS)/lwip:$(UK_LIBS)/nginx:$(UK_LIBS)/pthread-embedded:$(UK_LIBS)/newlib

all:
		@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS)

$(MAKECMDGOALS):
		@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS) $(MAKECMDGOALS)

