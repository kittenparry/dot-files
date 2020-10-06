### Notes for WSL (Windows Subsystem for Linux)

- To solve `apt get update` not working ([source](https://github.com/microsoft/WSL/issues/4435#issuecomment-645600746)):
  ```
  Create a file: /etc/wsl.conf.
  Put the following lines in the file
  [network]
  generateResolvConf = false
  In a cmd window, run wsl --shutdown
  Restart WSL2
  Create a file: /etc/resolv.conf. If it exists, replace existing one with this new file.
  Put the following lines in the file
  nameserver 8.8.8.8
  Repeat step 3 and 4. You will see git working fine now.
  ```
