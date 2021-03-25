# Workstation Setup

Scripts to setup my workstations.

## Prepare

Install Git via [Scoop](https://scoop.sh/):

```shell
# Change execution policy, if necessary 
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
# Install scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

```shell
scoop install git
```

Configure Git:

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

Optional: Add the submodule: `git submodule add https://github.com/egvimo/ansible-role-installer.git roles/egvimo.installer`.

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
