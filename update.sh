#!/bin/bash

echo "Aktualizuji z Git repozitáře..."
sudo git fetch
sudo git pull

echo "Restartuji Docker kontejner..."
sudo docker-compose up -d --build

echo "Hotovo! Změny aplikovány."
