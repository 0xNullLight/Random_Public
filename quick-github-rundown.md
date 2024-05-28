
- **Navigate to your desired directory:**

Open your terminal or command prompt and use the `cd` command to navigate to the directory where you want to clone the repository. Replace `[your_desired_directory]` with the path to your directory.

`cd [your_desired_directory]` 
    
-   **Clone the Git repository:**
    
    Use the `git clone` command to clone your Git repository. Replace `[your_git_repository_link]` with the actual link to your repository.
    
`git clone [your_git_repository_link]` 
    
-   **Navigate into the cloned repository directory:**
    
    After cloning the repository, navigate into the newly created directory. Replace `[repository_name]` with the name of your repository folder.
        
`cd [repository_name]` 
    
-   **Create and switch to a new branch:**
    
    Use the `git checkout` command with the `-b` flag to create and switch to a new branch. Replace `[new_branch_name]` with your desired branch name.
        
`git checkout -b [new_branch_name]` 
    
-   **View the list of branches:**
    
    To confirm that the new branch has been created and switched to, use the `git branch` command to list all branches. The currently active branch will have an asterisk (*) next to it.
        
`git branch` 
    
-   **Create a new Python script file:**
    
    Use the `touch` command to create a new Python script file named `data_collection.py`.
        
`touch data_collection.py` 
    
-   **Stage the new file for commit:**
    
    Use the `git add` command to stage the new file for commit.
    
   `git add data_collection.py` 
    
-   **Commit the changes with a descriptive message:**
    
    Use the `git commit` command with the `-m` flag to commit the changes. Include a descriptive commit message within quotes.
    
`git commit -m "Add data_collection.py with requests library import"` 
    
-   **Push the new branch with changes to the remote repository:**
    
    Use the `git push` command to push the new branch and its changes to the remote repository. Replace `[new_branch_name]` with the name of your new branch.
    

`git push origin [new_branch_name]` 
    
By following these detailed steps, you will have successfully cloned a Git repository, created a new branch, added a new file, committed the changes, and pushed the new branch to the remote repository.
