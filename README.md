# DevOps Secret Vault

## PUBLIC ARCHIVE

> ***Warning***
>
> This repo is archived.
> This is still available under the licensing terms, but is not being actively developed or updated any further. Please see [DelineaXPM](https://github.com/DelineaXPM) for active projects.

## Table of Contents

- [DevOps Secret Vault](#devops-secret-vault)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [Requirements](#requirements)
    - [Installation](#installation)
  - [Usage](#usage)
    - [DSV configuration](#dsv-configuration)
  - [Limitations](#limitations)

## Description

This Puppet module facilitates the consumption of secrets from DevOps Secret Vault(DSV).

## Setup

### Requirements

In order to use DevOps Secret Vault, you must first ensure that the corresponding Ruby SDK is available via the puppetserver gem installer.

```
# Install DevOps Secret Vault SDK
puppetserver gem install dsv-sdk
```

You must also use a supported OS. See [limitations](#limitations) for a list of supported operating systems.

### Installation

This module can be cloned directly into your `modules/` folder for your environment and rename the folder to `dsv/` so that puppets is able to compile the catalog and find the `dsv` resource. You can validate this by running `puppet module list` to ensure Puppet recognizes it as a valid module.

## Usage

Your DSV secret can be made available by initiating a single class:

```
class { 'dsv': }
```

If you would like to return the secrets metadata in addition to the secret itself, you can set the `dsv::metadata` property to `true`. The default is `false`.

You can access your returned secret with the `dsv::secret` property.

> It is **recommended** that you use **Hiera** for configuration.

### DSV configuration

`dsv` requires the following properties to be set:

- `client_id` — The client's identifier for authentication
- `client_secret` — The client's secret for authentication
- `tenant` — The server Tenant
- `secret_path` — The path to the required secret.

An example:

```
# Example config in common.yaml
dsv::client_id: hasdfaw-asefasf-asefs-asefa-asf
dsv::client_secret: supersecretpassword
dsv::tenant: abc
dsv::secret_path: /test/path
```

## Limitations

This module _currently_ supports the following operating systems:

- Ubuntu 18.04
- CentOS 7
