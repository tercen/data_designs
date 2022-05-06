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
    + control, treatment
* Pair
* Supergroup

|data design                             |example operators
| -----------------------------------    | ------------- |
|c03_simple                              |pca, flowsom, umap, tsne
|c04_measurement2                        |minus
|c05_groups_series                       |DRC, STK Kinetic QC
|c05_super_groups                        |anova1way, anova2way, linear_mixed_model1
|c06_groups_series_measurement2          |ETS, PTK Kinetic QC
|c06_groups_pairing_control              |MTvC, Anova&Dunnett
|c06_2groups_control_ID                  |UKA
|c06_super_groups_control                |ttest
|c07_super_2group_control_pair           |ttestpaired, lfc
