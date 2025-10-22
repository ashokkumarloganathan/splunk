
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

this lab is based on docker and docker compose hence both are a prerequsites, if you have docker & docker compose installed already then you can skip installation step and directly start the lab.

### Docker Installation

Clone the repo and start the docker installation:

```
bash
git clone https://github.com/ashokkumarloganathan/splunk.git
cd splunk
chmod +x 'docker install'.sh
.\docker install.sh

```

When this step is completed start the lab

### Start The Lab

```
bash
chmod +x .\lab.sh
.\lab.sh
```

choose the available options to start / stop Lab or to access the Container CLI's

### Accessing the GUI

| Service | URL | Credentials |
|---------|-----|-------------|

| Splunk | http://localhost:8000 or http://100.100.100.100:8000 | admin / changeme |
| DVWA | http://localhost:8080/dvwa or http://100.100.100.101:8080/dvwa |admin / password |







- 🐳 **Splunk** (log monitoring)
- 🔐 **DVWA** (Damn Vulnerable Web App)
- 🐚 **Kali Linux** (penetration testing)

All services run on a custom Docker network with static IPs for easy targeting.

---

## 📦 Services & IP Mapping

| Service | Container Name | Static IP         | Port(s)             | Notes                     |
|---------|----------------|-------------------|----------------------|---------------------------|
| Splunk  | `splunk`       | `100.100.100.100` | `8000` (Web UI)      | Username: `admin` / Password: `changeme` |
| DVWA    | `dvwa`         | `100.100.100.101` | `8080` → `80`        | Web app for testing vulnerabilities |
| Kali    | `kali`         | `100.100.100.102` | (none exposed)       | CLI-only, use `docker exec` |

---

## 🚀 Getting Started

### 1. Prerequisites

- Docker
- Docker Compose (`docker compose` plugin or v2+ CLI)

> 🛠️ If you need help installing Docker: [Install Docker](https://docs.docker.com/get-docker/)

---

### 2. Setup & Run

Clone the repo and start the lab:

```bash
git clone https://github.com/your-username/docker-lab.git
cd docker-lab
docker compose up -d

3. Accessing Services

Splunk Web UI: http://localhost:8000

Login: admin / changeme

DVWA: http://localhost:8080

Kali Terminal:

docker exec -it kali bash

🧼 Teardown

To stop and remove everything (including volumes):

docker compose down -v


To preserve Splunk logs and data, omit the -v:

docker compose down

File Structure
docker-lab/
├── docker-compose.yml     # Defines the lab environment
└── README.md              # You're reading it!

📝 Notes

Static IPs are set using Docker’s custom network with IPAM

Splunk volume is persisted via Docker Volume (splunk-data)

All services run on an isolated lab-net Docker bridge network

🧑‍💻 License

MIT — feel free to fork, modify, and use for your own lab environments.
