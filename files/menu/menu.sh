#!/bin/bash

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
	echo "phantom V1 Menu Script"
	echo ""
	echo "[1] SSH Panel"
	echo "[2] Xray Panel"
	echo "[3] WireGuard Panel"
	echo "[4] Speedtest"
	echo "[5] Benchmark"
	echo "[6] Web directory login"
	echo "[7] Check VPN Status"
	echo "[8] Update scripts"
	echo "[9] Update packages"
	echo ""
	echo "[x] Exit"
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
		x)
			clear
			break
			;;
	esac
done
