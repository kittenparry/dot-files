## Scripts

#### Others'
- `scrlock.sh` - Glitchy lock screen script ([Source](https://github.com/x-zvf/dotfiles/blob/master/scripts/scrlock.sh))

#### Own
- `dss` - Launch different programs without smooth scrolling
	- `dssd` - Discord
	- `dsss` - Spotify
- `pyway_colour_selector` - Select a colour scheme from a list to apply
- `backup_all` - General back up of somewhat important files
- `blogs` - Back up myLogs.txt to different partitions & directories with dates
- `catl` - `grep` from myLogs.txt
- `exo` - [ex](https://github.com/kittenparry/dot-files/blob/54928e73868e6a179fef104f3e77eecde842be9a/.bashrc#L119) with filename to output directory
- `move` - Organise files in Downloads based on extensions
- `nvidia_term_colour_fix` - Colour scheme fix for `nvidia-smi` terminal on ws4
- `ordwn` - Organise downloads directory using `move` and [pddcat](https://github.com/kittenparry/pddcat)
- `pcatl` - An incomplete Python port of `catl`
- `rpa` - RPA Extractor for loop to go through a directory of .rpa files at once
- `run_log_recorder` - Run Log Recorder from Dropbox's directory
- `sga` - Compress & move aside SuicideGirls directories for archival
- `sp` - Start page selector using `rofi`

#### Requires
In `.profile`:
```bash
if [ -d "$HOME/.scripts" ]; then
	export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
fi
```
