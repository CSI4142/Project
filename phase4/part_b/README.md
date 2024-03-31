# Part B - Classification

This part involves:

1. Creation of three Supervised Machine Learning (SML) models:
   - Decision Tree
   - Gradient Boosting
   - Random Forest
2. Training and evaluation of the models using the processed dataset from Part A.
3. Comparative analysis of the results of the three models in terms of accuracy, precision, recall, and training time.
4. PDF file consisting of a table containing the results of the three models.
5. Summary of Part B.

## Model Creation, Training, and Evaluation

A separate Jupyter notebook was created for each of the three models. Each of these notebooks outputs the results to a CSV file which is stored in the `model_results` directory.

Each result file contains one header row and a single data row, with the following columns:

```
Model,Accuracy,Precision,Recall,Training Time
```

### Results Processing

The notebook `combine_results.ipynb` in directory `utils` is used to combine the results stored in individual CSV files present in the `model_results` directory. The combined results are stored in a new CSV file `results.csv` and an HTML file `results.html` in the `model_results/combined_results` directory.
