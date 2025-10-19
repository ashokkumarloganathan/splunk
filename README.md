# 🧪 Docker Lab Environment

This project sets up a mini lab using Docker Compose with:

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