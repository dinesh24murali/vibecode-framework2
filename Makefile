.PHONY: scaffold verify adr task check-env init help phase-scaffold phase-task phase-init

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

## check-env: Validate .env has all required vars from .env.example
check-env:
	@bash verify/scripts/check-env.sh

## init: List all unreplaced [[PLACEHOLDER]] tokens in the repo (run after cloning)
init:
	@echo "Scanning for unreplaced [[PLACEHOLDER]] tokens..."
	@echo ""
	@git ls-files | xargs grep -rn '\[\[' --include="*.md" --include="*.yml" --include="*.yaml" --include="*.sh" --include="*.ts" --include="*.json" 2>/dev/null | grep -v Binary || echo "✓ No unreplaced placeholders found"
	@echo ""
	@echo "Replace each token, then re-run 'make init' to verify."

## phase-scaffold: Create directories for a new product phase (usage: make phase-scaffold PHASE=2)
phase-scaffold:
	@if [ -z "$(PHASE)" ]; then echo "Usage: make phase-scaffold PHASE=2"; exit 1; fi
	@mkdir -p docs/02_outputs/phase$(PHASE)
	@mkdir -p docs/00_intake/phase$(PHASE)_attachments
	@echo "Created docs/02_outputs/phase$(PHASE)/ and docs/00_intake/phase$(PHASE)_attachments/"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Drop external feature docs into docs/00_intake/phase$(PHASE)_attachments/"
	@echo "  2. Fill docs/00_intake/phase_intake_questionnaire.md"
	@echo "  3. Work through docs/03_phase_prompts/ in order (01 → 05)"

## phase-task: Create a phase-prefixed task (usage: make phase-task PHASE=2 NAME=feature-name)
phase-task:
	@if [ -z "$(PHASE)" ]; then echo "Usage: make phase-task PHASE=2 NAME=my-feature"; exit 1; fi
	@if [ -z "$(NAME)" ]; then echo "Usage: make phase-task PHASE=2 NAME=my-feature"; exit 1; fi
	@cp tasks/_phase_template.md "tasks/active/p$(PHASE)-$(NAME).md"; \
	 echo "Created tasks/active/p$(PHASE)-$(NAME).md"
	@echo "Next: ask your AI tool to write tasks/active/p$(PHASE)-$(NAME).scratch.md before coding"

## phase-init: Scan for unreplaced placeholders in phase docs (usage: make phase-init PHASE=2)
phase-init:
	@if [ -z "$(PHASE)" ]; then echo "Usage: make phase-init PHASE=2"; exit 1; fi
	@echo "Scanning phase $(PHASE) docs for unreplaced [[PLACEHOLDER]] tokens..."
	@git ls-files docs/02_outputs/phase$(PHASE)/ docs/00_intake/phase_intake_questionnaire.md 2>/dev/null \
	  | xargs grep -rn '\[\[' 2>/dev/null || echo "No unreplaced placeholders found"

## help: Show this help
help:
	@grep -E '^## ' Makefile | sed 's/## //' | column -t -s ':'
