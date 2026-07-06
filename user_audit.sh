#!/bin/bash

echo "====================================="
echo "   SUNUCU KULLANICI GÜVENLİK DENETİMİ  "
echo "====================================="

echo "[1] Sistemdeki Gerçek Kullanıcılar:"
grep -E '/bash|/sh' /etc/passwd | cut -d: -f1,7 | awk -F: '{print "Kullanıcı: " $1 " -> Kabuk: " $2}'

echo "-------------------------------------"
echo "[2] Sudo (Yönetici) Yetkisine Sahip Hesaplar:"
grep '^sudo:' /etc/group | cut -d: -f4

echo "====================================="
