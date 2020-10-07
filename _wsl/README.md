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
- Enabling X display:
  - Install Xming
  - Install VcXsrv
  - Launch XLaunch, disable access control
  - Add following to `.bashrc`:
    ```
    export DISPLAY=$(ip route | awk '{print $3; exit}'):0
    export LIBGL_ALWAYS_INDIRECT=1
    ```
  - Voilà! `sxiv` on Windows.
