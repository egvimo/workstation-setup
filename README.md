# Workstation Setup

Scripts to setup my workstations.

## Prepare

Allow script execution:

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force
```

Install Git and configure it:

```shell
# Global
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@example.com"
```

```shell
# Repo specific
git config user.name "FIRST_NAME LAST_NAME"
git config user.email "MY_NAME@example.com"
```

## Setup

Clone this repository:

```shell
git clone https://github.com/egvimo/workstation-setup.git
```

Run [setup_windows.ps1](setup_windows.ps1) script inside PowerShell with elevated rights. This script triggers a restart after enabling WSL. Run this script again after restart to finish the Windows setup.

Open WSL and run [setup_wsl.sh](setup_wsl.sh) script.

Set the correct values for the [hosts](hosts) and [variables](group_vars/workstations.yml).

Enter the virtual environment with

```shell
source .venv/bin/activate
```

Obtain a Kerberos ticket

```shell
kinit user@DOMAIN
```

and run the playbook

```shell
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook workstations.yml
```
