#!/bin/bash

# =============================================================================
# Script untuk Build dan Push Docker Image ke GitHub Container Registry (ghcr.io)
# =============================================================================

# Ganti YOUR_GITHUB_USERNAME dengan username GitHub Anda
GITHUB_USERNAME="itsam77"

# Ganti YOUR_GITHUB_TOKEN dengan Personal Access Token (PAT) GitHub Anda
# Cara membuat PAT:
# 1. Buka GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
# 2. Klik "Generate new token (classic)"
# 3. Beri nama token, lalu centang scope:
#    - write:packages
#    - read:packages
#    - delete:packages
# 4. Klik "Generate token" dan salin tokennya
GITHUB_TOKEN="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"

# 1. Build Docker image dari Dockerfile
# -t untuk memberikan nama dan tag pada image
# item-app:v1 adalah nama image dengan tag v1
# . menunjukkan Dockerfile berada di direktori saat ini
docker build -t item-app:v1 .

# 2. Melihat daftar image di lokal
# Menampilkan semua Docker images yang tersedia di mesin lokal
docker images

# 3. Mengubah nama image agar sesuai dengan format GitHub Container Registry
# Format: ghcr.io/USERNAME/IMAGE_NAME:TAG
# ghcr.io adalah registry GitHub Container Registry
docker tag item-app:v1 ghcr.io/$GITHUB_USERNAME/item-app:v1

# 4. Login ke GitHub Container Registry via Terminal
# Menggunakan Personal Access Token (PAT) untuk autentikasi
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# 5. Mengunggah image ke GitHub Container Registry
# Push image yang sudah di-tag ke ghcr.io
docker push ghcr.io/$GITHUB_USERNAME/item-app:v1
