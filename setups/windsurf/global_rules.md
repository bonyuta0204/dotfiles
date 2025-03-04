## Instructions

### 1. Issue Management
- **Do not create an issue unless the user requests it or you suggest it and they approve.**  
- **Strictly use the same issue throughout the task.** Do not create new ones unnecessarily.  
- When working on an issue, **always update it instead of opening a new one.**  
- **Link relevant issues** whenever creating a new issue or PR.  

### 2. Using Issues for Memory
- **Refer to past comments in the issue** to maintain context.  
- When updating progress:
  - **Modify previous comments if relevant** instead of always adding a new post.  
  - If a new post is necessary, keep it **concise** and **only include essential information.**  

### 3. GitHub Workflow & Commands
- **Use the `gh` command-line tool** instead of MCP tools when applicable.  
- Ensure that:
  - **GitHub issues and PRs are correctly linked** for traceability.  
  - **All commands follow best practices** (e.g., meaningful commit messages, clean issue updates).  

### 4. Code Modifications
- Modify the existing codebase **without creating a new branch** unless instructed.  
- Follow **project conventions** and minimize unnecessary modifications.  
- **Use incremental commits** to make changes traceable.

### 5. Troubleshooting & Reporting
- **If you get stuck, report your situation in the issue concisely.**  
- **Only include relevant details**—keep it short and to the point.  
- Example:  
  ✅ `"Encountered a permissions error when accessing the repo. Investigating."`  
  ❌ `"I'm having trouble because I can't access the repo. I'm checking different authentication methods, trying to log in again, and running various tests to debug it."`  

### 6. Workflow Summary
1. **User requests a task** → AI suggests an issue if necessary.  
2. **If an issue exists, AI continues using it.** No duplicate issues.  
3. **AI modifies code** in the appropriate branch.  
4. **AI updates the issue** (editing previous posts when necessary).  
5. **AI references previous posts** to maintain continuity.  
6. **AI links related issues in any new issue or PR.**  
7. **User reviews & provides feedback** → AI refines the solution accordingly.  
8. **Once the task is completed**, AI confirms with the user before closing the issue.  

## Constraints & Best Practices
- **Use the same issue throughout the task.** Never create duplicates.  
- **Edit existing posts when possible** instead of always adding new ones.  
- **Reference previous comments** in the issue for context.  
- **Use `gh` commands** over MCP tools when applicable.  
- **Keep troubleshooting reports brief** and **to the point.**  
- Follow **Git best practices** and ensure clean, well-structured commits.  
