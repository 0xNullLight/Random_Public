''
cd downloads  # Navigate to your desired directory on your local machine
git clone [your_git_repository_link]  # Replace [your_git_repository_link] with the actual link to your Git repository
cd [repository_name]  # Navigate into the cloned repository directory
git checkout -b [new_branch_name]  # Create and switch to a new branch, replace [new_branch_name] with any desired name
git branch  # View the list of branches to confirm the new branch is created
touch data_collection.py  # Create a new Python script file named data_collection.py
git add data_collection.py  # Stage the new file for commit
git commit -m "Add data_collection.py with requests library import"  # Commit the changes with a descriptive message
git push origin [new_branch_name]  # Push the new branch with changes to the remote repository
''
