@echo off
echo Starting Git upload process from latest_dist...

:: Navigate to latest_dist (optional if already there)
cd /d "%~dp0"

:: Remove any existing .git folder to start fresh
if exist .git (
    rmdir /s /q .git
    echo Removed existing Git repository.
)

:: Initialize a new Git repository
git init
echo Initialized new Git repository.

:: Set the branch to main
git branch -m main
echo Renamed default branch to main.

:: Add all files
git add .
echo Added all files to staging.

:: Commit the files
git commit -m "Latest clean build with public GitHub URLs"
echo Committed files.

:: Set the remote repository
git remote add origin https://github.com/vsrepalle/chess-tournaments-deploy.git
echo Set remote repository.

:: Force push to main branch
git push --force --set-upstream origin main
echo Pushed to GitHub.

echo Upload complete!
pause