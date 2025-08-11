---
title: Setup Environment
tags: [Infrastructure]
---

# Setup Environment

This task handles environmental setup for the project.
Generally I try to keep a very "tight" control over the environment to ensure high reliability but also try to make it easy to use.
For this, I really found that julia's "Project.toml" and "Manifest.toml" files are very useful.
These files allow you to specify the exact versions of packages that your project depends on, ensuring that everyone working on the project has the same environment.
The current setup uses different setups for different languages:

- Julia: Built-in package manager with `Project.toml` and `Manifest.toml`.
- Python: Uses [uv](https://docs.astral.sh/uv/). Works similar to Julia's package manager.
- Stata: Uses an ad-hoc solution with `packages.do` to install. Does not ensure exact versions, but does ensure that the packages are installed.
- R: Uses `renv` to manage packages. Similar to Julia's package manager.
- Fortran: Uses `fpm` to manage packages. Similar to Julia's package manager.
