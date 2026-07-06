#!/bin/bash

echo "====================================="
echo "       CANLI AĞ VE PORT DENETLEYİCİ    "
echo "====================================="

echo "[1] İnternet Bağlantı Durumu (Ping Testi):"


if ping -c 2 8.8.8.8 > /dev/null 2>&1; then
    echo "Bağlantı: AKTİF (İnternet erişimi var)"
else
    echo "Bağlantı: HATA (İnternet erişimi yok veya engellenmiş)"
fi

echo "-------------------------------------"
echo "[2] Dinlenen (Listen) Aktif Portlar ve Servisler:"
# ss komutu ile TCP ve UDP dinlenen portları, servis isimleriyle beraber listeliyoruz
# Soket çöplerini ayıklayıp sadece temiz başlıkları ve portları çeker
ss -tuln | awk 'NR==1 || /LISTEN/'

echo "-------------------------------------"
echo "[3] Aktif Ağ Arayüzleri (Network Interfaces):"
# Sunucudaki ağ kartlarını ve IP adreslerini sade bir şekilde listeler
ip -br addr

echo "====================================="
