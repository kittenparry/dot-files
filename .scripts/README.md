In `.profile`:
```bash
if [ -d "$HOME/.scripts" ]; then
	export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
fi
```
