#!/bin/bash

today=$(date +"%Y-%m-%d")
tomorrow=$(gdate -d "tomorrow" '+%Y-%m-%d')
yesterday=$(gdate -d "yesterday" '+%Y-%m-%d')
file="$SECOND_BRAIN"'/periodic-notes/daily-notes/'$(date +"%Y-%m-%d").md

cd "$SECOND_BRAIN" || exit

new_note() {
	touch "$file"

	# Format the file with the daily template
	cat <<EOF >"$file"
# $today

[[$yesterday]] - [[$tomorrow]]

## Habits

- [ ] A healthy breakfast
- [ ] Writing my daily tasks
- [ ] Write at least one line of code
- [ ] Contribute to the community
- [ ] Exercise for at least 20 minutes
- [ ] Tidy up

- [ ] Calorie logging
- [ ] Yoga
- [ ] Bedtime routine
- [ ] Skin routine
- [ ] CKS Katas - RBAC & Network Policies

## Log
EOF

}

# If the daily note does not exist, create a new one.
# this uses the test command with the -f flag.
if [ ! -f "$file" ]; then
	echo "File does not exist, creating new daily note."
	new_note
fi

# Open the daily note at the bottom of the file in insert mode and run NoNeckPain to make it center
nvim '+ normal Gzzo' "$file" -c :NoNeckPain
