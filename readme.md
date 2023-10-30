# Sliding aggregation on NYC taxi data

This project implements a sliding aggregation algorithm for processing large datasets, with a specific focus on NYC Taxi data. The project leverages the power of Spark and Hadoop for efficient data processing and analysis. The primary goal is to perform sliding aggregation on the dataset and evaluate the results.

## Project Details

### Prerequisites

Before running the code, make sure you have the following prerequisites:

- Python
- Jupyter Notebook
- Spark
- Hadoop
- PyDrive
- OpenJDK 8

### Code Structure

The code is organized into several sections:

1. **Configuring Spark**: This section installs and configures the necessary dependencies, including Spark, PyDrive, and OpenJDK.

2. **Creating Spark Session**: It creates a Spark Session for data processing, which includes setting memory configurations.

3. **Download Data**: The script downloads the NYC Taxi data in Parquet format for analysis.

4. **Prepare Data for the Assignment**: This section prepares the data by selecting specific columns and adding queries and label placeholders.

5. **TeraSort**: The TeraSort algorithm is used to sort and balance the data efficiently.

6. **Perfect Balance**: The script calculates the rank using prefix sums to achieve perfect balance in the dataset.

7. **Multidimensional Interval Multiquery Processor**: This section processes multidimensional interval queries on the balanced dataset.

8. **All in One Place**: A function is provided to run the entire processing pipeline, including sorting, balancing, and query processing.

## Usage

To use this code, follow these steps:

1. Install the required dependencies mentioned in the "Prerequisites" section.

2. Download the NYC Taxi data or replace it with your own dataset.

3. Open the Jupyter Notebook and run each code cell sequentially.

4. Modify the code as needed for your specific dataset and analysis.

## References

The code includes ideas and concepts from the following research papers:

- [Minimal MapReduce algorithms](https://dl.acm.org/doi/abs/10.1145/2463676.2463719)
- [Towards minimal algorithms for big data analytics with spreadsheets
](https://www.researchgate.net/publication/347774383_Towards_minimal_algorithms_for_big_data_analytics_with_spreadsheets)

---