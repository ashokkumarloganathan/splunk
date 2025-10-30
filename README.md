
# 🧪 Splunk Enterprise Lab using Docker Containers

![License](https://img.shields.io/badge/License-MIT-yellow.svg)
![Platform](https://img.shields.io/badge/Platform-Linux-blue.svg)

This project sets up containarized lab for splunk hands on training using three containers Splunk, Damn Vulnerable Web Application (DVWA) and Kali Linux using Docker Compose. this can be brought up and teared down within 5 mins saving time and efforts, since these services are running in a containerized envoirnment it can run with very minimal resources with docker network and persistant storage for services.

## System requirements

* Ubuntu 22.0 and Above
* CPU with 4 Cores 
* Minimum 8 GB of RAM
* 128 GB Storage

## Lab Architecture

<img width="741" height="481" alt="image" src="https://github.com/user-attachments/assets/4a8d6de5-8bd0-40db-acd5-3dd37a8291e5" />


## Installation & Lab Setup

### Downloading required Files 

```bash
apt install unzip
wget https://github.com/ashokkumarloganathan/splunk/archive/refs/heads/main.zip
unzip main.zip
cd splunk-main
```

### Docker Installation

If you already have docker and docker compose installed then you can skip this step.


```bash
chmod +x docker_install.sh
./docker_install.sh

```

### Start The Lab

Run the lab.sh and choose the appropriate option to start or stop the lab.

```bash
chmod +x *.sh
./lab.sh
```

The script has the following options.

```
"1. Go To Lab Menu:"
```
Choose the Option 1 to go to Lab Menu and select the Lab you wish to start

```
Start The Lab.
-----------------------
Choose the Lab to Start
1. Lab 1 - Configuring Universal Forwarder in Ubuntu:
2. Lab 2 - Configuring Splunk to Receive Syslogs:
3. Lab 3 - Setting Up Splunk Heavy Forwarder:
-----------------------

```
Under Each Lab choose the appropriate option

```
please use the menu below to navigate through the lab options
-----------------------
1. Start The Lab:
2. Check The Status:
3. Access DVWA CLI:
4. Access Splunk CLI:
5. Access Splunk HF CLI:
6. Stop The Lab:
-----------------------

```

## Disclamier

This project is created for learning purpose only - do not use this config in production or internet facing envoirnments.
