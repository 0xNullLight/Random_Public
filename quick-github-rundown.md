# Git and Git Bash Tutorial for Beginners

This tutorial will guide you through the basic tasks you will commonly use in Git and Git Bash, including cloning a repository, creating and switching branches, adding and committing files, pushing changes, and renaming folders.

## Clone the Git Repository

- **Navigate to your desired directory:**
    
    Open your terminal or command prompt and use the `cd` command to navigate to the directory where you want to clone the repository. Replace `[your_desired_directory]` with the path to your directory.
    
    ```bash
    cd [your_desired_directory]
    ```

- **Clone the Git repository:**

    Use the `git clone` command to clone your Git repository. Replace `[your_git_repository_link]` with the actual link to your repository.

    ```bash
    git clone [your_git_repository_link]
    ```

## Navigate into the Cloned Repository

- **Navigate into the cloned repository directory:**

    After cloning the repository, navigate into the newly created directory. Replace `[repository_name]` with the name of your repository folder.

    ```bash
    cd [repository_name]
    ```

## Create and Switch to a New Branch

- **Create and switch to a new branch:**

    Use the `git checkout` command with the `-b` flag to create and switch to a new branch. Replace `[new_branch_name]` with your desired branch name.

    ```bash
    git checkout -b [new_branch_name]
    ```

- **View the list of branches:**

    To confirm that the new branch has been created and switched to, use the `git branch` command to list all branches. The currently active branch will have an asterisk (*) next to it.

    ```bash
    git branch
    ```

## Create a New File and Commit Changes

- **Create a new Python script file:**

    Use the `touch` command to create a new Python script file named `data_collection.py`.

    ```bash
    touch data_collection.py
    ```

- **Stage the new file for commit:**

    Use the `git add` command to stage the new file for commit.

    ```bash
    git add data_collection.py
    ```

- **Commit the changes with a descriptive message:**

    Use the `git commit` command with the `-m` flag to commit the changes. Include a descriptive commit message within quotes.

    ```bash
    git commit -m "Add data_collection.py with requests library import"
    ```

## Push Changes to the Remote Repository

- **Push the new branch with changes to the remote repository:**

    Use the `git push` command to push the new branch and its changes to the remote repository. Replace `[new_branch_name]` with the name of your new branch.

    ```bash
    git push origin [new_branch_name]
    ```

## Rename a Folder Using Git Bash

- **Open Git Bash**: Navigate to the directory containing the folder you want to rename.

- **Navigate to the parent directory**:

    ```bash
    cd /path/to/parent/directory
    ```

- **Rename the folder**:

    ```bash
    mv old-folder-name new-folder-name
    ```

    Example: If you have a folder named `old-folder` that you want to rename to `new-folder`, you would run:

    ```bash
    mv old-folder new-folder
    ```

- **Renaming a folder tracked by Git**: If the folder is part of a Git repository, you should use Git to rename it to keep the repository history intact. Here’s how:

    - **Navigate to the repository**:

      ```bash
      cd /path/to/repository
      ```

    - **Rename the folder**:

      ```bash
      git mv old-folder-name new-folder-name
      ```

    - **Commit the changes**:

      ```bash
      git commit -m "Renamed folder old-folder-name to new-folder-name"
      ```

By following these detailed steps, you will have successfully cloned a Git repository, created a new branch, added a new file, committed the changes, and pushed the new branch to the remote repository. Additionally, you will know how to rename a folder using Git Bash.
