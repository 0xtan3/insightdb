# InsightDB

## Overview

InsightDB is a lightweight key-value store database implemented in OCaml, inspired by the Bitcask model. Designed for performance and simplicity, InsightDB aims to provide low latency, high throughput, and crash resilience while handling larger datasets.

## Features

- **Key-Value Storage**: Efficiently store and retrieve key-value pairs.
- **Log-Structured Design**: Utilizes a log-structured approach for fast writes and reads.
- **Immutable Data Files**: Once closed, data files are immutable, ensuring data integrity.
- **Crash Resilience**: Fast recovery with no data loss in case of crashes.
- **Easy Backup and Restore**: Simple file system-level backup and restoration.
- **In-Memory Key Directory**: Maps keys to their latest values for quick access.