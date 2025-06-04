
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

### Raw Data(Another pipeline to generate for every 1 hour)
![Screenshot 2025-05-19 181635](https://github.com/user-attachments/assets/0ddbcffb-59ca-4386-84be-15c75c0eef7d)

### Airflow DAG Execution
![Screenshot 2025-05-19 175827](https://github.com/user-attachments/assets/96a055bb-5f99-4a55-8b78-d2b8c1fb38c6)




### Synapse Notebook Cleaning Logic
![Screenshot 2025-05-19 172304](https://github.com/user-attachments/assets/07bb7e3c-2f86-46dc-a3c1-b5f7a7928c13)





### Cleaned Data Files in ADLS Gen2
![Screenshot 2025-05-19 171332](https://github.com/user-attachments/assets/f967d9d3-3e6d-4733-a8e1-0680c2898f39)



### Single File Inside Cleaned Folder
![Screenshot 2025-05-19 112617](https://github.com/user-attachments/assets/8ea20fab-02e9-45eb-8da4-a0f872460dd9)





### Synapse Pipeline Execution History
![Screenshot 2025-05-19 180347](https://github.com/user-attachments/assets/71fb47c7-7d48-48c3-8126-fc590bda8516)

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
