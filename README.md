# Data Designs

A catalog of data design patterns used by tercen for the apps and the operators.
The aim is to capture the data structure used by Tercen.
Each data structure has a name and a folder containing some generic example data.
The folder name is prefixed with the cardinality (e.g. c03 is cardinality three)
Brackets in the name are constraints in the data design, for example `c07_super_group(2_control_paired)`, has the constraint of 2_control_paired, this is indicates the design is constraint to 2 groups and has a paired design.

Here is a list of the factors used in the data design and a non exhaustive list of examples.

|Factor                     | Examples
|-------------------------- | ----------- |
|`Variable`                   | marker, gene, peptide
|`Observation`                | event_id, well_id
|`Measurement`                | Signal intensity
|`Measurement2`               | QC value
|`Series`                     | Compound Concentration
|`Group`                      | Condition, Array
|       `control`, `treatment`  | Drug condition (Control and Treatment)
|`Paired`                     | Donors pairing factor for Group (i.e. Condition)
|`Supergroup`                 | Healthy and Diseased
|`Batchgroup`                 | Reagent batch
|`Filegroup`                  | Sample fcs file

Here are a list of data designs.

|data design                           |a few example operators
| -----------------------------------  | ---------------------- |
|`c03_simple`                            |pca, flowsom, umap, tsne
|`c04_group`                             |marker_enrichemnt
|`c04_measurement2`                      |minus
|`c05_group_series`                      |DRC (dose response curve), PTK_QC (phosphorylation profiles)
|`c05_super_group`                       |anova-1way, anova-2way, linear_mixed_model
|`c06_group_series_measurement2`         |ETS, PTK Kinetic QC
|`c06_group(2_control)_variable(ID)`     |UKA (upstream kinase analysis)
|`c06_group(control_paired)`             |MTvC (Multiple Treatment vs. Control), Anova&Dunnett
|`c06_super_group_measurement2`          |
|`c06_super_group_series`                |
|`c06_super_group(2_control)`            |
|`c06_super_group(control)`              |ttest
|`c07_super_group(2_control_paired)`     |ttest-paired, lfc
|`c08_batch_file_super_group(control)`   |diffcyt
 
