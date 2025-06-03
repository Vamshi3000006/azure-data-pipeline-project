
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
![Screenshot 2025-05-19 181635](https://github.com/user-attachments/assets/e8c0cee9-2d9e-4f91-af95-2056c780488a)


### Airflow Logs for Triggering Synapse
![Screenshot 2025-05-19 180522](https://github.com/user-attachments/assets/fd6b2273-7ddf-4e22-8b1e-679e22bd420a)


### Synapse Notebook Cleaning Logic
![Screenshot 2025-05-19 171332](https://github.com/user-attachments/assets/1841f57b-ca7f-4d20-a684-d24d807bf06f)


### Output Path Writing in Notebook
![Screenshot 2025-05-19 172304](https://github.com/user-attachments/assets/07179716-fea2-4831-b34b-d81b98eebabb)

### Cleaned Data Files in ADLS Gen2
![Screenshot 2025-05-19 175827](https://github.com/user-attachments/assets/2c38b58e-a145-4aac-b55e-c13fe0d41466)


### Single File Inside Cleaned Folder
![Screenshot 2025-05-19 112617](https://github.com/user-attachments/assets/8ea20fab-02e9-45eb-8da4-a0f872460dd9)


### All Timestamped Folders in Clean Zone
![Screenshot 2025-05-19 135321](https://github.com/user-attachments/assets/112db16f-354c-487d-90b2-c5c8446de5f9)


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
