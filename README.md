# curriculum-vitae

[![build-cv](https://github.com/Vorpalin/curriculum-vitae/actions/workflows/build.yml/badge.svg)](https://github.com/Vorpalin/curriculum-vitae/actions/workflows/build.yml)

LaTeX CV templates **"Computer Science × Research"**, fitting on one page, in two layouts and two languages.
The content is written once; each template only contains the layout.

| | French | English |
|---|---|---|
| **One column** (clean, ATS-friendly) | `cv_one_column_fr.pdf` | `cv_one_column_en.pdf` |
| **Two columns** (sidebar + timeline) | `cv_two_columns_fr.pdf` | `cv_two_columns_en.pdf` |

## Download the PDFs

The PDFs are built automatically by GitHub Actions on every `v*` tag.
Latest files (stable links):

- [`cv_one_column_fr.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_one_column_fr.pdf)
- [`cv_one_column_en.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_one_column_en.pdf)
- [`cv_two_columns_fr.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_two_columns_fr.pdf)
- [`cv_two_columns_en.pdf`](https://github.com/Vorpalin/curriculum-vitae/releases/latest/download/cv_two_columns_en.pdf)

To publish a new version: `git tag v1.1 && git push origin v1.1`.

## Structure

```
.
├── cv_one_column.tex          # one-column layout
├── cv_two_columns.tex         # two-column layout (photo.jpg optional)
├── content/
│   ├── personal.tex           # local-only personal data (not tracked by Git)
│   ├── personal.example.tex   # empty template for local setup
│   ├── fr.tex                 # French content
│   └── en.tex                 # English content
├── photo.jpg                  # used by the two-column template
├── Makefile
└── .github/workflows/build.yml
```

## Build locally

Requirements: a TeX Live distribution with `pdflatex` (packages: `titlesec`, `enumitem`, `microtype`, `tikz`, `eso-pic`, `hyperref`) and `make`.

Create your local personal data file once:

```bash
cp content/personal.example.tex content/personal.tex
```

Then fill in the macros in `content/personal.tex`. This file is ignored by Git, so your personal details stay on your machine.

```bash
make                              # the 4 PDFs in build/
make build/cv_two_columns_fr.pdf  # a single PDF
make clean
```

Without `make`:

```bash
pdflatex "\\def\\cvlang{en}\\input{cv_one_column.tex}"
```

The two-column template compiles in a single pass. On Overleaf: import the repository, provide your own `content/personal.tex`, choose `pdfLaTeX`
and set the language at the top of the file with `\\def\\cvlang{fr}` (or `en`) before `\\documentclass`.

## Editing the content

- **Personal details and links**: local `content/personal.tex`; never commit it.
- **Experience, projects, skills**: `content/fr.tex` and `content/en.tex`, using the macros
  `\\cvexp`, `\\cvedu`, `\\cvskill`, `\\cvaward`, `\\cvinterest` (see the comments at the top of `content/fr.tex`).
  Use `\\cvexplast` / `\\cvedulast` for the last item of a block.
- **Colors**: `\\definecolor` block at the top of each template.
- **Adding a language**: copy `content/fr.tex` to `content/xx.tex`, translate it, then add `xx` to `LANGS` in the `Makefile`.

## GitHub Actions secrets

The workflow creates `content/personal.tex` at build time from these **repository secrets**:

| Secret | Contents |
|---|---|
| `CV_NAME` | Full name |
| `CV_CITY` | City / location displayed on the CV |
| `CV_EMAIL` | Email address |
| `CV_PHONE` | Phone number |
| `CV_LINKEDIN_ID` | LinkedIn profile identifier |
| `CV_GITHUB_USER` | GitHub username |

Add them in **Settings → Secrets and variables → Actions → New repository secret**.
The workflow requires all six values. They are injected only into the build step and are not written to the repository.
Pull requests from forks skip the build because GitHub does not expose repository secrets to those workflows.

The generated PDFs still contain the contact details by design. Keep the repository private if the PDFs and their workflow artifacts/releases must remain access-restricted.

## License and personal data

The LaTeX code (templates, `Makefile`, workflow) is released under the [MIT](LICENSE) license.
The personal content (`content/`, `photo.jpg`) describes a real person: it is **not** meant to be reused.
If you use these templates, replace these files with your own.
