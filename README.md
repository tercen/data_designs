# Data Designs

A catalog of data design patterns used by tercen for the apps and the operators.
The aim is to capture the data structure used by Tercen.
Each data structure has a name and a folder containing some generic example data.
The folder name is prefixed with the cardinality (e.g. c03 is cardinality three)
Brackets in the name are constraints in the data design, for example `c07_super_group(2_control_paired)`, has the constraint in the `group` factor of `2_control_paired`, this indicates the design of `group` is constraint to 2 groups and has a paired design.

Here is a list of the factors used in the data design and a non exhaustive list of examples.

|Factor                     | Examples
|-------------------------- | ----------- |
|`Variable`                   | marker, gene, peptide, ID
|`Observation`                | event_id, well_id
|`Measurement`                | Signal intensity
|`Measurement2`               | QC value
|`Series`                     | Compound Concentration, ordered list
|`Group` with `control`, `treatment` | Drug Condition, multiple drugs or with only a control and treatment
|`Paired`                     | Donors pairing factor for Group (i.e. Condition)
|`Supergroup`                 | Healthy and Diseased
|`Batchgroup`                 | Reagent batch
|`Filegroup`                  | Sample fcs file

Here are a list of data designs.

|data design                           | factors of interest                      | a few example operators/apps
| -----------------------------------  | ---------------------------------------- | ------------------
|`c03_simple`                          |`Variable`, `Observation`, `Measurement`  |pca, flowsom, umap, tsne
|`c04_group`                           |`Group`                                   |marker_enrichemnt
|`c04_measurement2`                    |`Measurement2`                            |minus
|`c05_group_series`                    |`Group`, `Series`                         | incl. DRC (dose response curve), PTK_QC (phosphorylation profiles)
|`c05_super_group`                     |`Super`, `Group`                          |anova-1way, anova-2way, linear_mixed_model
|`c06_group_series_measurement2`       |`Group`, `Series`,`Measurement2`          |ETS, PTK Kinetic QC
|`c06_group(2_control)_variable(ID)`   |`Group`, `Variable`:with contraints       |UKA (upstream kinase analysis)
|`c06_group(control_paired)`           |`Group`:with constraints                  |MTvC (Multiple Treatment vs. Control), Anova&Dunnett
|`c06_super_group_measurement2`        |`Super`, `Group`, `Measurement2`          |
|`c06_super_group_series`              |`Super`, `Group`, `Series`                |
|`c06_super_group(2_control)`          |`Super`, `Group` :with contraints         |
|`c06_super_group(control)`            |`Super`, `Group` :with contraints         |ttest
|`c07_super_group(2_control_paired)`   |`Super`, `Group` :with contraints         |ttest-paired, logfoldchange
|`c08_batch_file_super_group(control)` |`Batch`, `File`, `Super`, `Group`: with constraints| diffcyt
 
