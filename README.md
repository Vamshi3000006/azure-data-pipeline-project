
# 🚀 Azure Data Engineering Pipeline Project

This project simulates a real-world data pipeline on Azure using Apache Airflow, Synapse Spark, Blob Storage, and Python. It ingests raw CSV sales data, handles schema evolution, cleans it with PySpark, and stores the final dataset in a clean container.

---

## 📌 Architecture

```
Raw Data (Blob Storage - raw-data/)
           ↓
Apache Airflow DAG (Runs hourly)
           ↓
Synapse Spark Notebook (clean_data_job)
           ↓
Cleaned CSV output (Blob Storage - clean-data/)
```

---

## 🧰 Tools Used

| Tool                | Purpose                            |
|---------------------|------------------------------------|
| **Apache Airflow**  | Workflow orchestration             |
| **Azure Synapse**   | PySpark-based data processing      |
| **Azure Blob**      | Raw + Clean storage containers     |
| **Python**          | Cleaning logic + REST triggering   |
| **Docker Compose**  | Local Airflow setup                |

---

## 📂 Folder Structure

```
azure-data-pipeline-project/
├── airflow/               # Airflow DAGs
├── metadata/              # Processed file tracker
├── notebooks/             # Synapse notebooks
├── scripts/               # Cleaning scripts
├── terraform/             # Infra provisioning (optional)
├── .env.example           # Safe env template
├── .gitignore             # Ignore rules
└── README.md              # This file
```

---

## ⚙️ DAG Execution Overview

- DAG runs every hour
- Checks for new files in `raw-data` container
- If found, it triggers Synapse pipeline
- Synapse job cleans & writes to `clean-data` container in timestamped folders

---

## 🧪 Schema Evolution Strategy

The Spark notebook dynamically:
- Matches `expected_columns` like `["id", "name", "sales", "timestamp"]`
- Adds missing columns with `null`
- Drops extra ones
- Performs `dropna()` and `dropDuplicates()`

---

## 📸 Screenshots

### Airflow DAG Execution
![Airflow DAG](screenshots/Screenshot 2025-05-19 181635.png)

### Airflow Logs for Triggering Synapse
![Airflow Logs](screenshots/Screenshot 2025-05-19 180522.png)

### Synapse Notebook Cleaning Logic
![Notebook 1](screenshots/Screenshot 2025-05-19 171332.png)

### Output Path Writing in Notebook
![Notebook Output](screenshots/Screenshot 2025-05-19 172304.png)

### Cleaned Data Files in ADLS Gen2
![Cleaned Folder](screenshots/Screenshot 2025-05-19 175827.png)

### Single File Inside Cleaned Folder
![Cleaned CSV](screenshots/Screenshot 2025-05-19 112617.png)

### All Timestamped Folders in Clean Zone
![All Outputs](screenshots/Screenshot 2025-05-19 135321.png)

### Synapse Pipeline Execution History
![Pipeline Runs](screenshots/Screenshot 2025-05-19 180347.png)

---

## 📁 Sample Output Format

```
id,name,sales,timestamp
101,Alice,1234.56,2025-05-01 14:00:00
102,Bob,782.90,2025-05-01 15:00:00
```

---

## 🧠 Learning Outcome

> I learned how to build and schedule a real pipeline on Azure, handle schema variations in files using PySpark, integrate Synapse with Airflow, and manage blob data in a structured lake-style format.

---

## 📝 Setup Instructions

```bash
git clone https://github.com/Vamshi3000006/azure-data-pipeline-project.git
cd azure-data-pipeline-project
cp .env.example .env  # Fill your secrets
docker-compose up     # Launch Airflow locally
```

---

## 🧾 License

MIT License — open to contributions.
