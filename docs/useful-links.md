# Useful Links

Curated resources for people building with opencode and agentic developer workflows.

This is an appendix, not the canonical product overview.

## opencode

- opencode docs: https://opencode.ai/docs
- opencode config schema: https://opencode.ai/config.json

Use these for validating agent, command, skill, MCP, and config shapes.

## Guardrails And Agent Safety

- NVIDIA NeMo Guardrails: https://github.com/NVIDIA/NeMo-Guardrails
- NVIDIA NeMo Guardrails docs: https://docs.nvidia.com/nemo/guardrails/latest/

Useful for topic control, jailbreak mitigation, tool-use boundaries, and agentic security thinking.

## Agent Frameworks

- OpenAI Agents SDK: https://github.com/openai/openai-agents-python
- LangGraph: https://github.com/langchain-ai/langgraph
- Microsoft AutoGen: https://github.com/microsoft/autogen
- CrewAI: https://github.com/crewAIInc/crewAI

These are useful reference points for orchestration patterns. Open Tools stays lighter: copyable opencode agents, commands, and skills rather than a runtime framework.

## Codebase Mapping And Context Packing

- Repomix: https://github.com/yamadashy/repomix
- Gitingest: https://github.com/cyclotruc/gitingest
- Sourcegraph Cody: https://sourcegraph.com/cody

These help map or package codebases for AI review. Open Tools complements them with `/map-repo`, `/repo-cartographer`, and session memory workflows.

## Ideas To Borrow Carefully

- Keep agents bounded and reviewable.
- Prefer strict structured outputs when code must consume model output.
- Preserve source IDs, evidence, checksums, run IDs, and review decisions for auditability.
- Use durable handoff files so token limits do not erase project state.
- Separate strategy, product, copy, design, frontend, backend, QA, and release roles when work becomes complex.
