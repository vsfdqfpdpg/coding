### Source  
* [iptables](https://github.com/suin/iptables)
* [iptables modles](http://www.toutiao.com/a6401233655499866370/)
* [Using iptables to Implement URL Filter](http://ohohsblog.blogspot.com/2011/01/url-filter-by-iptables.html)

![rules](http://img.mukewang.com/58f730db000102c012800720.jpg)

### List line numbers
```bash
iptables -L INPUT --line-numbers
iptables -L FORWARD --line-numbers
```
### Delete
```bash
iptables -D chain rulenum [options]
iptables -D FORWARD 1
```
### iptables modles help
```bash
iptables -m string -help
iptables -m time -help
iptables -m webstr -help
iptables -m limit -help
iptables -m connlimit -help
iptables -m state -help
iptables -m mac -help
iptables -m weburl -help
```
### Accept
```bash
iptables -I INPUT -p tcp --dport 80 -j ACCEPT       # Accept traffic from port 80 in INPUT Chain
iptables -I INPUT -p tcp --dport 10:21:22 -j ACCEPT # Allow multiple ports at once
iptables -I INPUT -p tcp --dport 1723 -j ACCEPT     # VPN port 1723
iptables -I INPUT -p icmp -j ACCEPT                 # Allow ping from outside
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT # Allow localhost browse outside web
iptables -I INPUT -i lo -j ACCEPT                   # -i adaptor
iptables -I INPUT -p tcp -s 10.10.188.233 --dport 80 -j ACCEPT # -s 10.10.188.233 allow this ip
iptables -A INPUT -s 192.168.1.1/24 -j ACCEPT       # Allow specific range ips
```
### Reject
```bash
iptables -I FORWARD -p udp --dport 53 -m string --string "iqiyi.com" --algo bm -m time --timestart 9:00 --timestop 12:00  -j DROP
iptables -I FORWARD -p udp --dport 53 -m string --string "iqiyi.com" --algo bm -m time --timestart 13:30 --timestop 18:00  -j DROP
iptables -t nat -I INPUT --sport 443 -m string --string www.facebook.com --algo bm -j REJECT
iptables -I FORWARD  -m string --string "facebook.com" --algo bm --from 1 --to 600 -j REJECT
iptables -A INPUT -j REJECT                         # Reject all traffic
```
### Delete
iptables -D INPUT -p tcp --dport 80 -j ACCEPT       # Delete a iptables rules


