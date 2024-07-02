# El mundo de Lope de Vega (NER) 🌍

This repository contains the datasets and the scripts we have used to train our NER model with the [Flair](https://github.com/flairNLP/flair) framework, as well as the results. This model is based on the one developed by the members of the project [Desenrollando el cordel](https://github.com/DesenrollandoElCordel/pliegos-ner), and has been applied to detect the toponyms in the corpus of the _Comedia Nueva_, by Lope de Vega (378 plays). Statistics showing the number of works in which each (standardised) place name is mentioned, and the total number of occurrences in the whole corpus, can be [found here](https://github.com/MiguelBetti/Lope_ner/blob/main/Estadisticas.Rmd).

Many thanks to Elina Leblanc and Pauline Jacsont for their help and support!

## ***Training - Fine-tuning***
The script we used for the fine-tuning of our model can be found [here](https://github.com/MiguelBetti/Lope_ner/blob/main/NER_LOPE_TRAIN.py).

The default Spanish NER model of Flair has been [tested](https://github.com/MiguelBetti/Lope_ner/blob/main/NER_LOPE_TEST.py) on 10 [random texts](https://github.com/MiguelBetti/Lope_ner/tree/main/corpus_test). We have then fine-tuned the [bert-spanish-cased-finetuned-ner](https://huggingface.co/mrm8488/bert-spanish-cased-finetuned-ner) model (developped by Manuel Romero), to obtein a first model. The results are available [here](https://github.com/MiguelBetti/Lope_ner/tree/main/ner_bertSpanish_fineTuning).

|   | F1-Score  | Precision  | Recall |
|---|---|---|---|
| 10 plays, 20 epochs | 88,64%  | 91,76% | 85,71% |

We have tried also the [xml-roberta-large](https://huggingface.co/MMG/xlm-roberta-large-ner-spanish) model to obtained our best model. The results are available [here](https://github.com/MiguelBetti/Lope_ner/tree/main/ner_bertSpanish_fineTuning2).

|   | F1-Score  | Precision  | Recall |
|---|---|---|---|
| 10 plays, 20 epochs | 91,71%  | 92,22% | 91,21% |

To train the models, we have used the [Baobab HPC cluster](https://www.unige.ch/eresearch/en/services/hpc/) of the University of Geneva.


## ***Results***

The texts of our corpus have been annotated with the [BIO format](https://en.wikipedia.org/wiki/Inside%E2%80%93outside%E2%80%93beginning_(tagging)) using this [script](https://github.com/MiguelBetti/Lope_ner/blob/main/NER_LOPE.py). To develop different maps with the place names, we transformed these results into several CSV files:

- Extraction of the place names, with [ner2csv.py](https://github.com/MiguelBetti/Lope_ner/blob/main/tools/ner2csv.ipynb).
- Enrichment of the [CSV file]() with information extracted from [Artelope](https://artelope.uv.es/basededatos/index.php) (title of the plays, genre, subgenre, publication date, etc.) and from Wikidata thanks to *Open Refine* (Wikidata identifier, geographical coordinates, type of place, normalised names).
- Conversion in JSON to create a map with [Peripleo](https://github.com/britishlibrary/peripleo) with the [csv2json.py](https://github.com/MiguelBetti/Lope_ner/blob/main/tools/csv2json.ipynb) script developped by Elina Leblanc. The code and datasets are available [here](https://github.com/MiguelBetti/Lope_peripleo). Please explore our [map](https://miguelbetti.github.io/Lope_peripleo/#/?/?/?/mode=points)!