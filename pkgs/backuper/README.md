> This module is for the `backuper` package.

[< Back to package overview](../README.md)

# Backuper

- [Backuper](#backuper)
  - [Overview](#overview)

## Overview

`backuper` is a cli tool that makes a copy of the file after your `$EDITOR` saves changes to it. It then prints the path at which this file is written. I made this because of a specific issue I had with GIT where if a commit would fail because of pre-commit hooks then the message would be lost.

Might be useless if git does not delete the `COMMIT_MSG` file after it has seen it being closed.
