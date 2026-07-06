#!/bin/bash

echo "====================================="
echo "   SUNUCU SAĞLIK VE GÜVENLİK PANELİ  "
echo "====================================="

echo "[1] Mevcut Çalışan Kullanıcı:"
echo "Şu anki aktif yetki: $(whoami)"
echo "-------------------------------------"

echo "[2] Disk Alanı Durumu:"
df -h / | awk 'NR==2 {print "Toplam Alan: " $2 ", Kullanılan: " $3 ", Boş: " $4 " (Kullanım: " $5 ")"}'
echo "-------------------------------------"

echo "[3] Kritik Servislerin Durumu:"
# SSH ve UFW servislerinin durumunu kontrol ediyoruz
if systemctl is-active --quiet ssh; then
    echo "SSH Servisi: AKTİF (Çalışıyor)"
else
    echo "SSH Servisi: KAPALI"
fi

if ufw status | grep -q "active"; then
    echo "UFW Güvenlik Duvarı: AKTİF (Güvenli)"
else
    echo "UFW Güvenlik Duvarı: PASİF (Dikkat!)"
fi
echo "====================================="
