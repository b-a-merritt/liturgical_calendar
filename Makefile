.PHONY: test

test:
	swipl -g "load_test_files([]), run_tests, halt" -t "halt(1)" tests/test_2026.pl
