import subprocess
import sys
import time
import os
from datetime import datetime

# Colors
GREEN = "\033[92m"
BLUE = "\033[94m"
RED = "\033[91m"
CYAN = "\033[96m"
END = "\033[0m"
WHITE = "\033[97m"

def run_git(description, cmd):
    print(f"{CYAN}→ {description}...{END}", end=" ", flush=True)
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    
    if result.returncode != 0:
        if "nothing to commit" in result.stdout or "nothing to commit" in result.stderr:
            print(f"{BLUE}Done! (Nothing to change){END}")
            return
        print(f"\n{RED}❌ Error: {result.stderr.strip()}{END}")
        sys.exit(1)
    
    time.sleep(0.4)
    print(f"{GREEN}Done! ✅{END}")

def main():
    # Clear the terminal screen first for that "App" feel
    os.system('cls' if os.name == 'nt' else 'clear')

    dt = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    # Fixed the spacing here: no leading space in the string
    header_line = "=" * 35
    
    print(f"{WHITE}{header_line}")
    print(f"🚀 GITME: {GREEN}{dt}")
    print(f"{WHITE}{header_line}{END}\n")

    run_git("Staging changes", "git add .")
    run_git("Committing", f'git commit -m "🚀 {dt}"')
    #run_git("Pushing to GitHub", "git push origin main")
    
    # To make it work on any current branch:
    run_git("Pushing to GitHub", "git push origin $(git rev-parse --abbrev-ref HEAD)")

    print(f"\n{GREEN}🎉 All changes are live @bc!{END}\n")

if __name__ == "__main__":
    main()