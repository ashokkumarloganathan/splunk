
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
wget https://github.com/ashokkumarloganathan/splunk/archive/refs/heads/main.zip
unzip main.zip
cd splunk-main
```

### Docker Installation

If you already have docker and docker compose installed then you can skip this step.


```bash
chmod +x 'docker install'.sh
.\docker install.sh

```

### Start The Lab

Run the lab.sh and choose the appropriate option to start or stop the lab.

```bash
chmod +x .\lab.sh
.\lab.sh
```

The script has the following options.

```
"1. Start The Lab:"
"2. Check The Status:"
"3. Access DVWA CLI:"
"4. Access Splunk CLI:"
"5. Stop The Lab:"
```

### Accessing the Splunk & DVWA Web Portals

| Service | URL | Credentials |
|---------|-----|-------------|
| Splunk | http://localhost:8000 or http://100.100.100.100:8000 | admin / changeme |
| DVWA | http://localhost:8080/dvwa or http://100.100.100.101:8080/dvwa |admin / password |

First Time DVWA access requires DVWA DB Setup post login. 



## Disclamier

This project is created for learning purpose only - do not use this config in production or internet facing envoirnments.
