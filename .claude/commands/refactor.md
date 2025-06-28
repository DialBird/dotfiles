# Refactor

Execute a comprehensive, systematic refactoring process with the following phases:

## Phase 1: Completeness Analysis
- **Detect unused code** using TypeScript MCP tools:
  - Use `mcp__typescript__lsmcp_search_symbols` to collect all symbols
  - Use `mcp__typescript__lsmcp_find_references` to analyze usage for each symbol
  - Generate list of unused functions, variables, and imports
- **Identify technical debt**:
  - Search for TODO/FIXME comments using Grep
  - Find temporary code patterns (test-*, temp-*, debug-*)
  - Locate development console.log/console.warn statements in production code
- **Find duplicate code**:
  - Identify functions with identical functionality
  - Detect duplicate type definitions
  - Find similar patterns that can be consolidated

## Phase 2: Impact Mapping
- **Visualize dependencies**:
  - Analyze inter-file dependencies using `mcp__typescript__lsmcp_find_references`
  - Map impact scope of planned changes
- **Detect breaking changes**:
  - Analyze impact of public API changes on other modules
  - Identify scope of type definition changes

## Phase 3: Safe Removal & Consolidation
- **Incremental deletion**:
  - Remove unused code in reverse dependency order
  - Run build tests after each deletion
- **Consolidate duplicates**:
  - Keep more generic and maintainable implementations
  - Ensure tests pass after consolidation

## Phase 4: Quality Assurance
- **Auto-formatting**:
  - Run formatters (Prettier, ESLint) 
  - Optimize import statements
- **Build verification**:
  - TypeScript compilation check
  - Test execution
  - Production build verification

## Phase 5: Documentation & Cleanup
- **Generate change log**:
  - List removed functionality
  - Map consolidated features
  - Detail breaking changes
- **Final verification**:
  - Review git diff for unintended changes
  - Confirm all changes align with refactoring goals

## Error Handling
- **Rollback capability**: Create git commits at each phase for safe rollback
- **Detailed progress reporting**: Clearly communicate current work and remaining tasks
- **Pause/resume functionality**: Support interruption and resumption for long operations

## Execution Priority
1. Safest changes first (debug logs, comments)
2. Unused code removal (verified no references)
3. Duplicate consolidation (clear impact scope)
4. Complex refactoring (with comprehensive testing)

This systematic approach prevents incomplete cleanup and ensures safe, thorough refactoring.
