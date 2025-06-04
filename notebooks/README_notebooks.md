# 📓 Synapse Notebooks

This folder contains two key notebooks used in the Azure data pipeline project. Each notebook contributes to automating and managing data movement and transformation in a cloud-based architecture.

---

## 1️⃣ clean_data_job.ipynb

This notebook handles **schema evolution**, **data cleaning**, and **output formatting** for incoming sales data.

### 🔹 Key Steps:
- Reads all CSV files from the `raw-data` container
- Aligns them with a defined schema using PySpark
- Adds missing columns, handles nulls, drops duplicates
- Writes cleaned data into `clean-data` container in timestamped folders

### 🔧 Columns enforced:
```python
["OrderID", "OrderDate", "CustomerName", "Region", "Product", "Category", "Quantity", "UnitPrice", "Amount"]
```

---

## 2️⃣ generate_raw_sales_notebook.ipynb

This notebook **generates synthetic sales data** for testing and demonstration purposes.

### 🔹 Key Steps:
- Randomly generates ~150 rows of sample sales data
- Fills fields with realistic values including nulls (to test cleaning)
- Writes each generated file into the `raw-data` container

### 🔧 Sample Output Fields:
```python
["OrderID", "OrderDate", "CustomerName", "Region", "Product", "Category", "Quantity", "UnitPrice", "Amount"]
```

---

## 📁 Output Paths
- Raw sales data → `abfss://raw-data@datapipelineprojectsa123.dfs.core.windows.net/`
- Cleaned data → `abfss://clean-data@datapipelineprojectsa123.dfs.core.windows.net/{timestamp}/`

---

## 🧠 Notes
- These notebooks are triggered indirectly by Airflow using REST calls to Synapse pipelines.
- Use them to simulate batch ingestion, test schema variation, and validate Spark output formatting.

---

📌 Both notebooks are production-ready for integration with Airflow and Synapse pipelines.