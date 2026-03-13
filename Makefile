.PHONY: scaffold verify adr task help

## scaffold: Create the initial project structure (run once after cloning)
scaffold:
	@echo "Scaffolding [[PROJECT_NAME]]..."
	@mkdir -p docs/02_outputs
	@mkdir -p tasks/active tasks/done
	@mkdir -p tests/e2e tests/contract
	@mkdir -p verify/scripts
	@mkdir -p backend frontend
	@echo "Done. Next: fill in docs/00_intake/intake_questionnaire.md"

## verify: Run all verification checks (e2e + DOM)
verify:
	@echo "Running verification..."
	@bash verify/scripts/run-e2e.sh
	@npx ts-node verify/scripts/check-dom.ts

## adr: Create a new ADR (usage: make adr SLUG=my-decision)
adr:
	@if [ -z "$(SLUG)" ]; then echo "Usage: make adr SLUG=my-decision"; exit 1; fi
	@N=$$(ls adr/*.md 2>/dev/null | grep -v template | grep -v AGENTS | wc -l); \
	 N=$$((N + 1)); \
	 PADDED=$$(printf "%04d" $$N); \
	 cp adr/template.md "adr/$$PADDED-$(SLUG).md"; \
	 echo "Created adr/$$PADDED-$(SLUG).md"

## task: Create a new task from the template (usage: make task NAME=my-task)
task:
	@if [ -z "$(NAME)" ]; then echo "Usage: make task NAME=my-task"; exit 1; fi
	@cp tasks/_template.md "tasks/active/$(NAME).md"; \
	 echo "Created tasks/active/$(NAME).md"
	@echo "Next: ask your AI tool to write tasks/active/$(NAME).scratch.md before coding"

## help: Show this help
help:
	@grep -E '^## ' Makefile | sed 's/## //' | column -t -s ':'
