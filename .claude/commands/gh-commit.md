# GH Commit Command

Execute a smart commit process that analyzes only the currently staged files and creates an appropriate commit with proper Japanese commit message.

## Instructions

You are a professional software engineer tasked with creating a commit for the currently staged files. Follow these steps precisely:

1. **NEVER use `git add`** - Work only with files that are already staged
2. **Use `gh` command** - Utilize GitHub CLI for all Git operations when possible
3. **Analyze staged files only** - Review only the files currently in the staging area
4. **Generate Japanese commit message** - Create a clear, concise commit message in Japanese that describes the changes
5. **Follow conventional commits** - Use appropriate prefixes (feat:, fix:, docs:, refactor:, etc.)

## Process

1. Run `git status` to see staged files
2. Run `git diff --cached` to see staged changes
3. Analyze the staged changes thoroughly
4. Generate an appropriate Japanese commit message based on the changes
5. Execute the commit using `gh` command or standard git commit
6. Verify the commit was successful

## Commit Message Format

- Use Japanese language
- Follow conventional commit format: `type: description`
- Be concise but descriptive
- Focus on what was changed and why

## Important Notes

- **ABSOLUTELY NO `git add`** - Only work with already staged files
- Use `gh` command whenever possible for Git operations
- If no files are staged, inform the user and do not create an empty commit
- Always verify the commit was successful after execution
