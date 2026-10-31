# curriculum-vitae

[![build-cv](https://github.com/Vorpalin/curriculum-vitae/actions/workflows/build.yml/badge.svg)](https://github.com/Vorpalin/curriculum-vitae/actions/workflows/build.yml)

Modèles LaTeX de CV **« Informatique × Recherche »**, tenant sur une page, en deux mises en page et deux langues.
Le contenu est écrit une seule fois ; chaque modèle ne contient que la mise en page.

| | Français | English |
|---|---|---|
| **Une colonne** (sobre, adapté aux outils de tri automatique) | `cv_one_column_fr.pdf` | `cv_one_column_en.pdf` |
| **Deux colonnes** (barre latérale + frise) | `cv_two_columns_fr.pdf` | `cv_two_columns_en.pdf` |

## Télécharger les PDF

Les PDF sont compilés automatiquement par GitHub Actions à chaque tag `v*`.
Derniers fichiers (liens stables) :

- [`cv_one_column_fr.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_one_column_fr.pdf)
- [`cv_one_column_en.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_one_column_en.pdf)
- [`cv_two_columns_fr.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_two_columns_fr.pdf)
- [`cv_two_columns_en.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_two_columns_en.pdf)

Pour publier une nouvelle version : `git tag v1.1 && git push origin v1.1`.

## Structure

```
.
├── cv_one_column.tex      # mise en page une colonne
├── cv_two_columns.tex     # mise en page deux colonnes (photo.jpg optionnelle)
├── content/
│   ├── personal.tex       # nom, contact, liens (partagés par toutes les versions)
│   ├── fr.tex             # contenu en français
│   └── en.tex             # contenu en anglais
├── photo.jpg              # utilisée par le modèle deux colonnes
├── Makefile
└── .github/workflows/build.yml
```

## Compiler en local

Prérequis : une distribution TeX Live avec `pdflatex` (paquets : `titlesec`, `enumitem`, `microtype`, `tikz`, `eso-pic`, `hyperref`) et `make`.

```bash
make                              # les 4 PDF dans build/
make build/cv_two_columns_fr.pdf  # un seul PDF
make clean
```

Sans `make` :

```bash
pdflatex "\def\cvlang{en}\input{cv_one_column.tex}"
```

Le modèle deux colonnes se compile en une seule passe. Sur Overleaf : importer le dépôt, choisir `pdfLaTeX`
et définir la langue en tête de fichier avec `\def\cvlang{fr}` (ou `en`) avant `\documentclass`.

## Modifier le contenu

- **Contact, liens** : `content/personal.tex`.
- **Expériences, projets, compétences** : `content/fr.tex` et `content/en.tex`, avec les macros
  `\cvexp`, `\cvedu`, `\cvskill`, `\cvaward`, `\cvinterest` (voir les commentaires en tête de `content/fr.tex`).
  Utiliser `\cvexplast` / `\cvedulast` pour le dernier élément d'un bloc.
- **Couleurs** : bloc `\definecolor` en tête de chaque modèle.
- **Ajouter une langue** : copier `content/fr.tex` en `content/xx.tex`, traduire, puis ajouter `xx` à `LANGS` dans le `Makefile`.

## Licence et données personnelles

Le code LaTeX (modèles, `Makefile`, workflow) est sous licence [MIT](LICENSE).
Le contenu personnel (`content/`, `photo.jpg`) décrit une personne réelle : il n'est **pas** destiné à être réutilisé.
Si vous utilisez ces modèles, remplacez ces fichiers par les vôtres.
