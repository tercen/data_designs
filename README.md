# Data Designs

A catalog of data design patterns used by tercen for the apps and the operators.
The aim is to capture the data structure used by Tercen.
Each data structure has a name and a folder containing some generic example data.
The folder name is prefixed with the cardinality (e.g. c03 is cardinality three)

* Measurement
* Measurement2
* Variable
* Observation
* Series
* Group
* Pair
* Supergroup

|data design                         |example operators
| -----------------------------------| ------------- |
|c03_simple_design                       |pca, flowsom, umap, tsne
|c04_simple_measurement2_design          |minus
|c05_groups_series_design                |DRC, STK Kinetic QC
|c05_groups_super_design                 |anova1way, anova2way, linear_mixed_model1
|c06_groups_series_measurement2_design   |ETS, PTK Kinetic QC
|c06_groups_pairing_control_design       |Anova&Dunnett
|c06_groups_super_series_design          |UKA
|c06_groups_super_control_design         |MTvC
|c07_2groups_super_pairing_control_design|ttest, ttestpaired, lfc
