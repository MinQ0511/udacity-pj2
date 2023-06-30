install:
	pip install --upgrade pip &&\
		pip install -r requirement.txt

test:
	py -m pytest -vv test_hello.py

lint:
	pylint --disable=R,C hello.py

all: install lint test