# 🌐 Networking Essentials – Linux 100 (TCM Security)

Networking is a critical component of Linux system administration and penetration testing. This guide covers basic and practical networking commands from the *Linux 100: Fundamentals* course by TCM Security, extended with real-world usage and security insights.

---

## 🔍 1. Checking IP and Network Info

```bash
ip a                # Show all IP addresses (replace `ifconfig`)
hostname -I         # Show host IP(s)
ip route            # Show default routes
ip link show        # Show all interfaces and status
```

🔧 Example:

```bash
ip addr show eth0
```

## 🌍 2. DNS and Hostname

```bash
hostname            # Show hostname
hostnamectl         # Set or modify hostname
cat /etc/resolv.conf  # Show DNS servers
```

📌 Set new hostname:

```bash
sudo hostnamectl set-hostname new-host
```

## 📶 3. Checking Connectivity

```bash
ping -c 4 1.1.1.1            # Test connection to IP
ping google.com              # Test DNS resolution
traceroute google.com        # Show route to host
```

❗ Install traceroute via sudo apt install traceroute

## 🧭 4. Port Scanning & Services

```bash
ss -tuln                 # Show listening TCP/UDP ports
netstat -tulnp           # Show all open ports (older systems)
lsof -i                  # List open network files/sockets
nmap localhost           # Scan local open ports (if installed)
```

🔐 Use ss instead of netstat on newer systems

## 📡 5. Routing & Gateway

```bash
ip r                    # Short for `ip route`
ip route get 8.8.8.8    # Show how system would reach Google DNS
```

## 📤 6. Downloading & Curling
```bash
curl ifconfig.me              # Get public IP
curl -I http://example.com    # Fetch only headers
wget http://example.com/file  # Download file via HTTP
```

## 📜 7. Inspect DNS
```bash
dig google.com                # Lookup DNS record
nslookup google.com           # Alternative DNS query
```

## 🧪 8. Script – Network Quick Audit

```bash
#!/bin/bash

echo "[+] Hostname: $(hostname)"
echo "[+] IP Address: $(hostname -I)"
echo "[+] Default Gateway:"
ip route | grep default

echo "[+] Open Ports (ss):"
ss -tuln
```

## 🔒 Security Tips

-  Monitor open ports regularly with ss, lsof, or nmap

- Disable unnecessary services (e.g., FTP, Telnet)

- Use firewalls: ufw, iptables, firewalld

- Never expose SSH to 0.0.0.0 without rate-limiting or fail2ban

# 📚 References
- TCM Security – Linux 100 (Modules 7–9)

- man ip, man ss, man dig, man curl

- Linux Networking Commands Cheatsheet - https://www.linuxtrainingacademy.com/linux-networking-commands-cheat-sheet/





