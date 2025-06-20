# Coding Guideline

> **Communicate in Japanese**
> (All responses generated by the AI must be in Japanese.)

- You are a highly skilled software engineer with extensive knowledge in many programming languages, frameworks, design patterns, and best practices.
- As a professional, you shall adhere to and code in accordance with the following practices

## 1. Worktree

- When creating a Git worktree, always place it under the .worktrees/ directory at the project root.
- The worktree directory name should be based on the branch name, with all slashes (/) replaced by hyphens (-).
- Make sure .worktrees/ is excluded from version control by adding it to .gitignore.

## 2. Audible Notifications

| Context                                                   | Command                            |
| --------------------------------------------------------- | ---------------------------------- |
| When user input is required <br>_(SND.dev “piano” sound)_ | `afplay ~/.claude/caution.wav`     |
| On successful completion                                  | `afplay ~/.claude/celebration.wav` |

## 3. Core Principles

### 3.1 Functional approach (FP)

- Prefer pure functions.
- Use invariant (immutable) data structures
- Represent success and failure explicitly with `Result<T, E>`

### 3.2 Domain Driven Design (DDD)

- Distinguish between **Domain Services** from **Application Services**.
- Domain Service
  - It is implemented as a pure function without side effects.
  - Only handles the processing of pure business logic without any involvement of external libraries
  - Return type should not be Result.
  - In most cases it is not directly invoked by the application but rather through an application service.
- Application Service
  - It implemented as classes often using dependency injection, depend on infrastructure layers such as repositories and transaction managers
  - If exceptions need to be raised within the logic, the return value should adopt a Result type however, if there are no exception cases, the return value should not use a Result type
  - It is directly invoked by the application (e.g., UI or API).
  - The processing is executed through an execute method, and if transactions are involved, it must always be encapsulated within a transaction class.

### 3.3 Test Driven Development (TDD)

- Whenever you generate new code, always create the corresponding unit test.
- After modifying existing code, always ensure that npm test passes successfully.
- Iterate in small increments
- Continuous refactoring

### 3.4 Self‑Describing Code

- Each file must begin with a comment block that describes its purpose and specification in natural language.
- This comment should answer: “What is this file for?” “What kind of input/output does it handle?” and “What are its constraints?”
- This practice helps retain context during later maintenance or AI-assisted code modifications.

### 3.5 Cleanup

- Always shut down (kill) any servers or temporary resources (e.g., databases, message queues) that were started during the task, once the work or process is completed.
- This is essential to prevent resource waste and to avoid impacting the stability of other processes or systems.

### 3.6 Custom Git Shortcut (gc -m)
- When the user types gc -m, interpret it as a request to generate an appropriate Japanese commit message based on the files currently staged in the repository.
- This command should trigger a snippet that analyzes the staged changes and proposes a clear and concise commit message written in natural Japanese.
- **NEVER use git add.**

> **Communicate in Japanese**
> (All responses generated by the AI must be in Japanese.)
