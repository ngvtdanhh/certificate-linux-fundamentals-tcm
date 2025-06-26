# 📂 File Permissions in Linux – TCM Security Linux 100

In Linux, **file permissions** are a foundational concept for system security and user management. This note summarizes key topics from the *Linux 100: Fundamentals* course by TCM Security, with real-world examples and extra insights to go beyond the basics.

---

## 🔐 Permission Model Overview

Every file/directory has three types of permissions for **three classes** of users:

| User Class | Description |
|------------|-------------|
| `u` – user | The **owner** of the file |
| `g` – group | Users in the file's group |
| `o` – others | All other users |

Each class can be assigned three permissions:

| Symbol | Meaning     | Description |
|--------|-------------|-------------|
| `r`    | read        | View file contents or list directory |
| `w`    | write       | Modify contents or create/delete files in a directory |
| `x`    | execute     | Run a file (scripts/binaries) or enter a directory |

---

## 📊 Permission Notations

### 1. **Symbolic notation** (default `ls -l` output)

```bash
-rwxr-xr--  1 root  users  1024 Jan 1 20:24 example.sh
```

Position:
rwx
rwx	
r-x
r--

Meaning:
Type: - = file, d = directory
Owner permissions
Group permissions
Others permissions

## 2. Octal notation (used with chmod)

| Symbol | Binary | Octal |
| ------ | ------ | ----- |
| `r`    | 4      |       |
| `w`    | 2      |       |
| `x`    | 1      |       |

Example:

```bash
chmod 754 script.sh
# => rwx (7) for user, r-x (5) for group, r-- (4) for others
```

## 🛠 Common Permission Commands

| Command | Purpose                   |
| ------- | ------------------------- |
| `ls -l` | Show detailed permissions |
| `chmod` | Change file permissions   |
| `chown` | Change file owner/group   |
| `chgrp` | Change group ownership    |

Examples:

```bash
chmod 755 myscript.sh         # Owner: rwx, Group: r-x, Others: r-x
chown danh:danh myfile.txt    # Change owner and group to danh
chmod -R 700 secret_dir       # Apply recursively to all contents
```

## 🧪 Real-world Use Cases

Hardened script execution

Allow only owner to run the script:
```bash
chmod 700 backup.sh
```

Public read-only downloads:
```bash
chmod 644 public.pdf
```

Private key protection:
```bash
chmod 600 id_rsa
```

## 🧨 Advanced: Special Permission Bits

| Bit    | Name         | Symbol        | Use Case                                       |
| ------ | ------------ | ------------- | ---------------------------------------------- |
| SUID   | Set User ID  | `s` in user   | Executes with file owner's privileges          |
| SGID   | Set Group ID | `s` in group  | Inherit group on files created                 |
| Sticky | Sticky Bit   | `t` in others | Only owner/root can delete file (e.g., `/tmp`) |

Examples:

```bash
chmod u+s /usr/bin/passwd     # Enables SUID
chmod g+s /var/projects       # Enables SGID
chmod +t /tmp                 # Enables Sticky Bit
```

## 🛡️ Security Tips (From TCM + Extra)

- Avoid giving 777 permissions — major security risk

- Use umask to set default permissions for new files

- Limit write access on shared folders to avoid tampering

- Combine chattr +i with chmod to lock critical configs

- Audit file permissions with: find / -perm -o+w (world writable files)

## 📚 Further Learning

- man chmod, man chown, man umask

- TCM Security Linux 100 – Video: "Understanding chmod & file access"

- Explained: chmod Calculator - https://chmod-calculator.com/

