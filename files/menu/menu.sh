#!/bin/bash
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
PB='\e[0;35m'
uptime=$(uptime -p | cut -d " " -f 2-10)
DATE=$(date -R | cut -d " " -f -4)
MYIP=$(curl -sS ipv4.icanhazip.com)
IPVPS=$(curl -s ipinfo.io/ip)
domain="$(cat /phantom/params | grep -w "installSubDomain" | awk -F"=" '{print $2}' | awk -F"\"" '{print $2}')"
ISP=$(curl -s "https://ipinfo.io/$IPVPS/org" | awk -F' ' '{print $2}')
ISP=$(echo $ISP | tr -d ',')
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"

ssh-panel() {
	while true; do
		unset choice
		n=7
		clear
		echo ""
		echo "SSH Panel"
		echo ""
		echo "[1] Add user"
		echo "[2] Delete user"
		echo "[3] Extend user"
		echo "[4] List user"
		echo "[5] User details"
		echo "[6] Dropbear monitor"
		echo "[7] OpenVPN monitor"
		echo ""
		echo "[x] Back"
		echo ""
		until [[ $choice -ge 1 ]] && [[ $choice -le $n ]] || [[ $choice == "x" ]]; do
			read -p "Choose option : " choice
			if [[ $choice -lt 1 ]] || [[ $choice -gt $n ]]; then
				[[ $choice != "x" ]] && echo "[ERROR] Invalid choice."
			fi
		done
		case $choice in
			1)
				clear
				(/phantom/menu/ssh/add.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			2)
				clear
				(/phantom/menu/ssh/delete.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			3)
				clear
				(/phantom/menu/ssh/extend.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			4)
				clear
				(/phantom/menu/ssh/list.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			5)
				clear
				(/phantom/menu/ssh/detail.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			6)
				clear
				(/phantom/menu/ssh/dropbear_monitor.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			7)
				clear
				(/phantom/menu/ssh/openvpn_monitor.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			x)
				break
				;;
		esac
	done
}

xray-panel() {
	while true; do
		unset choice
		n=18
		clear
		echo ""
		echo "Xray Panel"
		echo ""
		echo -e "\e[4mVless\e[24m"
		echo "[1]  Add user"
		echo "[2]  Delete user"
		echo "[3]  Extend user"
		echo "[4]  List user"
		echo "[5]  User details"
		echo "[6]  Login monitor"
		echo ""
		echo -e "\e[4mVmess\e[24m"
		echo "[7]  Add user"
		echo "[8]  Delete user"
		echo "[9]  Extend user"
		echo "[10] List user"
		echo "[11] User details"
		echo "[12] Login monitor"
		echo ""
		echo -e "\e[4mTrojan\e[24m"
		echo "[13] Add user"
		echo "[14] Delete user"
		echo "[15] Extend user"
		echo "[16] List user"
		echo "[17] User details"
		echo "[18] Login monitor"
		echo ""
		echo "[x] Back"
		echo ""
		until [[ $choice -ge 1 ]] && [[ $choice -le $n ]] || [[ $choice == "x" ]]; do
			read -p "Choose option : " choice
			if [[ $choice -lt 1 ]] || [[ $choice -gt $n ]]; then
				[[ $choice != "x" ]] && echo "[ERROR] Invalid choice."
			fi
		done
		case $choice in
			1)
				clear
				(/phantom/menu/xray/vless_add.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			2)
				clear
				(/phantom/menu/xray/vless_delete.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			3)
				clear
				(/phantom/menu/xray/vless_extend.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			4)
				clear
				(/phantom/menu/xray/vless_list.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			5)
				clear
				(/phantom/menu/xray/vless_detail.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			6)
				clear
				(/phantom/menu/xray/vless_monitor.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			7)
				clear
				(/phantom/menu/xray/vmess_add.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			8)
				clear
				(/phantom/menu/xray/vmess_delete.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			9)
				clear
				(/phantom/menu/xray/vmess_extend.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			10)
				clear
				(/phantom/menu/xray/vmess_list.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			11)
				clear
				(/phantom/menu/xray/vmess_detail.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			12)
				clear
				(/phantom/menu/xray/vmess_monitor.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			13)
				clear
				(/phantom/menu/xray/trojan_add.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			14)
				clear
				(/phantom/menu/xray/trojan_delete.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			15)
				clear
				(/phantom/menu/xray/trojan_extend.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			16)
				clear
				(/phantom/menu/xray/trojan_list.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			17)
				clear
				(/phantom/menu/xray/trojan_detail.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			18)
				clear
				(/phantom/menu/xray/trojan_monitor.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			x)
				break
				;;
		esac
	done
}

