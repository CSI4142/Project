# Outlier Detection

For detecting outliers from our data we used the [Isolation Forest algorithm](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html#sklearn.ensemble.IsolationForest). The Isolation Forest algorithm is an unsupervised learning algorithm that is based on the Decision Tree algorithm. This algorithm is effective for high-dimensional datasets and works by isolating outliers instead of profiling normal data points as is the case with One-Class SVM algorithm. It is particularly efficient for datasets with a mix of numerical and categorical features, as is the case with the dataset we are working with.

## Steps followed to detect outliers

1. **Data Preprocessing**: We first preprocessed the data by removing the columns that were not required for the analysis. We also standardized the data using the StandardScaler method from the scikit-learn library. This was essential to ensure that all features are given equal importance during the analysis regardless of the scale of the values in source dataset. Data normalization was not performed as it may mask the outliers.
2. **Outlier Detection**: We then used the Isolation Forest algorithm to detect outliers from the preprocessed data. The algorithm was trained on the preprocessed data and the outliers were detected using the predict method of the Isolation Forest class. The outliers were then stored in a separate dataframe for further analysis.
3. **Evaluation**: We evaluated the performance and accuracy of the Isolated Forest algorithm in detecting outliers through visual and manual inspection of the detected outliers. A visual comparison was performed of the outliers data with the source data to examine the effectiveness of the algorithm in detecting outliers. Moreover, first few rows of the outliers data were manually inspected to ensure that the algorithm was able to detect the outliers effectively.
4. **Results**: The Isolation Forest algorithm was able to effectively detect outliers from the preprocessed data. Outliers were removed from the source data and a new CSV file was saved for use in the subsequent model training for churn prediction.

## Insights about the Data

Through the process of outlier detection, we were able to identify the following insights about the data:

1. **Data Distribution**: The data distribution of the source data was examined to identify any patterns or trends in the data. This analysis helped in understanding the characteristics of the data and in identifying any potential issues that may affect the model training process.
2. **Data Quality**: The quality of the data was assessed through the outlier detection process. The presence of outliers in the data can affect the performance of the machine learning model. By removing the outliers, we were able to improve the quality of the data and ensure that the model training process is not affected by the presence of outliers.
