# percona-mongo-setup
This repository provides a complete guide to setting up MongoDB in Docker while running Percona Server for MongoDB directly on the host. It includes all necessary configuration files, Docker commands, and step-by-step instructions for hybrid database deployment.

                                                                                                                   Percona Server for MongoDB


Step 1: Handling Docker for MongoDB
Basic Commands:
- Start the container in detached mode
     - docker compose up -d
- List running containers
     - docker ps
- Access the container's bash terminal
     - docker exec -it <container_id> /bin/bash
- Check existing Docker volumes
     - docker volume ls
- Delete a specific Docker volume
     - docker volume rm <volume_name>
- Stop and remove the container stack
     - docker compose down
💡 Key Points:
Use the docker-compose.yml file to define services, volumes, and networks for MongoDB.
Ensure that persistent storage is set up with named volumes to avoid data loss.

Step 2: Installing Percona through Provided Script
Download the Percona installation script

Ensure the script is provided or hosted on a trusted source.
Make the script executable

chmod +x <script_name>.sh
Run the installation script

./<script_name>.sh
Verify Percona installation

percona-server --version
💡 Key Points:

Check the compatibility of Percona with the system and MongoDB version.
Follow the script instructions for configuring Percona settings.
Secure Percona with appropriate user roles and credentials.
