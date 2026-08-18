# Gunakan image resmi Node.js versi LTS (Alpine untuk ukuran lebih kecil)
FROM node:18-alpine

# Buat direktori kerja di dalam container
WORKDIR /usr/src/app

# Salin file package.json dan package-lock.json (jika ada)
# Langkah ini memanfaatkan caching Docker agar instalasi dependensi lebih cepat
COPY package*.json ./

# Instal dependensi (akan dilewati jika tidak ada dependensi pada contoh http murni)
#RUN npm ci --only=production || npm install --only=production

# Salin kode sumber aplikasi ke dalam container
COPY . .

# Ekspos port yang digunakan aplikasi
EXPOSE 3001

# Perintah untuk menjalankan aplikasi
CMD ["node", "app.js"]   
