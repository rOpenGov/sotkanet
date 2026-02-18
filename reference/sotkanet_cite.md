# Crate a Data Bibliography

Crates a bibliography from selected Sotkanet data file.

## Usage

``` r
sotkanet_cite(id, lang = "fi", format = "Biblatex")
```

## Arguments

- id:

  Indicator id.

- lang:

  Language for the citation. Options are English (en), Finnish (fi) and
  Swedish (sv).

- format:

  Default is "Biblatex", alternatives are "bibentry" or "Bibtex".

## Value

a Biblatex, bibentry or Bibtex object.

## References

See citation("sotkanet")

## See also

\[utils::bibentry()\] \[RefManageR::toBiblatex()\]

## Examples

``` r
if (FALSE) { # \dontrun{
SotkanetCite(10013, lang = "en", format = "Biblatex")
SotkanetCite(10012, lang = "fi", format = "Biblatex")
SotkanetCIte(10011, lang = "sv", format = "Biblatex")
SotkanetCite(10013, lang = "en", format = "bibentry")
SotkanetCite(10013, lang = "en", format = "Bibtex")
} # }
```
