# Server Access and User Management

[![Prod Env User Update](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/prod.yml/badge.svg)](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/prod.yml)
[![UAT Env User Update](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/uat.yml/badge.svg)](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/uat.yml)
[![QA Env User Update](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/qa.yml/badge.svg)](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/qa.yml)
[![Dev Env User Update](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/dev.yml/badge.svg)](https://github.com/KB-iGOT/igot-gcp-server-access/actions/workflows/dev.yml)

This repository is used to manage users for Linux remote servers. Users can request the creation of new accounts or update existing ones by creating pull requests with the necessary details in the `users/dev.yml` file.

## Table of Contents

- [Prerequisites](#prerequisites)
- [How to Generate a Password](#how-to-generate-a-password)
- [How to Generate an SSH Key](#how-to-generate-an-ssh-key)
- [Updating the `users/dev.yml` File](#updating-the-usersteamyml-file)
- [Creating a Pull Request](#creating-a-pull-request)

## Prerequisites

- Linux environment (for generating password and SSH key)
- GitHub account
- Git installed on your local machine

## How to Generate a Password

1. Open your terminal.
2. Run the following command to install `mkpasswd` if it is not already installed:
    ```sh
    sudo apt-get install whois
    ```
3. Generate a password hash using the `mkpasswd` command:
    ```sh
    mkpasswd --method=sha-512
    ```
4. You will be prompted to enter your desired password. Once entered, the command will output an encrypted password string.

## How to Generate an SSH Key

1. Open your terminal.
2. Run the following command to generate a new SSH key:
    ```sh
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
3. Follow the prompts to save the key to the default location (usually `~/.ssh/id_rsa`) and enter a passphrase if desired.
4. After generating the key, you can display the public key with:
    ```sh
    cat ~/.ssh/id_rsa.pub
    ```
5. Copy the output, which will look something like this:
    ```
    ssh-rsa AAAAB3... rest_of_your_key ... your_email@example.com
    ```

## Updating the `users/dev.yml` File

1. Fork this repository to your own GitHub account.
2. Clone your fork to your local machine:
    ```sh
    git clone https://github.com/KB-iGOT/igot-gcp-server-access.git
    ```
3. Navigate to the repository directory:
    ```sh
    cd igot-gcp-server-access
    ```
4. Open the `users/dev.yml` file in a text editor.
5. Add or update a user entry with your details:
    ```yaml
    users:
      username: # your username
        state: present
        password: "$6$/BprRrv6N2" # replace with your generated password hash
        ssh_public_key: "ssh-rsa AAAAB...your_key... your_email@example.com"
    ```

## Creating a Pull Request

1. Commit your changes:
    ```sh
    git add users/dev.yml
    git commit -m "Add/Update user 'username'"
    ```
2. Push your changes to your fork:
    ```sh
    git push origin main
    ```
3. Go to the original repository on GitHub and create a pull request from your fork.

## Reviewing and Merging

Your pull request will be reviewed by a repository maintainer. Once approved, your changes will be merged, and the new user configuration will be applied to the Linux remote servers.


