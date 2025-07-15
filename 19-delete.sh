 #!/bin/bash

# Specify the directory containing log files
LOG_DIR="/path/to/logs"

# Delete all .log files in the directory
rm -f $LOG_DIR/*.log

echo "All log files in $LOG_DIR have been deleted."


# Specify the directory and retention period
LOG_DIR='/path/to/logs'
RETENTION_DAYS=7

# Find and delete log files older than X days
find $LOG_DIR -type f -name "*.log" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "Log files older than $RETENTION_DAYS days have been deleted from $LOG_DIR."
