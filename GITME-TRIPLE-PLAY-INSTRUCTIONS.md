## gitme-triple-play

### Move into a specific project
cd ~/Workspace/business/client-project

### Run the script by pointing to its location
✅ gojo@alfred lrmidland-www % python3 ../gitme-triple-play.py
python3 ../gitme-triple-play.py "Updated the readme"

- If you provide a message (e.g., python3 commit.py "fixed bug"), it will append it to the timestamp. If you provide nothing, it will just use the standard string.


### Folder structure

gojo@alfred business % tree
.
├── gitme-triple-play.py ✅ we are executing this from inside `lrmidland-www`
└── lrmidland-www
    ├── gitme-triple-play.py
    ├── INSTRUCTIONS.md
    └── README.md

2 directories, 4 files