single:
	robot -A robotargs.robot tests/documents.robot
all:
	robot -A robotargs.robot tests/
smoke:
	robot -A robotargs.robot --include smoke tests/
regression:
	robot -A robotargs.robot --include regression tests/

