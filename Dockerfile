# Menggunakan base image Node.js versi 14 dari Docker Hub
FROM node:14

# Menentukan working directory di dalam container adalah /app
# Semua perintah selanjutnya akan dieksekusi di direktori ini
WORKDIR /app

# Menyalin seluruh source code dari direktori saat ini ke working directory di container
COPY . .

# Mengatur environment variable untuk production mode
# NODE_ENV=production mengoptimalkan aplikasi untuk production
# DB_HOST=item-db menentukan hostname database MongoDB yang akan digunakan
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies yang dibutuhkan untuk production
# --production hanya menginstal dependencies (bukan devDependencies)
# --unsafe-perm memungkinkan npm scripts berjalan sebagai root
# npm run build untuk mem-build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080 yang digunakan oleh aplikasi
# Ini memberitahu Docker bahwa container mendengarkan di port 8080
EXPOSE 8080

# Perintah yang dijalankan saat container diluncurkan
# Menjalankan server dengan npm start
CMD ["npm", "start"]
