# Data Designs

A catalog of data design patterns used by tercen for the apps and the operators.
The aim is to capture the data structure used by Tercen.
Each data structure has a name and a folder containing some generic example data.
The folder name is prefixed with the cardinality (e.g. c03 is cardinality three)

* Variable
* Observation
* Measurement
* Measurement2
* Series
* Group
    + control, treatment
    + paired
* Supergroup
* Batchgroup
* Filegroup

Brackets in the name are constraints in the data design, for example c07_super_group(2_control_paired), has 2_control_paired, this is indicates it is constraint to 2 controls and there is a paired design.

|data design                           |a few example operators
| -----------------------------------  | ---------------------- |
|c03_simple                            |pca, flowsom, umap, tsne
|c04_group                             |marker_enrichemnt
|c04_measurement2                      |minus
|c05_group_series                      |DRC (dose response curve), PTK_QC (phosphorylation profiles)
|c05_super_group                       |anova-1way, anova-2way, linear_mixed_model
|c06_group_series_measurement2         |ETS, PTK Kinetic QC
|c06_group(2_control)_variable(ID)     |UKA (upstream kinase analysis)
|c06_group(control_paired)             |MTvC (Multiple Treatment vs. Control), Anova&Dunnett
|c06_super_group_measurement2          |
|c06_super_group_series                |
|c06_super_group(2_control)            |
|c06_super_group(control)              |ttest
|c07_super_group(2_control_paired)     |ttest-paired, lfc
|c08_batch_file_super_group(control)   |diffcyt
 