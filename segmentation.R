# Step 1: Load Required Libraries
install.packages(c("dplyr", "ggplot2", "cluster", "factoextra")) # Run once
library(dplyr)
library(ggplot2)
library(cluster)
library(factoextra)

# Step 2: Load and View the Dataset
data <- read.csv("Mall_Customers.csv")

# View the first few rows
head(data)

# Check structure and summary
str(data)
summary(data)

# Step 3: Data Preprocessing

# Convert Gender to numeric: Female = 0, Male = 1
data$Gender <- ifelse(data$Gender == "Male", 1, 0)

# Select relevant columns
data_clean <- data[, c("Gender", "Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Rename columns
colnames(data_clean) <- c("Gender", "Age", "Income", "Score")

# View the cleaned data
head(data_clean)

# Step 4: Scaling the Data
scaled_data <- scale(data_clean)

# Step 4.1: Elbow Method to find optimal K
set.seed(123)  # for reproducibility

fviz_nbclust(scaled_data, kmeans, method = "wss") +
  geom_vline(xintercept = 5, linetype = 2) +
  labs(title = "Elbow Method for Optimal Clusters")
