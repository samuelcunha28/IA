# --------------------------- packages instalation --------------------------- #

packages = c("caTools",
             "rpart",
             "rpart.plot")

## Check and Install Packages
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

# -------------------------- purchases prediction ---------------------------- #

library(caTools)
library(rpart)
library(rpart.plot)

# Fixed seed to replicate results (Optional)
set.seed(86192)

# Read Online Social Network (OSN) Purchases by Ads data (.csv)
osn_dataset <- read.csv("social_network_ads.csv") # TODO: CHANGE THE FILE PATH
osn_data <- subset(osn_dataset, select = - User.ID)
View(osn_data)

# Randomize dataset
random_indexes <- sample(1:nrow(osn_data))
osn_data <- osn_data[random_indexes,]

# Spliting the dataset to generate train and test data. The split ratio is
# equal to 0.7, meaning that 70% of data will be used for train and the remaining
# 30% will be used for test

spl = sample.split(osn_data$Purchased, SplitRatio = 0.7)
osn_ads_train = subset(osn_data, spl == TRUE)
osn_ads_test = subset(osn_data, spl == FALSE)

# Model Training. methot is 'class' for classification and 'anova' for regression
osn_ads_model <- rpart(Purchased ~.,
                       data = osn_ads_train,
                       method = 'class')
osn_ads_model

# Ploting the tree model
rpart.plot(osn_ads_model, extra = 102)

# Predictions using the test dataset
osn_ads_prediction <- predict(osn_ads_model, osn_ads_test, type = 'class')
confusion_matrix <- table(osn_ads_test$Purchased, osn_ads_prediction)
confusion_matrix

# Combining prediction results with test dataset
osn_ads_test$model_prediction <- osn_ads_prediction

# Error analysis (cases where the prediction failed)
errors <- osn_ads_test[osn_ads_test$model_prediction != osn_ads_test$Purchased,]
View(errors)