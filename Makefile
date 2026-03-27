.PHONY: test c-build c-test c-bundle c-clean

test:
	swipl -g "load_test_files([]), run_tests, halt" -t "halt(1)" tests/test_2026.pl

c-build:
	$(MAKE) -C src/c shared

c-test:
	$(MAKE) -C src/c test

c-bundle:
	$(MAKE) -C src/c bundle

c-clean:
	$(MAKE) -C src/c clean
