# Linux Daily Disk Monitoring with Bash & Cron

## 📌 Project Overview

This project automates Linux disk usage monitoring using a Bash script. It checks filesystem utilization, displays warnings when disk usage exceeds a defined threshold of 80%, and generates timestamped reports for monitoring and troubleshooting.

The script runs on an Ubuntu EC2 instance and uses Cron to schedule automatic execution every day at 2:00 AM.

## 🎯 Objectives

- Monitor Linux filesystem disk usage.
- Identify filesystems exceeding the configured usage threshold.
- Generate timestamped disk monitoring reports.
- Automate daily execution using Cron.
- Practice Linux administration and Bash scripting.

## 🛠️ Technologies Used

- **Operating System:** Ubuntu Linux
- **Cloud Platform:** AWS EC2
- **Scripting:** Bash
- **Scheduling:** Cron
- **Linux Commands:** `df`, `awk`, `date`, `mkdir`, `tee`

## ⚙️ Features

- **Disk Usage Monitoring:** Collects filesystem usage information using `df -h`.
- **Threshold-Based Warnings:** Displays a warning when filesystem usage exceeds 80%.
- **Timestamped Reports:** Creates a separate report file for each script execution.
- **Automatic Report Storage:** Saves reports in `~/disk-monitor-reports/`.
- **Scheduled Execution:** Uses Cron to run the script daily at 2:00 AM.

## 📂 Project Structure

```text
Linux-Daily-Disk-Monitor/
├── disk_monitor.sh
└── README.md
```

Generated reports are stored separately in:

```text
~/disk-monitor-reports/
└── disk_report_YYYY-MM-DD_HH-MM-SS.txt
```

## 🚀 Setup and Usage

### 1. Clone the Repository

```bash
git clone https://github.com/devhassan65/Linux-Daily-Disk-Monitor.git
cd Linux-Daily-Disk-Monitor
```

### 2. Make the Script Executable

```bash
chmod +x disk_monitor.sh
```

### 3. Run the Script

```bash
./disk_monitor.sh
```

### 4. View Generated Reports

```bash
ls -l ~/disk-monitor-reports/
```

To read a report:

```bash
cat ~/disk-monitor-reports/disk_report_YYYY-MM-DD_HH-MM-SS.txt
```

Replace the example filename with the actual report filename.

## ⏰ Schedule the Script Using Cron

Open the current user's crontab:

```bash
crontab -e
```

Add the following entry:

```cron
0 2 * * * /home/ubuntu/disk_monitor.sh
```

Save the file, then verify the scheduled task:

```bash
crontab -l
```

This schedule runs the script every day at 2:00 AM according to the server's local time.

**Note:** Update the script path if you store it in a different directory. Cron uses the server's configured timezone.

## 📊 Sample Output

```text
===== DAILY DISK MONITORING REPORT =====
Date: Mon Oct 26 02:00:00 UTC 2026

----- DISK USAGE -----
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        20G   12G    8G  60% /

----- DISK USAGE WARNINGS -----
OK: No filesystem is above the threshold.
```

If a filesystem exceeds 80% utilization, the script displays a warning identifying the filesystem, usage percentage, and mount point.

*Sample values are illustrative; actual output depends on the server.*

## 📚 Key Learnings

- Writing and executing Bash scripts.
- Using Linux commands to inspect disk utilization.
- Applying conditional logic with `awk`.
- Generating timestamped reports.
- Automating repetitive administrative tasks with Cron.
- Practicing Linux monitoring and troubleshooting on AWS EC2.

## 🔮 Future Improvements

- Send email or notification alerts when disk usage exceeds the threshold.
- Add configurable thresholds for different filesystems.
- Implement log rotation and automatic report cleanup.
- Integrate monitoring with AWS CloudWatch.

## 👨‍💻 Author

**Hassan Zia**




*This project was developed as part of my hands-on DevOps practice and technical interview preparation.*
