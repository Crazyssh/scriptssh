# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

clear
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
TIMES="10"
CHATIDNEW=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEYNEW=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
URL="https://api.telegram.org/bot$KEYNEW/sendMessage"
domain=`cat /etc/xray/domain`
CHATIDC=$(cat /etc/per/id)
KEYC=$(cat /etc/per/token)
URL2="https://api.telegram.org/bot$KEYC/sendMessage"
if [ ! -e /etc/xray/noobz/akun ]; then
mkdir -p /etc/xray/noobz/akun
fi
function create(){
clear

echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• SSH PANEL MENU •               ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
read -p "Username: " user
read -p "Password: " pass
until [[ $exp =~ ^[0-9]+$ ]]; do
read -p "Exp (0 for unlimited days):" exp
done
read -p "IP LIMIT " ip

if [ ! -e /etc/sf/limit/noobs/ip/ ]; then
  mkdir -p /etc/sf/limit/noobs/ip/
fi
echo "$ip" > /etc/sf/limit/noobs/ip/$user

noobzvpns --add-user $user $pass --expired-user $user $exp
expi=`date -d "$exp days" +"%Y-%m-%d"`
useradd -e `date -d "$exp days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$pass\n$pass\n"|passwd $user &> /dev/null
echo -e "### $user $expi $pass" >> /etc/xray/noob
clear
cat > /home/vps/public_html/noobzvpns-$user.txt <<-END
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : $domain
USERNAME : $user
PASSWORD : $pass
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

EO6vB6XZ6He/B5c7IuJDIqqP+kADG62ERx2UYB5MKqKHAiumNsgyj30cgQJPOvQkHskXTVtwAcLD6kuMZvLO/xnUFIUGh5YsjEqktT/c10h7AVs+7kO7+e+cus18oVeZEL06KUAV1lMZ/hxWVMY+IT/8EsgmBJluor9CGab8FPcvAkaj5vmWWEddL5w93gy2PQFZOX9o0M+eC18u1YYyqTd0pXebC4A+1FIGPfZxqjhaBjO5ghDDRtxCQyGh7+hcwjXkXxN4NfvxTHE5u1bqIZQe4N53J3cmGo+RpQLA6WaEq/M6MC5JKvy31mOnoztVA4F4N1Fu5UtBn1nnLfATLPgrVvrZsjaUsisnjcoFFQNpiaeWinm4NGkyDOZgFDFiDi9cTLBLReJthsgvjyNGA1IHjXpRB62MyD66RGCj07GBjQ6IRJTi5eX73Sv20qTG7KwUYfmyXpbttuhJ+Of6x26Mf9mYFPRVdoSBla2WXAe5/JEY952xggHi/0RMsplLm4PZ8EUPZjSkMCGVFEwuydYe5AbJg0+f20G0u4mAjNq0gg+ICFgR1FQ32K0BMQ/vLawhabyEXHpRjN3mRp2JW6fV5leVRQ==

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

EG63JKRsq9lJ9Zm3rJpzSvPMG45jBIgT5192ny0Fjgqs20azIqz8hXqrHcA1Dwb55cK90eRcxB+SQHDroQSb7k4hnbvmod75aNn6BWIZmSyXfYwFvPzjGiyZeO7osOgFoLJiBXx0QuG/OP0Xm/XIvdZHVGgjMULTP9n7wvG8nxoSVHqMHUFw+3D+AWxiJsX0nQvjAQdhrmO/JUS+/QnONFgBIA2JGEj1wRUxpcedL7WB6ImNwLz6AL6veO2OXEzywBTy3lQYYGP+Pj9xPFhAqhbqQ+KjL/gFom0xy9fjoQHCT8dkvmZkHtr11C1EO7/g9v8CcR9aQCwy95AoQ/3O1UtXi+ODiCBORId/wkVeaQP9TSI6iuhBdp5QyR+skXvdDM1xwlrAhYJRurGCAuyJcKceU4ObhoQSxgmy2TOW3s/OcbE2Fg4ousxAGuRELuldpMF5nReclthhdXAMSdHJS7xXsz3FxNj6YGhtjaO6c/UaU66lGV6leUkB71am/Wty7Fux8pDjfpWzjhu3IRFTzN/LFkAplZY6XcYcPqHVGRhA1/AGhHgHCEDtoQHld9JYTb5UFTkeSg/ZQOp1bTn1ItkK

◇━━━━━━━━━━━━━━━━━◇
 • PAINTECH TUNNELING • 
◇━━━━━━━━━━━━━━━━━◇
END
if [[ -e /etc/noobz ]]; then
TEXT="
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : <code>$domain</code>
USERNAME : <code>$user</code>
PASSWORD : <code>$pass</code>
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

<code>EO6vB6XZ6He/B5c7IuJDIqqP+kADG62ERx2UYB5MKqKHAiumNsgyj30cgQJPOvQkHskXTVtwAcLD6kuMZvLO/xnUFIUGh5YsjEqktT/c10h7AVs+7kO7+e+cus18oVeZEL06KUAV1lMZ/hxWVMY+IT/8EsgmBJluor9CGab8FPcvAkaj5vmWWEddL5w93gy2PQFZOX9o0M+eC18u1YYyqTd0pXebC4A+1FIGPfZxqjhaBjO5ghDDRtxCQyGh7+hcwjXkXxN4NfvxTHE5u1bqIZQe4N53J3cmGo+RpQLA6WaEq/M6MC5JKvy31mOnoztVA4F4N1Fu5UtBn1nnLfATLPgrVvrZsjaUsisnjcoFFQNpiaeWinm4NGkyDOZgFDFiDi9cTLBLReJthsgvjyNGA1IHjXpRB62MyD66RGCj07GBjQ6IRJTi5eX73Sv20qTG7KwUYfmyXpbttuhJ+Of6x26Mf9mYFPRVdoSBla2WXAe5/JEY952xggHi/0RMsplLm4PZ8EUPZjSkMCGVFEwuydYe5AbJg0+f20G0u4mAjNq0gg+ICFgR1FQ32K0BMQ/vLawhabyEXHpRjN3mRp2JW6fV5leVRQ==</code>

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

<code>EG63JKRsq9lJ9Zm3rJpzSvPMG45jBIgT5192ny0Fjgqs20azIqz8hXqrHcA1Dwb55cK90eRcxB+SQHDroQSb7k4hnbvmod75aNn6BWIZmSyXfYwFvPzjGiyZeO7osOgFoLJiBXx0QuG/OP0Xm/XIvdZHVGgjMULTP9n7wvG8nxoSVHqMHUFw+3D+AWxiJsX0nQvjAQdhrmO/JUS+/QnONFgBIA2JGEj1wRUxpcedL7WB6ImNwLz6AL6veO2OXEzywBTy3lQYYGP+Pj9xPFhAqhbqQ+KjL/gFom0xy9fjoQHCT8dkvmZkHtr11C1EO7/g9v8CcR9aQCwy95AoQ/3O1UtXi+ODiCBORId/wkVeaQP9TSI6iuhBdp5QyR+skXvdDM1xwlrAhYJRurGCAuyJcKceU4ObhoQSxgmy2TOW3s/OcbE2Fg4ousxAGuRELuldpMF5nReclthhdXAMSdHJS7xXsz3FxNj6YGhtjaO6c/UaU66lGV6leUkB71am/Wty7Fux8pDjfpWzjhu3IRFTzN/LFkAplZY6XcYcPqHVGRhA1/AGhHgHCEDtoQHld9JYTb5UFTkeSg/ZQOp1bTn1ItkK</code>

◇━━━━━━━━━━━━━━━━━◇
 • PAINTECH TUNNELING • 
◇━━━━━━━━━━━━━━━━━◇
"
else
TEXT="
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : <code>$domain</code>
USERNAME : <code>$user</code>
PASSWORD : <code>$pass</code>
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

<code>EO6vB6XZ6He/B5c7IuJDIqqP+kADG62ERx2UYB5MKqKHAiumNsgyj30cgQJPOvQkHskXTVtwAcLD6kuMZvLO/xnUFIUGh5YsjEqktT/c10h7AVs+7kO7+e+cus18oVeZEL06KUAV1lMZ/hxWVMY+IT/8EsgmBJluor9CGab8FPcvAkaj5vmWWEddL5w93gy2PQFZOX9o0M+eC18u1YYyqTd0pXebC4A+1FIGPfZxqjhaBjO5ghDDRtxCQyGh7+hcwjXkXxN4NfvxTHE5u1bqIZQe4N53J3cmGo+RpQLA6WaEq/M6MC5JKvy31mOnoztVA4F4N1Fu5UtBn1nnLfATLPgrVvrZsjaUsisnjcoFFQNpiaeWinm4NGkyDOZgFDFiDi9cTLBLReJthsgvjyNGA1IHjXpRB62MyD66RGCj07GBjQ6IRJTi5eX73Sv20qTG7KwUYfmyXpbttuhJ+Of6x26Mf9mYFPRVdoSBla2WXAe5/JEY952xggHi/0RMsplLm4PZ8EUPZjSkMCGVFEwuydYe5AbJg0+f20G0u4mAjNq0gg+ICFgR1FQ32K0BMQ/vLawhabyEXHpRjN3mRp2JW6fV5leVRQ==</code>

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

<code>EG63JKRsq9lJ9Zm3rJpzSvPMG45jBIgT5192ny0Fjgqs20azIqz8hXqrHcA1Dwb55cK90eRcxB+SQHDroQSb7k4hnbvmod75aNn6BWIZmSyXfYwFvPzjGiyZeO7osOgFoLJiBXx0QuG/OP0Xm/XIvdZHVGgjMULTP9n7wvG8nxoSVHqMHUFw+3D+AWxiJsX0nQvjAQdhrmO/JUS+/QnONFgBIA2JGEj1wRUxpcedL7WB6ImNwLz6AL6veO2OXEzywBTy3lQYYGP+Pj9xPFhAqhbqQ+KjL/gFom0xy9fjoQHCT8dkvmZkHtr11C1EO7/g9v8CcR9aQCwy95AoQ/3O1UtXi+ODiCBORId/wkVeaQP9TSI6iuhBdp5QyR+skXvdDM1xwlrAhYJRurGCAuyJcKceU4ObhoQSxgmy2TOW3s/OcbE2Fg4ousxAGuRELuldpMF5nReclthhdXAMSdHJS7xXsz3FxNj6YGhtjaO6c/UaU66lGV6leUkB71am/Wty7Fux8pDjfpWzjhu3IRFTzN/LFkAplZY6XcYcPqHVGRhA1/AGhHgHCEDtoQHld9JYTb5UFTkeSg/ZQOp1bTn1ItkK</code>

◇━━━━━━━━━━━━━━━━━◇
 • PAINTECH TUNNELING • 
◇━━━━━━━━━━━━━━━━━◇
"
fi
curl -s --max-time $TIMES -d "chat_id=$CHATIDC&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL2 >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
user2=$(echo "$user" | cut -c 1-3)
TIME2=$(date +'%Y-%m-%d %H:%M:%S')
TEXT2="
<code>◇━━━━━━━━━━━━━━◇</code>
<code>   TRANSAKSI SSH SUCCES </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN   :</code> <code>${domain} </code>
<code>ISP      :</code> <code>$ISP $CITY </code>
<code>DATE   :</code> <code>${TIME2} WIB </code>
<code>DETAIL   :</code> <code>Trx NOOBZVPN </code>
<code>USER :</code> <code>${user2}xxx </code>
<code>DURASI  :</code> <code>$exp Hari </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>AutoNotif Create Akun From Server..</i>"
curl -s --max-time $TIMES -d "chat_id=$CHATIDNEW&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL >/dev/null
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "NOOBZVPN ACCOUNT" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "DOMAIN : $( cat /etc/xray/domain )" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "USERNAME: $user" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "PASSWORD: $pass" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "IP LIMIT: $ip" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EXP DAYS: EXP DAYS : $expi ( $exp Days )" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "tcp_std port:  8080" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "tcp_ssl port: 8443" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "Example config TCP_STD 8080" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EO6vB6XZ6He/B5c7IuJDIqqP+kADG62ERx2UYB5MKqKHAiumNsgyj30cgQJPOvQkHskXTVtwAcLD6kuMZvLO/xnUFIUGh5YsjEqktT/c10h7AVs+7kO7+e+cus18oVeZEL06KUAV1lMZ/hxWVMY+IT/8EsgmBJluor9CGab8FPcvAkaj5vmWWEddL5w93gy2PQFZOX9o0M+eC18u1YYyqTd0pXebC4A+1FIGPfZxqjhaBjO5ghDDRtxCQyGh7+hcwjXkXxN4NfvxTHE5u1bqIZQe4N53J3cmGo+RpQLA6WaEq/M6MC5JKvy31mOnoztVA4F4N1Fu5UtBn1nnLfATLPgrVvrZsjaUsisnjcoFFQNpiaeWinm4NGkyDOZgFDFiDi9cTLBLReJthsgvjyNGA1IHjXpRB62MyD66RGCj07GBjQ6IRJTi5eX73Sv20qTG7KwUYfmyXpbttuhJ+Of6x26Mf9mYFPRVdoSBla2WXAe5/JEY952xggHi/0RMsplLm4PZ8EUPZjSkMCGVFEwuydYe5AbJg0+f20G0u4mAjNq0gg+ICFgR1FQ32K0BMQ/vLawhabyEXHpRjN3mRp2JW6fV5leVRQ==" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "Example config TCP_SSL 8443" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EG63JKRsq9lJ9Zm3rJpzSvPMG45jBIgT5192ny0Fjgqs20azIqz8hXqrHcA1Dwb55cK90eRcxB+SQHDroQSb7k4hnbvmod75aNn6BWIZmSyXfYwFvPzjGiyZeO7osOgFoLJiBXx0QuG/OP0Xm/XIvdZHVGgjMULTP9n7wvG8nxoSVHqMHUFw+3D+AWxiJsX0nQvjAQdhrmO/JUS+/QnONFgBIA2JGEj1wRUxpcedL7WB6ImNwLz6AL6veO2OXEzywBTy3lQYYGP+Pj9xPFhAqhbqQ+KjL/gFom0xy9fjoQHCT8dkvmZkHtr11C1EO7/g9v8CcR9aQCwy95AoQ/3O1UtXi+ODiCBORId/wkVeaQP9TSI6iuhBdp5QyR+skXvdDM1xwlrAhYJRurGCAuyJcKceU4ObhoQSxgmy2TOW3s/OcbE2Fg4ousxAGuRELuldpMF5nReclthhdXAMSdHJS7xXsz3FxNj6YGhtjaO6c/UaU66lGV6leUkB71am/Wty7Fux8pDjfpWzjhu3IRFTzN/LFkAplZY6XcYcPqHVGRhA1/AGhHgHCEDtoQHld9JYTb5UFTkeSg/ZQOp1bTn1ItkK" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e " • PAINTECH TUNNELING •" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
}


function delete(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• DELETE NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
grep -E "^### " "/etc/xray/noob" | cut -d ' ' -f 2-3 | nl -s ') '
read -p "Masukkan nama pengguna yang ingin dihapus: " user
noobzvpns --remove-user $user
exp=$(grep -E "^### $user " "/etc/xray/noob" | cut -d ' ' -f 3)
expi=$(date -d "$exp days" +"%Y-%m-%d")
sed -i "/^### $user $exp/d" /etc/xray/noob
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• DELETE NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -e "$WH USERNAME $user HAS BEEN DELETED $NC"
echo -e "$WH EXPIRED : $expi $NC"
echo -e ""
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<code>  DELETE NOOBZVPNS</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN   :</code> <code>${domain} </code>
<code>ISP      :</code> <code>$ISP $CITY </code>
<code>USERNAME :</code> <code>$user</code>
<code>EXPIRED  :</code> <code>$expi </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Delete This User...</i>
"
curl -s --max-time $TIMES -d "chat_id=$CHATIDNEW&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}


function renew(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• RENEW NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
read -p "expired?: " exp
noobzvpns --renew-user $user --expired-user $user $exp
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• RENEW NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "renew success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tunnel •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}




function lock(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• LOCK  NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
noobzvpns --block-user $user
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• LOCK  NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "locked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tunnel •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}






function show(){

clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• MEMBER  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
noobzvpns --info-all-user | awk '/^\s*\+.*-> active/ {gsub(/(issued\(yyyymmdd\)|hash_key): [0-9a-f]+/, ""); print; getline; print; getline; getline; getline; print; print "═══════════════════"}'

echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tunnel •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu

}



function unlock(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• UNLOCK  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
noobzvpns --unblock-user $user
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• UNLOCK  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "unlocked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tunnel •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}



function remove(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• REMOVE  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"

read -p "Apakah Anda ingin menghapus semua user? (Y/N): " choice

if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    # Eksekusi perintah di sini
    echo "MENGHAPUS SEMUA USER!"
noobzvpns --remove-all-user
elif [ "$choice" == "N" ] || [ "$choice" == "n" ]; then
    echo "Membatalkan penghapusan."
menu-noobzvpns
else
    echo "Pilihan tidak valid."
fi

clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• REMOVE  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "unlocked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tunnel •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}




clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}                 ${WH}• NOOBZ PANEL MENU •            ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}ADD AKUN${NC}      ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}DELETE USER${NC}   $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}SHOW AKUN${NC}     ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}LOCKED USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}RENEW AKUN${NC}    ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}UNLOCKED USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}       ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}REMOVE ALL USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════ • ${WH}BY${NC}${COLOR1} • ══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tunnel •                 $COLOR1 $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; create ;;
02 | 2) clear ; show ;;
03 | 3) clear ; renew ;;
04 | 4) clear ; delete ;;
05 | 5) clear ; lock ;;
06 | 6) clear ; unlock ;;
07 | 7) clear ; remove ;;
100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
