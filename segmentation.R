# Step 1: Load Required Libraries
#install.packages(c("dplyr", "ggplot2", "cluster", "factoextra")) # Run once
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

head(scaled_data)

# Step 4.1: Elbow Method to find optimal K
set.seed(123)  # for reproducibility

fviz_nbclust(scaled_data, kmeans, method = "wss") +
  geom_vline(xintercept = 5, linetype = 2) +
  labs(title = "Elbow Method for Optimal Clusters")

# Step 5: Apply K-Means Clustering
set.seed(123)
k <- 5

kmeans_result <- kmeans(scaled_data, centers = k, nstart = 25)

#Add cluster labels to the original data
data_clean$Cluster <- as.factor(kmeans_result$cluster)

# Step 5.1: Visualize Clusters using PCA (2D projection)
fviz_cluster(kmeans_result, data = scaled_data,
             geom = "point",
             ellipse.type = "norm",
             palette = "jco",
             ggtheme = theme_minimal())

colnames(data_clean)

# Step 6: Cluster Profiling
# Group by Cluster and compute average values
cluster_summary <- data_clean %>%
  group_by(Cluster) %>%
  summarise(
    Count = n(),
    Avg_Age = round(mean(Age), 1),
    Avg_Income = round(mean(Income), 1),
    Avg_SpendingScore = round(mean(Score), 1)
  )

print(cluster_summary)      

write.csv(cluster_summary, "cluster_summary.csv", row.names = FALSE)

cluster_insights <- data.frame(
  Cluster = 1:5,
  Description = c(
    "Young, moderate-income, high-spending customers – likely trend-sensitive shoppers.",
    "Young, slightly higher income, highest spending – high-value target for premium offerings.",
    "Older customers with average income and low spending – focus on utility and convenience.",
    "Middle-aged with highest income but lowest spending – potential to increase engagement.",
    "Older, low-income, moderate spenders – possibly loyal customers seeking value."
  )
)

write.csv(cluster_insights, "cluster_insights.csv", row.names = FALSE)

data_clean$ClusterLabel <- factor(data_clean$Cluster, labels = c(
  "Young-High Spend", 
  "Young-Premium Spend", 
  "Old-Low Spend", 
  "Rich-Low Spend", 
  "Loyal Budgeters"
))

ggplot(data_clean, aes(x = Income, y = Score, color = ClusterLabel)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Customer Segments Based on Behavioral Clusters",
       x = "Annual Income (k$)",
       y = "Spending Score",
       color = "Segment") +
  theme_minimal() +
  scale_color_brewer(palette = "Dark2")