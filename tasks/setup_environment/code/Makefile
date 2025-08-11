SHELL=bash
include ../../shell_functions.make


all:  ../output/stata_packages.txt ../output/julia_packages.txt ../output/R_packages.txt timeout_check

../output/stata_packages.txt: packages.do | ../output
	$(STATA) $<
../output/julia_packages.txt: packages.jl ../output/Project.toml ../output/Manifest.toml | ../output
	$(JULIA) $<
../output/R_packages.txt: packages.R | ../output
	$(R) $<

rebuild_toml: requirements.txt $(poetry_dir) | ../output
	poetry --directory=$(poetry_dir) add $(python_pkgs)

../output/python_packages.txt: $(poetry_dir) | ../output
	poetry --directory=$(poetry_dir) run pip install -r requirements.txt
	poetry --directory=$(poetry_dir) show --tree > $@

.PHONY: timeout_check
timeout_check:
	@which gtimeout > /dev/null 2>&1 || which timeout > /dev/null 2>&1 || \
		(echo "Neither 'gtimeout' nor 'timeout' commands are available. Please install coreutils." && exit 1)
