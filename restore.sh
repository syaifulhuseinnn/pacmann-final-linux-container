#!/bin/bash

# Set the path to the PostgreSQL container (replace with your container name or ID)
CONTAINER_NAME="todo-app-postgres"

# Set the path to the SQL backup file on your host machine
BACKUP_FILE="./db-backup/backup_2023-09-09.sql"

# Set the name of the target database to restore to
TARGET_DATABASE="todo-app"

# Run psql command to restore the backup within the PostgreSQL container
docker exec -i $CONTAINER_NAME psql -U postgres -d $TARGET_DATABASE < $BACKUP_FILE

# Check if the restore was successful
if [ $? -eq 0 ]; then
  echo "Restore completed successfully to database $TARGET_DATABASE."
else
  echo "Restore failed. Please check the error message."
fi
