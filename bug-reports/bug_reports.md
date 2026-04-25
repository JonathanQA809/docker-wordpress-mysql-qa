# Bug Reports

## BUG-001: Docker command fails when run on local Windows Command Prompt

**Severity:** Medium  
**Priority:** Medium  

**Environment:**  
Windows Command Prompt, DigitalOcean server, Docker

**Description:**  
The `docker` command failed locally because Docker was not available in the Windows Command Prompt environment.

**Steps to Reproduce:**
1. Open Windows Command Prompt.
2. Run `docker run jenkins`.

**Expected Result:**  
Docker command should run if Docker is installed and available in the current environment.

**Actual Result:**  
Command Prompt returned:  
`'docker' is not recognized as an internal or external command`

**Root Cause:**  
Docker was not available locally. Docker commands needed to be run on the cloud server after connecting through SSH.

**Resolution:**  
Connected to the DigitalOcean server using SSH and ran Docker commands there.

---

## BUG-002: SSH connection fails when incorrect private key path is used

**Severity:** Medium  
**Priority:** High  

**Environment:**  
Windows Command Prompt, SSH, DigitalOcean droplet

**Description:**  
SSH failed because the command pointed to a private key path that did not exist.

**Steps to Reproduce:**
1. Open Command Prompt.
2. Run SSH command using an incorrect key path.
3. Attempt to connect to the droplet.

**Expected Result:**  
User should connect to the server when the correct private key is provided.

**Actual Result:**  
SSH returned:  
`Warning: Identity file not accessible: No such file or directory`  
`Permission denied (publickey)`

**Root Cause:**  
The private key was saved in `C:\Users\jonat\digital_ocean`, but the SSH command used a different path.

**Resolution:**  
Used the correct SSH command with the full private key path.

---

## BUG-003: WordPress container stops when run in foreground

**Severity:** Low  
**Priority:** Medium  

**Environment:**  
Docker, WordPress 6.6, Linux server

**Description:**  
The WordPress container stopped after being run in foreground mode and interrupted.

**Steps to Reproduce:**
1. SSH into the server.
2. Run `docker run wordpress:6.6`.
3. Press `Ctrl + C`.
4. Run `docker ps -a`.

**Expected Result:**  
WordPress should keep running if intended to stay available.

**Actual Result:**  
Container stopped and logs showed:  
`caught SIGWINCH, shutting down gracefully`

**Root Cause:**  
The container was started in foreground mode instead of detached mode.

**Resolution:**  
Started WordPress using detached mode:  
`docker run -d --name wordpress -p 8081:80 wordpress:6.6`

---

## BUG-004: WordPress page fails to load when using 0.0.0.0 as browser URL

**Severity:** Medium  
**Priority:** Medium  

**Environment:**  
Chrome, Docker, DigitalOcean droplet, WordPress

**Description:**  
The WordPress page failed to load when `0.0.0.0` was used in the browser.

**Steps to Reproduce:**
1. Start the WordPress container with a published port.
2. Open browser.
3. Navigate to `http://0.0.0.0:<port>`.

**Expected Result:**  
User should access WordPress using a valid server IP and exposed port.

**Actual Result:**  
Browser could not reach the page.

**Root Cause:**  
`0.0.0.0` is a bind address, not a browser-accessible hostname.

**Resolution:**  
Used the DigitalOcean public IP address with the mapped port.

---

## BUG-005: Docker command fails inside WordPress container

**Severity:** Low  
**Priority:** Medium  

**Environment:**  
Docker, WordPress container, Linux server

**Description:**  
The `docker ps` command failed when executed inside the WordPress container.

**Steps to Reproduce:**
1. Enter the WordPress container using `docker exec -it wordpress bash`.
2. Run `docker ps`.

**Expected Result:**  
Docker commands should be run from the host server.

**Actual Result:**  
The container returned:  
`bash: docker: command not found`

**Root Cause:**  
Docker is installed on the host server, not inside the WordPress container.

**Resolution:**  
Exited the container using `exit`, returned to the host server, and ran Docker commands from there.

---

## BUG-006: MySQL Workbench connection fails when using 0.0.0.0 as hostname

**Severity:** Medium  
**Priority:** High  

**Environment:**  
MySQL Workbench, Docker, MySQL container, DigitalOcean droplet

**Description:**  
MySQL Workbench failed to connect when `0.0.0.0` was used as the hostname.

**Steps to Reproduce:**
1. Open MySQL Workbench.
2. Create a new connection.
3. Enter `0.0.0.0` as the hostname.
4. Enter the mapped MySQL port.
5. Click **Test Connection**.

**Expected Result:**  
Workbench should connect using the server's reachable public IP address.

**Actual Result:**  
Workbench failed to connect.

**Root Cause:**  
`0.0.0.0` is not a valid remote hostname for client connections.

**Resolution:**  
Used the DigitalOcean public IP address as the hostname.

---

## BUG-007: Database does not appear after writing CREATE DATABASE command

**Severity:** Low  
**Priority:** Medium  

**Environment:**  
MySQL Workbench, MySQL container

**Description:**  
The `foobar` database did not appear immediately after typing the SQL command.

**Steps to Reproduce:**
1. Open MySQL Workbench.
2. Type `CREATE DATABASE foobar;`.
3. Check the Schemas panel without executing the query.

**Expected Result:**  
Database should be created after the SQL command is executed.

**Actual Result:**  
Database did not appear in the Schemas panel.

**Root Cause:**  
The query was typed but not executed.

**Resolution:**  
Executed the query using the lightning button or `Ctrl + Enter`, then refreshed the Schemas panel.
