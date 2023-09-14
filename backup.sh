#!/bin/bash

# Set the current date for the backup filename (optional)
DATE=$(date +'%Y-%m-%d')

# Define the paths and filenames
CONTAINER_NAME="todo-app-postgres"
BACKUP_DIR="./db-backup"
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.sql"

# Access the PostgreSQL container and create a backup
/usr/local/bin/docker exec -i $CONTAINER_NAME pg_dumpall -U postgres > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully. File: $BACKUP_FILE"
else
  echo "Backup failed. Please check the error message."
fi
