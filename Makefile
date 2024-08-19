single:
	robot -A robotargs.robot --include api tests/
all:
	robot -A robotargs.robot tests/
smoke:
	robot -A robotargs.robot --include smoke tests/
regression:
	robot -A robotargs.robot --include regression tests/