wireguard-panel() {
	while true; do
		unset choice
		n=5
		clear
		echo ""
		echo "WireGuard Panel"
		echo ""
		echo "[1] Add user"
		echo "[2] Delete user"
		echo "[3] Extend user"
		echo "[4] List user"
		echo "[5] User details"
		echo ""
		echo "[x] Back"
		echo ""
		until [[ $choice -ge 1 ]] && [[ $choice -le $n ]] || [[ $choice == "x" ]]; do
			read -p "Choose option : " choice
			if [[ $choice -lt 1 ]] || [[ $choice -gt $n ]]; then
				[[ $choice != "x" ]] && echo "[ERROR] Invalid choice."
			fi
		done
		case $choice in
			1)
				clear
				(/phantom/menu/wireguard/add.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			2)
				clear
				(/phantom/menu/wireguard/delete.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			3)
				clear
				(/phantom/menu/wireguard/extend.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			4)
				clear
				(/phantom/menu/wireguard/list.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			5)
				clear
				(/phantom/menu/wireguard/detail.sh)
				read -n 1 -r -s -p $"Press any key to continue ... "
				;;
			x)
				break
				;;
		esac
	done
}

while true; do
	unset choice
	n=9
	clear
	echo ""
echo -e "${GB}═══════════════════════════════════════════════════════${NC}"
echo -e "${GB}      ${WB}───[ Moded Script By JsPhantom @ 2023 ]───                  ${GB}${NC} "
echo -e "${GB}═══════════════════════════════════════════════════════${NC}"
echo -e " ${YB}Service Provider${NC}     ${WB}: $ISP"
echo -e " ${YB}Kernel	              ${WB}: ${WB}$(uname -r)${NC}"
echo -e " ${YB}Date${NC}                 ${WB}: $DATE${NC}"
echo -e " ${YB}System Uptime${NC}        ${WB}: $uptime${NC}"
echo -e " ${YB}Domain${NC}               ${WB}: ${PB}$domain${NC}"
echo -e " ${YB}IP Address           ${WB}: ${NC}$IPVPS${NC}"
echo -e " ${YB}Memory Usage         ${WB}: ${NC}${GB}$uram MB ${NC}/ ${RB}$tram ${WB}MB${NC}"
echo -e " ${YB}Bandwidth Data Usage ${WB}: ${GB}$ttoday Daily${NC}/${RB}$tmon ${WB}Monthly${NC}"    
echo -e "${GB}═══════════════════════════════════════════════════════${NC}"
echo -e "${GB}                  ${WB}───[ Main Menu ]───${NC}                  ${GB}${NC} "
echo -e "${GB}═══════════════════════════════════════════════════════${NC}"
echo -e "${GB} ${MB}[${NC}01${MB}]${NC} ${YB}SSH Panel${NC}    ${GB}${NC}"
echo -e "${GB} ${MB}[${NC}02${MB}]${NC} ${YB}Xray Panel${NC}    ${GB}${NC}"
echo -e "${GB} ${MB}[${NC}03${MB}]${NC} ${YB}WireGuard Panel${NC}${GB}${NC}"
echo -e "${GB} ${MB}[${NC}04${MB}]${NC} ${YB}Speedtest${NC}    ${GB}${NC}"
echo -e "${GB} ${MB}[${NC}05${MB}]${NC} ${YB}Benchmark${NC}    ${GB}${NC}"
echo -e "${GB} ${MB}[${NC}06${MB}]${NC} ${YB}Web directory login${NC}   ${GB}${NC}"
echo -e "${GB} ${MB}[${NC}07${MB}]${NC} ${YB}Check VPN Status${NC}${GB}${NC}"
echo -e "${GB} ${MB}[${NC}08${MB}]${NC} ${YB}Update scripts${NC}    ${GB}${NC}"
echo -e "${GB} ${MB}[${NC}09${MB}]${NC} ${YB}Update packages${NC}    ${GB}${NC}"
echo -e "${GB}═══════════════════════════════════════════════════════${NC}"
	echo ""
	until [[ $choice -ge 1 ]] && [[ $choice -le $n ]] || [[ $choice == "x" ]]; do
		read -p "Choose option : " choice
		if [[ $choice -lt 1 ]] || [[ $choice -gt $n ]]; then
			[[ $choice != "x" ]] && echo "[ERROR] Invalid choice."
      sleep 1
      menu
		fi
	done
	case $choice in
		1)
			clear
			ssh-panel
			;;
		2)
			clear
			xray-panel
			;;
		3)
			clear
			wireguard-panel
			;;
		4)
			clear
			speedtest
			echo ""
			read -n 1 -r -s -p $"Press any key to continue ... "
			;;
		5)
			clear
			echo ""
			curl -sL yabs.sh | bash -s -- -i
			echo ""
			rm -f geekbench_claim.url
			read -n 1 -r -s -p $"Press any key to continue ... "
			;;
		6)
			clear
			(/phantom/menu/other/web_login.sh)
			read -n 1 -r -s -p $"Press any key to continue ... "
			;;
		7)
			clear
			(/phantom/menu/other/check.sh)
			read -n 1 -r -s -p $"Press any key to continue ... "
			;;
		8)
			clear
			(/phantom/menu/other/update_script.sh)
			;;
		9)
			clear
			(/phantom/menu/other/update_package.sh)
			;;
	esac
done
