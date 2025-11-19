# Proof of Concept - Deployment

## Nasazení na server

### Prerekvizity na serveru
- Docker
- Docker Compose
- Git

### Instalace Dockeru (Ubuntu/Debian)
```bash
# Aktualizovat balíčky
sudo apt update

# Instalovat Docker
sudo apt install -y docker.io docker-compose

# Povolit Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Přidat uživatele do docker skupiny (nemusíte používat sudo)
sudo usermod -aG docker $USER
```

### Deployment

1. **Naklonovat repozitář**
```bash
cd /opt  # nebo jiný adresář pro aplikace
sudo git clone <URL_VAŠEHO_GIT_REPOZITÁŘE> proof-of-concept
cd proof-of-concept
```

2. **Spustit aplikaci**
```bash
sudo docker-compose up -d
```

Aplikace bude dostupná na `http://IP_SERVERU:9011`

### Aktualizace aplikace

Když uděláte změny v gitu:
```bash
cd /opt/proof-of-concept
sudo git pull
sudo docker-compose down
sudo docker-compose build
sudo docker-compose up -d
```

### Užitečné příkazy

```bash
# Zobrazit běžící kontejnery
sudo docker ps

# Zobrazit logy
sudo docker-compose logs -f

# Zastavit aplikaci
sudo docker-compose down

# Restartovat aplikaci
sudo docker-compose restart

# Rebuild a restart
sudo docker-compose up -d --build
```

### Automatický restart po restartu serveru
Docker Compose s `restart: always` zajistí, že se kontejner automaticky spustí po restartu serveru.

### Změna portu
Aplikace běží na portu **9011**. Pro změnu upravte v `docker-compose.yml`:
```yaml
ports:
  - "9011:80"  # aplikace bude na portu 9011
```

### HTTPS s Let's Encrypt (volitelné)
Pro production s HTTPS můžete přidat reverse proxy s Certbot, nebo použít Traefik.

### Technologie
Aplikace běží na Apache HTTP Server 2.4 v Docker kontejneru.

### Struktura projektů
- `www/` - webové soubory (HTML, CSS, JS)
- `Dockerfile` - definice Docker image
- `docker-compose.yml` - konfigurace služeb

Všechny soubory ve složce `www/` jsou automaticky namápovány do kontejneru, takže změny se projeví okamžitě bez rebuild.
