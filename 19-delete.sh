 #!/bin/bash

# Specify the directory containing log files
LOG_DIR="/path/to/logs"

# Delete all .log files in the directory
rm -f $LOG_DIR/*.log

echo "All log files in $LOG_DIR have been deleted."
