# Part A Summary

## Data Summarization

In this step, we will try to analyze the data and get the "feel" of the data. In order to do that we look at the data values, columns, and distribution. We also create plots of graphs to see if there are any obvious trends present in the data. This step is necessary for the next steps if we want to train a machine learning model to analyze the data and predict customer churn.

## Data Transformation

In the data transformation stage, we performed the following tasks:

- Handling missing values.
- Ordinal encoding of categorical attributes to prepare data for model training.
  - Used `LabelEncoder` from `sklearn.preprocessing` to encode categorical attributes.
- Normalization of numeric attributes to ensure all attributes are of equal importance during learning.
  - Used `MinMaxScaler` from `sklearn.preprocessing` to normalize numeric attributes.
- Feature selection to remove potentially redundant attributes and select the most prominent ones for predicting the target variable.
  - Used `SelectKBest` from `sklearn.feature_selection` to score features based on their importance.
  - Used `chi2` as the scoring function for feature selection.
  - Created dataset with top scoring features.

On completion of the data transformation stage, we obtained a dataframe with 8 features and 1 target variable. This dataframe was saved to a new CSV file `customer_churn_processed.csv` for use in the next part of Phase 4.
