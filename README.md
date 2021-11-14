# Data Desings

Here is a catalog of data design patterns used by tercen for the apps and operators.
The aim is to capture the data structure used by Tercen operators.
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
|simple_design                       |pca, flowsom, umap, tsne
|simple_measurement2_design          |minus
|groups_series_design                |DRC, STK Kinetic QC
|groups_series_measurement2_design   |ETS, PTK Kinetic QC
|groups_pairing_control_design       |Anova&Dunnett
|groups_super_series_design          |UKA
|groups_super_design                 |anova1way, anova2way, linear_mixed_model1
|groups_super_control_design         |MTvC
|2groups_super_pairing_control_design|ttest, ttestpaired, lfc
