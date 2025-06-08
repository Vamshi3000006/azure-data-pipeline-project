# 📂 metadata/

This folder contains runtime metadata used by Airflow to track the pipeline’s progress.

---

## 📝 processed_files.json

Tracks all CSV files from the `raw-data` container that have already been ingested and processed.

### 🔧 Used In:
- Airflow DAG: `check_blob_container` task
- Prevents reprocessing of the same files

---

## ✅ Purpose

- Ensures idempotent runs in batch processing
- Enables simple state handling without using databases
- Easy to reset for local testing by clearing the file

---

## 🔁 Manual Reset (for testing)

```bash
echo "[]" > metadata/processed_files.json
