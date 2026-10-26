
#!/bin/bash

# Daily Linux Disk Monitoring Script

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
REPORT_DIR="$HOME/disk-monitor-reports"
REPORT_FILE="$REPORT_DIR/disk_report_${TIMESTAMP}.txt"
THRESHOLD=80

# Create report directory if it doesn't exist
mkdir -p "$REPORT_DIR"

echo "===== DAILY DISK MONITORING REPORT =====" | tee "$REPORT_FILE"
echo "Date: $(date)" | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

echo "----- DISK USAGE -----" | tee -a "$REPORT_FILE"
df -h | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

echo "----- DISK USAGE WARNINGS -----" | tee -a "$REPORT_FILE"

df -P | awk -v threshold="$THRESHOLD" '
NR > 1 {
    usage = $5
    gsub(/%/, "", usage)

    if (usage + 0 > threshold) {
        printf "WARNING: %s is %s full (mounted on %s)\n", $1, $5, $6
        found = 1
    }
}
END {
    if (!found) {
        print "OK: No filesystem is above the threshold."
    }
}' | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"
echo "Report saved to: $REPORT_FILE"

