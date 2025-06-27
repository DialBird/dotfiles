# Create/Update PR Body Prompt

- Please create/update the body of PR using the `gh` command.
- The PR should focus on implementation details and changes, while referencing Issue for requirements and specifications.
- Write the PR body in Japanese.

## Requirements

- Use `gh pr edit <pr-number> --body` command with heredoc format
- Do not reference related issues in the PR body (they are documented elsewhere)
- Focus on **what was implemented** and **how**, not **why** (that's covered in the issue)
- Include technical implementation details
- List major changes and new files/directories
- Specify verification steps completed
- Note any deployment considerations
- Mention breaking changes (if any)

## Structure

The PR body should include:
1. **実装概要** - Brief overview of what was built
2. **主要な変更点** - Key additions and modifications
3. **技術的な実装** - Architecture and technology choices
4. **依存関係** - New dependencies or changes
5. **検証完了** - Tested functionality
6. **デプロイの注意点** - Important setup/configuration details
7. **破壊的な変更** - Any backwards incompatible changes
