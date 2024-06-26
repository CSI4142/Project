# CSI4142 - Project - Bank Customer Churn Analysis

The Bank Customer Churn project aims to carry out an extensive exploration of the customer churn data of a multinational bank, using various data science techniques and analytical tools.

The steps involved will range from developing a dimensional model to better display the data characteristics and analysis process, to building data marts and performing the ETL process. Online Analytical Processing (OLAP) will also be used to perform multi-dimensional data analysis, followed by the development of Business Intelligence (BI) dashboards for data visualization and trend identification.

Finally, we will use data mining techniques to discover hidden patterns, classify data, and develop a machine learning (ML) model to predict customer churn.

- [CSI4142 - Project - Bank Customer Churn Analysis](#csi4142---project---bank-customer-churn-analysis)
  - [Goal](#goal)
  - [Phase 2: Data Loading and Staging](#phase-2-data-loading-and-staging)
  - [Phase 3: OLAP Queries and BI Dashboards](#phase-3-olap-queries-and-bi-dashboards)
  - [Phase 4: Data Mining and Machine Learning](#phase-4-data-mining-and-machine-learning)
  - [References](#references)
  - [Project Team](#project-team)

## Goal

The results of this project could help enhance customer retention strategies, optimize business profitability, and improve overall customer satisfaction by identifying key factors leading to churn in the banking industry.

## Phase 2: Data Loading and Staging

This project currently uses a **cloud-hosted PostgreSQL database**. The data has been loaded and staged into this database following the requirements of **Phase 2**. The connection details required to connect to and query the cloud-hosted database, will be submitted in the project report.

You could also use a local PostgreSQL database instead. For local PostgreSQL server, you can modify the connection details in the [.env.db](./.env.db) file. If you need to load data (i.e., process source CSV file and create dimension files) and stage the data into the database, you can follow the instructions in the [phase2/README.md](./phase2/README.md).

## Phase 3: OLAP Queries and BI Dashboards

The OLAP queries and BI dashboards have been developed in **Phase 3**.

Files related to Phase 3 are organized in directories under the `phase3` folder as mentioned below:

- `phase3/part1` - Contains SQL queries for Part 1: Standard OLAP operations.
- `phase3/part2` - Contains SQL queries for Part 2: Explorative operations.
- `phase3/part3` - Contains information and files related to Part B: BI dashboard and information visualization.

Details regarding BI dashboard can be found in the [phase3/part3/README.md](./phase3/part3/README.md) file. Dashboard can be accessed at [https://csi.pkural.ca/](https://csi.pkural.ca/) using the credentials provided in the project report or with the project submission.

## Phase 4: Data Mining and Machine Learning

The data mining and machine learning tasks have been performed in **Phase 4**.

Files related to Phase 4 are organized in directories under the `phase4` folder as mentioned below:

- `phase4/part_a` - Contains the data summarization and data transformation code.
- `phase4/part_b` - Contains the code for classification (supervised machine learning). It is futher organized into subdirectories as:
  - `models` - Contains notebooks for training the models for the three supervised learning algorithms: Decision Tree, Gradient Boosting, and Random Forest.
  - `model_results` - Contains the results of the models trained in the `models` directory.
    - `model_results/combined_results` - Contains the combined results of the models.
    - `model_results/notebooks` - Contains the notebook used to combine the results and to analyze the results.
- `phase4/part_c` - Contains the code for outlier detection.

## References

Bank Customer Churn Dataset - https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn/data

## Project Team

**Group 51**

- Dhara Patel (300146860)
- Oleksander Turchyn (300174825)
- Pranav Kural (300241227)
