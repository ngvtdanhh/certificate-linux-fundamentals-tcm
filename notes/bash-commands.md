# 🖥️ Bash Commands – Linux 100: Fundamentals (TCM Security)

This note summarizes essential Bash commands covered in the *Linux 100* course by TCM Security. It also includes extra tips and real-world use cases for penetration testers and sysadmins.

---

## 📂 1. File & Directory Navigation

| Command          | Description                       |
|------------------|-----------------------------------|
| `pwd`            | Print working directory           |
| `ls -la`         | List all files with details       |
| `cd /path`       | Change current directory          |
| `mkdir test`     | Create a directory                |
| `touch file.txt` | Create empty file                 |
| `rm file.txt`    | Delete a file                     |
| `rm -rf dir/`    | Recursively remove directory ⚠️   |
| `cp a.txt b.txt` | Copy file                         |
| `mv old.txt new.txt` | Rename or move file           |

---

## 📄 2. Viewing & Editing Files

| Command                  | Description                         |
|--------------------------|-------------------------------------|
| `cat file.txt`           | Print file content                  |
| `less file.txt`          | Scrollable viewer (q to quit)       |
| `head -n 10 file.txt`    | View first 10 lines                 |
| `tail -n 20 file.txt`    | View last 20 lines                  |
| `nano file.txt`          | Terminal-based editor               |
| `vim file.txt`           | Advanced text editor                |

> ⚡ `nano` is beginner-friendly. `vim` is powerful but has a learning curve.

---

## 🔍 3. Searching & Filtering

| Command                          | Description                         |
|----------------------------------|-------------------------------------|
| `grep "root" /etc/passwd`        | Search for text in file             |
| `grep -r "flag" /home`           | Recursive search in directories     |
| `find / -name "*.conf"`          | Find files by name                  |
| `find . -type f -size +10M`      | Find files over 10MB in current dir |
| `wc -l file.txt`                 | Count lines in a file               |

---

## 🧪 4. Working with Processes

| Command        | Description                        |
|----------------|------------------------------------|
| `ps aux`       | List running processes             |
| `top` / `htop` | Real-time process viewer           |
| `kill <PID>`   | Terminate process by PID           |
| `killall firefox` | Kill all firefox instances      |

---

## 🌐 5. Networking Commands (Bash-level)

| Command             | Description                      |
|---------------------|----------------------------------|
| `ping 1.1.1.1`       | Check connectivity               |
| `ip a`               | Show IP configuration            |
| `ss -tuln`           | View open ports                  |
| `curl ifconfig.me`   | Get public IP                    |
| `netstat -antp`      | Show active connections (older)  |

---

## 🧑‍💻 6. Bash Scripting Basics

```bash
#!/bin/bash
echo "Welcome to Linux"
whoami
date
```

Save as welcome.sh, then:

```bash
chmod +x welcome.sh
./welcome.sh
```

## 🔄 7. System Updates & Package Management (Debian-based)
```bash
sudo apt update
sudo apt upgrade -y
sudo apt install nmap
```

## 🛠 8. File Permissions (Reminder)

```bash
chmod 755 script.sh      # Owner rwx, group r-x, others r-x
chmod +x file.sh         # Add execute permission
```

## 🧠 Pro Tips (from TCM & Practice)

- Use !! to repeat last command: sudo !!

- Use history to see previous commands

- Combine commands: ls -l | grep ".sh"

- Run as root: sudo -i

- Redirect output: echo test > file.txt (overwrite), >> (append)

## 🧩 Try This Yourself

```bash
#!/bin/bash
# Create a folder, add file, set permission

mkdir secure_logs
touch secure_logs/system.log
chmod 600 secure_logs/system.log
echo "Created secure_logs/system.log with owner-only read/write"
```

## 📚 References

- Linux 100: Fundamentals – TCM Security (Video modules 3–5)

- man bash, man grep, man find, man chmod



