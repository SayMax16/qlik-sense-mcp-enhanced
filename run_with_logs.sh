#!/bin/bash
# Run Qlik Sense MCP Server with visible logs for debugging

# Load environment variables
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Activate virtual environment
source venv/bin/activate

# Set log level for more verbose output
export LOG_LEVEL=DEBUG

echo "Starting Qlik Sense MCP Server with DEBUG logging..."
echo "Server URL: $QLIK_SERVER_URL"
echo "User: $QLIK_USER_DIRECTORY/$QLIK_USER_ID"
echo "Logs will appear below (stderr output):"
echo "=================================="

# Run the server - all logs go to stderr and will be visible
python -m qlik_sense_mcp_server.server