
# Dotfiles Repository

## Overview

This repository contains my personal dotfiles, designed to streamline the setup of macOS and Linux systems based on my preferences. While primarily tailored for my use, it is open to anyone who may find it useful.

## Supported Platforms

- **macOS**: Fully supported.
- **Linux**: Support may vary, with some functionalities being limited.

## Dependencies

The only prerequisites for using this repository are `Make` and `Git`.

## Project Design

This project is designed with two primary goals in mind:

1. **Portability**
   - Ensures compatibility across different environments, including:
     - macOS
     - Linux-based systems
     - Docker containers
   - Minimizes reliance on external libraries, aiming for a minimalist approach by utilizing essential tools such as `sh`, `curl`, `git`, and `make`.

2. **Modularity**
   - Provides users with the flexibility to select only the components they need.

## Project Structure

The project is organized into separate layers to simplify automation:

1. **Install Layer**
   - Automates the installation of essential tools, with consideration for platform-specific dependencies.

2. **Setup Layer**
   - Manages tool configuration, typically by:
     - Deploying configuration files
     - Running setup scripts

## Usage

### Installation
To install specific software, use the following command:

```bash
./install [TARGET]
```

To install all available software:

```bash
./install -a
```

### Setup
To configure specific software, use the following command:

```bash
./setup [TARGET]
```

To configure all available software:

```bash
./setup -a
```

To list all available software:

```bash
./setup -l
```

## Contributing

While this repository is not open for contributions at the moment, you are welcome to use it for your own configurations.

## License

This repository is available for use under the terms that best suit your needs.
