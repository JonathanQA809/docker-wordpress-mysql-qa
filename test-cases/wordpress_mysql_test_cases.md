# WordPress + MySQL Docker QA Test Cases

## TC-001: Verify SSH connection to the cloud server

**Precondition:**  
The DigitalOcean droplet is running.

**Steps:**
1. Open Command Prompt.
2. Run the SSH command with the private key.
3. Verify the terminal connects to the server.

**Expected Result:**  
User should successfully connect to the server and see the server prompt.

---

## TC-002: Verify Docker is installed on the server

**Steps:**
1. SSH into the server.
2. Run `docker --version`.

**Expected Result:**  
Docker version should be displayed.

---

## TC-003: Verify running Docker containers

**Steps:**
1. Run `docker ps`.
2. Check the list of running containers.

**Expected Result:**  
Running containers should be displayed with container ID, image, status, ports, and name.

---

## TC-004: Verify WordPress container starts in detached mode

**Steps:**
1. Run `docker run -d --name wordpress -p 8081:80 wordpress:6.6`.
2. Run `docker ps`.
3. Check the WordPress container status.

**Expected Result:**  
WordPress container should be listed with status `Up`.

---

## TC-005: Verify WordPress is accessible in the browser

**Steps:**
1. Open Chrome.
2. Go to `http://<server-ip>:8081`.

**Expected Result:**  
WordPress setup page should load successfully.

---

## TC-006: Verify `0.0.0.0` cannot be used as browser hostname

**Steps:**
1. Open browser.
2. Go to `http://0.0.0.0:8081`.

**Expected Result:**  
Page should not load because `0.0.0.0` is not a valid browser-accessible hostname.

---

## TC-007: Verify MySQL container is running

**Steps:**
1. Run `docker ps`.
2. Locate the MySQL container.
3. Verify the mapped port.

**Expected Result:**  
MySQL container should be running and show a host port mapped to container port `3306`.

---

## TC-008: Verify MySQL Workbench connection

**Steps:**
1. Open MySQL Workbench.
2. Enter the server public IP as hostname.
3. Enter the mapped MySQL port.
4. Enter username and password.
5. Click **Test Connection**.

**Expected Result:**  
MySQL Workbench should connect successfully.

---

## TC-009: Verify database creation

**Steps:**
1. Open a SQL editor in MySQL Workbench.
2. Run `CREATE DATABASE foobar;`.
3. Refresh the Schemas panel.

**Expected Result:**  
The `foobar` database should appear in the Schemas panel.

---

## TC-010: Verify database list using SQL

**Steps:**
1. Run `SHOW DATABASES;`.
2. Check the query result.

**Expected Result:**  
The `foobar` database should be listed.

---

## TC-011: Verify Docker commands fail inside a container

**Steps:**
1. Run `docker exec -it wordpress bash`.
2. Run `docker ps` inside the container.

**Expected Result:**  
The command should fail because Docker is installed on the host server, not inside the WordPress container.

---

## TC-012: Verify stopped containers are visible

**Steps:**
1. Stop a test container.
2. Run `docker ps -a`.

**Expected Result:**  
Stopped containers should appear with an `Exited` status.

---

## TC-013: Verify container logs can be reviewed

**Steps:**
1. Run `docker logs <container_name>`.
2. Review the output.

**Expected Result:**  
Container logs should display startup details, errors, or warnings.

---

## TC-014: Verify WordPress container stops when run in foreground and interrupted

**Steps:**
1. Run WordPress without `-d`.
2. Press `Ctrl + C`.
3. Run `docker ps -a`.

**Expected Result:**  
The container should stop and show an exited status.

---

## TC-015: Verify correct container port mapping

**Steps:**
1. Run `docker ps`.
2. Review the `PORTS` column.
3. Confirm host port maps to the correct container port.

**Expected Result:**  
The host port should correctly map to the application port inside the container.