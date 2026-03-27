# ------------------------------------------------------------------
# liturgical C API — build system
#
# Requires SWI-Prolog installed on the build machine.
# Produced artifacts are in src/c/; bundle artifacts go into dist/.
# ------------------------------------------------------------------

# SWI-Prolog installation details (via pkg-config)
SWIPL_CFLAGS  := $(shell pkg-config --cflags swipl 2>/dev/null)
SWIPL_LDFLAGS := $(shell pkg-config --libs   swipl 2>/dev/null)
PLBASE        := $(shell swipl --dump-runtime-variables 2>/dev/null \
                   | grep ^PLBASE | cut -d= -f2 | tr -d '"')
PLLIBDIR      := $(shell swipl --dump-runtime-variables 2>/dev/null \
                   | grep ^PLLIBDIR | cut -d= -f2 | tr -d '"')

ifeq ($(SWIPL_CFLAGS),)
  $(error SWI-Prolog not found. Install swi-prolog and ensure pkg-config can find it.)
endif

CC      := gcc
CFLAGS  := $(SWIPL_CFLAGS) -fPIC -Wall -Wextra -Wno-unused-result
LDFLAGS := $(SWIPL_LDFLAGS) -ldl   # -ldl for dladdr (path resolution)

# Prolog source dir used at test time (absolute path to src/db/)
PROLOG_SRC := $(abspath ../../src/db)

# Dist layout:  dist/lib/   — shared libraries
#               dist/prolog/ — minimal SWI-Prolog home (PLBASE subset)
#               dist/src/db/ — liturgical Prolog files
DIST := dist

.PHONY: all shared shared-swipl test bundle clean

# Default target
all: shared

# ------------------------------------------------------------------
# Option A: plain gcc with pkg-config flags (explicit, portable)
# ------------------------------------------------------------------
shared: libliturgy.so

libliturgy.so: liturgical.c liturgical.h
	$(CC) $(CFLAGS) -shared -o $@ liturgical.c $(LDFLAGS) \
	    -Wl,-rpath,$(PLLIBDIR)

# ------------------------------------------------------------------
# Option B: swipl-ld build driver (equivalent — just a gcc wrapper)
# Embeds the Prolog state into the .so so .pl files are not needed
# at runtime (PLBASE still required for the runtime boot files).
# ------------------------------------------------------------------
shared-swipl: liturgical.c liturgical.h
	swipl-ld -embed-shared -cc $(CC) -o libliturgy.so liturgical.c

# ------------------------------------------------------------------
# Smoke test
# ------------------------------------------------------------------
test_liturgical: test_liturgical.c liturgical.h libliturgy.so
	$(CC) $(SWIPL_CFLAGS) -o $@ test_liturgical.c \
	    -L$(CURDIR) -lliturgy \
	    -Wl,-rpath,$(CURDIR) \
	    $(SWIPL_LDFLAGS) -ldl

test: test_liturgical
	LITURGICAL_SRC=$(PROLOG_SRC) LD_LIBRARY_PATH=$(CURDIR) ./test_liturgical

# ------------------------------------------------------------------
# Self-contained bundle
#
# Creates dist/ with everything needed to use libliturgy.so on a
# machine that does NOT have SWI-Prolog installed:
#
#   dist/
#     lib/
#       libliturgy.so    (RPATH patched to $ORIGIN)
#       libswipl.so*     (SWI-Prolog shared library)
#       libgmp.so*       (transitive dependency)
#       libz.so*         ...
#     prolog/
#       boot/            (SWI-Prolog startup Prolog, ~3 MB)
#       library/         (standard library subset, ~5 MB)
#     src/db/            (liturgical calendar Prolog files)
#
# Usage after bundling:
#   PLHOME=dist/prolog LITURGICAL_SRC=dist/src/db \
#     LD_LIBRARY_PATH=dist/lib ./my_app
# ------------------------------------------------------------------
bundle: shared
	@command -v patchelf >/dev/null 2>&1 || \
	  { echo "ERROR: patchelf not found. Install with: sudo apt install patchelf"; exit 1; }

	mkdir -p $(DIST)/lib $(DIST)/prolog $(DIST)/src

	# Our library
	cp libliturgy.so $(DIST)/lib/

	# libswipl.so and its direct dependencies (excluding libc/libm/libpthread
	# which are always present on the target system)
	ldd libliturgy.so | awk '/=> \// { print $$3 }' \
	  | grep -v -E 'libc\.so|libm\.so|libpthread\.so|libdl\.so|ld-linux' \
	  | while read lib; do \
	      [ -f "$$lib" ] && cp -L "$$lib" $(DIST)/lib/ || true; \
	    done

	# Also copy the versioned libswipl symlinks from PLBASE
	find $(PLBASE)/lib -name 'libswipl.so*' -exec cp -L {} $(DIST)/lib/ \; 2>/dev/null || true

	# Patch RPATH so the library finds its sibling .so files without LD_LIBRARY_PATH
	patchelf --set-rpath '$$ORIGIN' $(DIST)/lib/libliturgy.so

	# SWI-Prolog boot files (mandatory for PL_initialise)
	cp -r $(PLBASE)/boot $(DIST)/prolog/

	# SWI-Prolog standard library — copy the full library; downstream packages
	# can trim this further with a manifest of actually-used predicates.
	cp -r $(PLBASE)/library $(DIST)/prolog/

	# Liturgical Prolog source files
	cp -r $(PROLOG_SRC) $(DIST)/src/db

	@echo ""
	@echo "Bundle created in $(DIST)/"
	@echo "To use without a system SWI-Prolog installation:"
	@echo "  PLHOME=$(CURDIR)/$(DIST)/prolog \\"
	@echo "  LITURGICAL_SRC=$(CURDIR)/$(DIST)/src/db \\"
	@echo "  LD_LIBRARY_PATH=$(CURDIR)/$(DIST)/lib \\"
	@echo "  ./your_app"

# ------------------------------------------------------------------
clean:
	rm -rf libliturgy.so test_liturgical $(DIST)/
