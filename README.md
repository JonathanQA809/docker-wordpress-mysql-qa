# Dockerized WordPress + MySQL QA Testing Project

## Project Summary

This project demonstrates QA testing of a Dockerized WordPress and MySQL application deployed on a Linux cloud server.

Testing focused on validating container setup, database connectivity, application accessibility, and identifying environment and configuration issues that impact system behavior.

The project includes:
- Test cases for Docker, WordPress, and MySQL
- Bug reports documenting real-world setup issues
- SQL scripts for database validation

## Project Overview

The goal of this project is to validate that a WordPress application and MySQL database can run in containers, communicate correctly, and remain accessible through exposed ports. Testing also covers common setup issues, connection errors, and environment-related failures.

## Project Purpose

This project was created to practice real-world QA skills beyond basic UI testing. It focuses on testing application environments, Docker containers, database connectivity, and system behavior.

This project shows the ability to:

* Deploy applications using Docker containers
* Validate running containers and exposed ports
* Connect to MySQL using MySQL Workbench
* Create and verify databases
* Troubleshoot SSH, Docker, and database connection issues
* Write test cases for environment setup and application behavior
* Document bugs with clear steps, expected results, and actual results

## Tech Stack

* Docker
* WordPress
* MySQL
* MySQL Workbench
* Linux server
* DigitalOcean Droplet
* SSH
* Command Prompt / Terminal
* Browser testing

## Environment

* Cloud Provider: DigitalOcean
* Server OS: Linux
* Application: WordPress 6.6
* Database: MySQL
* Local Tool: MySQL Workbench
* Browser: Chrome

## Testing Scope

Testing covered the following areas:

### Docker Container Testing

* Verified Docker containers start successfully
* Verified containers run in detached mode
* Checked running containers using `docker ps`
* Checked stopped containers using `docker ps -a`
* Validated port mappings between host and container
* Verified behavior when commands are run inside the wrong container context

### WordPress Testing

* Verified WordPress container starts successfully
* Verified WordPress is accessible in the browser
* Verified correct host IP and port are used
* Confirmed that `0.0.0.0` should not be used as a browser URL

### MySQL Testing

* Verified MySQL container is running
* Connected to MySQL using MySQL Workbench
* Tested connection using the correct public IP and mapped port
* Created a test database named `foobar`
* Verified database creation using the Schemas panel and SQL queries

### SSH and Server Access Testing

* Verified SSH access to the cloud server
* Tested SSH key usage with the `-i` option
* Identified incorrect key path issues
* Confirmed successful server login before running Docker commands

## Key QA Skills Demonstrated

* Environment validation
* Manual testing
* Database testing
* Negative testing
* Root cause analysis
* Bug reporting
* Test case design
* Troubleshooting
* Docker basics for QA
* Cloud server testing

## Example Docker Commands Used

```bash
docker ps
docker ps -a
docker run -d --name wordpress -p 8081:80 wordpress:6.6
docker exec -it wordpress bash
docker logs <container_name_or_id>
```

## Example SQL Commands Used

```sql
CREATE DATABASE foobar;
SHOW DATABASES;
```

## Sample Issues Found

### Issue 1: Docker command not recognized locally

Docker commands failed on the local Windows machine because Docker was not available in the Command Prompt environment. The correct workflow was to SSH into the cloud server and run Docker commands there.

### Issue 2: WordPress container stopped after running in foreground

The WordPress container shut down when the terminal process was interrupted. Running the container in detached mode with `-d` fixed the issue.

### Issue 3: MySQL Workbench failed using `0.0.0.0`

MySQL Workbench failed to connect when `0.0.0.0` was used as the hostname. The correct hostname was the cloud server public IP address.

### Issue 4: Docker commands failed inside a container

Running `docker ps` inside the WordPress container failed because Docker was installed on the host server, not inside the container.

## Repository Structure

```text
docker-wordpress-mysql-qa/
|-- README.md
|-- bug-reports/
|   |-- bug_reports.md
|-- sql/
|   |-- database_checks.sql
|-- test-cases/
|   |-- wordpress_mysql_test_cases.md
|-- docker-wordpress-mysql-qa.code-workspace
```

## What I Learned

Through this project, I practiced setting up and testing a containerized application environment. I learned how Docker containers run, how port mappings work, how to connect external tools like MySQL Workbench to a containerized database, and how to troubleshoot common environment issues.

This project helped me better understand how QA engineers test not only the application UI, but also the environment, database connections, server access, and configuration details that support the application.
