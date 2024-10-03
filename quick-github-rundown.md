
# Git and Git Bash Tutorial

This tutorial will guide you through common tasks using Git and Git Bash, including cloning a repository, working with branches, adding and committing files, pushing changes, renaming folders, and fetching updates.

---

## Clone the Git Repository

1. **Navigate to your desired directory**:  
   Open Git Bash or your terminal and use the `cd` command to go to the directory where you want to clone the repository. Replace `[your_desired_directory]` with the path to your folder.
   
   ```bash
   cd [your_desired_directory]
   ```

2. **Clone the Git repository**:  
   Use `git clone` to download a copy of the repository. Replace `[your_git_repository_link]` with the URL of the repository.
   
   ```bash
   git clone [your_git_repository_link]
   ```

---

## Navigate into the Cloned Repository

1. **Enter the repository directory**:  
   After cloning, navigate into the newly created repository folder. Replace `[repository_name]` with your repository’s name.
   
   ```bash
   cd [repository_name]
   ```

---

## Check Repository Status

1. **Check current repository status**:  
   Use `git status` to check which files have been modified, added, or staged for commit.
   
   ```bash
   git status
   ```

   This command is useful for seeing what changes have been made in your working directory and what actions are needed (e.g., adding or committing files).

---

## Pull Latest Changes from Remote (if needed)

1. **Fetch and pull updates**:  
   Before making any changes, it's a good practice to make sure your local repository is up to date with the remote version. Use `git pull` to fetch and integrate the latest changes from the remote branch.
   
   ```bash
   git pull origin main
   ```

   Replace `main` with the name of your main branch, if it’s named differently (e.g., `master` or `dev`).

---

## Create and Switch to a New Branch

1. **Create and switch to a new branch**:  
   Use `git checkout -b` to create and immediately switch to a new branch. Replace `[new_branch_name]` with your desired branch name.
   
   ```bash
   git checkout -b [new_branch_name]
   ```

2. **View the list of branches**:  
   To see all branches in the repository, use:
   
   ```bash
   git branch
   ```

   This will display the branches, with an asterisk (`*`) next to the currently active branch.

---

## Create a New File and Commit Changes

1. **Create a new file**:  
   Use `touch` to create a new file, for example, a Python script named `data_collection.py`.
   
   ```bash
   touch data_collection.py
   ```

2. **Stage the new file**:  
   Add the new file to the staging area using `git add`.
   
   ```bash
   git add data_collection.py
   ```

3. **Commit the changes**:  
   After staging, commit the changes with a descriptive message.
   
   ```bash
   git commit -m "Add data_collection.py with requests library import"
   ```

---

## Push Changes to the Remote Repository

1. **Push your branch and changes**:  
   After committing, use `git push` to send the new branch and its changes to the remote repository. Replace `[new_branch_name]` with the name of your branch.
   
   ```bash
   git push origin [new_branch_name]
   ```

   This pushes your changes to the remote repository under your new branch.

---

## Fetch Updates Without Merging (Optional)

1. **Fetch updates**:  
   Use `git fetch` to retrieve updates from the remote repository without automatically merging them. This can be useful when you want to review the changes before merging.
   
   ```bash
   git fetch origin
   ```

2. **View differences**:  
   After fetching, you can review the changes using:
   
   ```bash
   git diff origin/main
   ```

   Replace `main` with the relevant branch name.

---

## Rename a Folder Using Git Bash

1. **Navigate to the parent directory**:  
   Change to the parent directory of the folder you want to rename.
   
   ```bash
   cd /path/to/parent/directory
   ```

2. **Rename the folder**:  
   Use the `mv` command to rename the folder. Replace `old-folder-name` and `new-folder-name` with the current and new names of the folder.
   
   ```bash
   mv old-folder-name new-folder-name
   ```

3. **Renaming a folder tracked by Git**:  
   If the folder is tracked by Git, it’s important to use `git mv` to keep the repository’s history intact.
   
   ```bash
   git mv old-folder-name new-folder-name
   ```

4. **Commit the rename**:  
   Commit the change to keep track of the rename.
   
   ```bash
   git commit -m "Renamed folder from old-folder-name to new-folder-name"
   ```

---

## Undoing Changes (Optional)

If you made changes but want to undo them without deleting the changes in your working directory, you can use `git reset --soft` to move back to a previous commit.

1. **View commit history**:  
   Run `git log` to see the commit history and copy the commit hash of the commit you want to reset to.
   
   ```bash
   git log
   ```

2. **Reset to the chosen commit**:  
   Use `git reset --soft` with the commit hash to undo commits while keeping the changes.
   
   ```bash
   git reset --soft <commit-hash>
   ```

---

## Pulling Everything Together: Workflow Example

 - Clone the repository.
   ```bash
   git clone [your_git_repository_link]
   ```
   
 - Create a new branch and switch to it.
   ```bash
   git checkout -b [new_branch_name]
   ```

 - Check repository status before making changes.
   ```bash
   git status
   ```

 - Create and commit a new file.
   ```bash
   touch new_file.txt
   git add new_file.txt
   git commit -m "Added new_file.txt"
   ```

 - Push the new branch and changes to the remote.
   ```bash
   git push origin [new_branch_name]
   ```VVVVV

 - Rename a folder and commit the change.
   ```bash
   git mv old-folder new-folder
   git commit -m "Renamed folder"
   ```
___

**VVVVVVVVVV
Below is the typical workflow (quick and easy)
VVVVVVVVVV**

# Quick, Agile Approach to Git Workflow

In an Agile environment, speed and efficiency are key. Here's a streamlined version of the typical Git process, focusing on rapid iteration and collaboration:

### 1. Clone the Repository

```bash
git clone [repo_url]
cd [repository_name]
```

### 2. Switch to the Correct Branch (if needed)

```bash
git checkout [branch_name]
```

### 3. Add Your Files

```bash
git add [file_name]  # or use . to add everything
```

### 4. Commit the Changes

```bash
git commit -m "Your commit message"
```

### 5. Push to the Remote Branch

```bash
git push origin [branch_name]
```

That’s it! You've cloned, added files, committed, and pushed changes.
