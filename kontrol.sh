#!/bin/bash

GREEN=""
YELLOW=""
NC=''

echo -e "${GREEN}=====================================${NC}"
echo -e "${GREEN}   SUNUCU SAĞLIK VE GÜVENLİK PANELİ  ${NC}"
echo -e "${GREEN}=====================================${NC}"

echo -e "${YELLOW}[1] Mevcut Çalışan Kullanıcı:${NC}"
echo "Şu anki aktif yetki: $(whoami)"
echo "-------------------------------------"

echo -e "${YELLOW}[2] Disk Alanı Durumu:${NC}"
df -h / | awk 'NR==2 {print "Toplam Alan: " $2 ", Kullanılan: " $3 ", Boş: " $4 " (Kullanım: " $5 ")"}'
echo "-------------------------------------"

echo -e "${YELLOW}[3] Kritik Servislerin Durumu:${NC}"
# SSH ve UFW servislerinin durumunu kontrol ediyoruz
if systemctl is-active --quiet ssh; then
    echo -e "SSH Servisi: ${GREEN}AKTİF (Çalışıyor)${NC}"
else
    echo -e "SSH Servisi: ${RED}KAPALI${NC}"
fi

if ufw status | grep -q "active"; then
    echo -e "UFW Güvenlik Duvarı: ${GREEN}AKTİF (Güvenli)${NC}"
else
    echo -e "UFW Güvenlik Duvarı: ${YELLOW}PASİF (Dikkat!)${NC}"
fi
echo -e "${GREEN}=====================================${NC}"
