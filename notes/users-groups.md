# 👥 User and Group Management – Linux 100 (TCM Security)

User and group management is a core aspect of system administration and local privilege control. This note summarizes commands from the *Linux 100: Fundamentals* course by TCM Security and expands with practical tips for hardening systems and performing security assessments.

---

## 🧑 1. User Accounts in Linux

User information is stored in:

- `/etc/passwd` – contains usernames and UID info  
- `/etc/shadow` – contains **password hashes** (root-only access)

### 🔍 View user details:

```bash
cat /etc/passwd     # List all user accounts
getent passwd danh  # Show entry for user 'danh'
id danh             # Show UID, GID, and group membership
```

## 👤 2. Creating and Managing Users

| Command                      | Description                            |
| ---------------------------- | -------------------------------------- |
| `sudo adduser danh`          | Create a new user (with prompt)        |
| `sudo useradd -m danh`       | Create user manually (`-m` = home dir) |
| `sudo passwd danh`           | Set/change password                    |
| `sudo deluser danh`          | Delete user                            |
| `sudo usermod -aG sudo danh` | Add user to group (e.g., sudo)         |
| `sudo usermod -L danh`       | Lock account (disable login)           |

⚠️ Always use usermod -aG instead of usermod -G, to avoid overwriting existing groups.

## 👪 3. Group Management

| Command                         | Description                   |
| ------------------------------- | ----------------------------- |
| `groups danh`                   | List groups a user belongs to |
| `sudo groupadd hackers`         | Create new group              |
| `sudo usermod -aG hackers danh` | Add user to group             |
| `sudo gpasswd -d danh hackers`  | Remove user from group        |
| `sudo delgroup hackers`         | Delete a group                |

## 🔒 4. Privilege Escalation Context

Understanding /etc/sudoers and group membership is essential for detecting and preventing privilege escalation.

👑 Who can run sudo?

```bash
sudo cat /etc/sudoers
sudo grep '^%sudo' /etc/sudoers
```
Check if a user is in the sudo, wheel, or custom admin group:

```bash
groups danh
```

## 🛠 5. Real-World Use Cases

📦 Add a user for software deployment:

```bash
sudo adduser deployer
sudo usermod -aG docker deployer
```

🔐 Lock unused accounts:

```bash
sudo usermod -L student123
```
👮 Force password change on next login:

```bash
sudo chage -d 0 danh
```


## 🧪 6. Practice Script – User Audit

```bash
#!/bin/bash
echo "[+] Current users on system:"
cut -d: -f1 /etc/passwd | sort
echo "[+] Users with UID 0:"
awk -F: '$3 == 0 { print $1 }' /etc/passwd
```

## 🧠 Security Tips

- Disable root login via SSH (PermitRootLogin no)

- Use sudo instead of su for auditing

- Lock accounts of inactive users

- Monitor /etc/passwd, /etc/shadow, and /etc/sudoers for unauthorized changes

## 📚 References

- man useradd, man usermod, man passwd

- TCM Security – Linux 100 (Modules 4–6)

- Red Team Tip – LinEnum or Linux Priv Checker - https://github.com/rebootuser/LinEnum







