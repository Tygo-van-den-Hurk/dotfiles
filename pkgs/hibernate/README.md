> This module is for the `hibernate` package.

[< Back to package overview](../README.md)

# Hibernate

- [Hibernate](#hibernate)
  - [Overview](#overview)

## Overview

`hibernate` is a cli tool that allows you to lock your system using whatever locking program you want, and then hibernate your system based on whatever tool you want. You can grantee functionality using environment variables like so:

```
export HIBERNATE_COMMAND="your-locking-program --lock && your-hibernation-command --hibernate"
```

If this environment variable is not set then it will try to find this out dynamically. Seeing which Window manager is running, and then try locking based on that.
