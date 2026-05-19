import os
import subprocess
import sys
from datetime import datetime

# Your Workspace Configuration
CONFIG_MAP = {
    "main": {
        "email": "bencarpena@gmail.com",
        "alias": "github.com-bencarpena"
    },
    "play": {
        "email": "alfred.silverton.ai@gmail.com",
        "alias": "github.com-alfredsilverton"
    },
    "business": {
        "email": "brightoaks@gmail.com",
        "alias": "github.com-business"
    },
}

def run_git(args):
    try:
        # We use check=True to ensure the script stops if a git command fails
        result = subprocess.run(["git"] + args, capture_output=True, text=True, check=True)
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        error_msg = e.stderr.strip() if e.stderr else f"(Return code {e.returncode})"
        if args[0] == "config" and args[1] == "user.email" and e.returncode == 1:
            error_msg = "Git user.email is not set. Please run: git config user.email your@email.com"
        print(f"❌ Git Error: {error_msg}")
        sys.exit(1)

def get_timestamp_string():
    now = datetime.now()
    # Format: yyyymmddhhmmss + 3 digits of milliseconds
    return now.strftime("%Y%m%d%H%M%S") + f"{now.microsecond // 1000:03d}"

def main():
    cwd = os.getcwd()
    
    # 1. Detect Workspace Context
    workspace_type = None
    for folder_name in CONFIG_MAP.keys():
        if f"/Workspace/{folder_name}" in cwd:
            workspace_type = folder_name
            break

    if not workspace_type:
        print("❌ Error: Not inside ~/Workspace/main, play, or business.")
        return

    # 2. Identity Verification
    active_email = run_git(["config", "user.email"])
    expected_email = CONFIG_MAP[workspace_type]["email"]

    if active_email != expected_email:
        print(f"🚨 IDENTITY MISMATCH! Expected {expected_email}, found {active_email}")
        return

    # 3. Generate Commit Message
    timestamp = get_timestamp_string()
    base_msg = f"commit tag 🚦 {timestamp}"
    user_comment = " ".join(sys.argv[1:])
    final_msg = f"🚦 {base_msg} - {user_comment}" if user_comment else base_msg

    # 4. Automate Workflow
    print(f"--- Workspace: {workspace_type.upper()} ---")
    print(f"Staging and committing: {final_msg}")
    
    run_git(["add", "."])
    run_git(["commit", "-m", final_msg])
    
    print("✅ Local commit successful. Pushing to GitHub...")
    
    # Dynamically find the current branch to support main or master
    current_branch = run_git(["rev-parse", "--abbrev-ref", "HEAD"])
    run_git(["push", "origin", current_branch])
    
    print(f"🚀 Successfully pushed {current_branch} to {CONFIG_MAP[workspace_type]['alias']}!")

if __name__ == "__main__":
    main()