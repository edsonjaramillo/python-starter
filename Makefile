.PHONY: all clean_cache clean_deps format freeze help install lint precommit sort test venv

SRC=src/project
VENV=.venv/bin

all: 
	@$(VENV)/python $(SRC)/main.py

clean_cache:
	@bash scripts/clean_cache.bash

clean_deps:
	@bash scripts/clean_deps.bash

format:
	@$(VENV)/ruff format .

freeze:
	@$(VENV)/pip freeze > requirements.txt
	@echo "Updated requirements.txt"

help:
	@bash scripts/help.bash

install: venv
	@$(VENV)/pip install -r requirements.txt

lint:
	@$(VENV)/ruff check .

precommit:
	@make format
	@make sort
	@make lint
	@make test

setup: venv install

sort:
	@$(VENV)/isort .

test:
	@$(VENV)/pytest tests -xq

venv:
	@test -d $(VENV) || python3 -m venv .venv
