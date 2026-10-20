# Provenance and implementation notes

Fluoride Treatment Effects was recovered from the author-supplied SAS code PDF, with statements transcribed into editable SAS source and organized for a standalone repository.

Changes include portable input paths, explicit data schemas, fail-fast missing-input checks, and removal of SAS Studio web-only macros and browser print artifacts. Commits describe packaging and reconstruction performed now; they do not backdate the original analysis.

SAS source has not been executed in SAS in this environment. Independent Python checks verify the supplied data and selected numerical results; they do not establish SAS runtime compatibility.
