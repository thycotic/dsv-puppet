# DevOps Secret Vault

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

This module can be cloned directly into your `modules/` folder for your environment. You can validate this by running `puppet module list` to ensure Puppet recognizes it as a valid module.

## Usage

There are two classes that can be instantiated in your `manifest` file. Instantiate the appropriate class depending on which of the Thycotic services you depend on.

- `class { 'thycotic_dsv': }` (_not required_)
- `class { 'thycotic_dsv::dsv': }`

The `thycotic_dsv` base class is _**optional**_ in all cases. If you would like to return the secrets metadata in addition to the secret itself, you can set the `thycotic_dsv::metadata` property to `true`. The default is `false`.

> It is **recommended** that you use **Hiera** for configuration.

### DSV configuration

`thycotic_dsv::dsv` requires the following properties to be set:

- `client_id` — The client's identifier for authentication
- `client_secret` — The client's secret for authentication
- `tenant` — The server Tenant
- `secret_path` — The path to the required secret.

An example:

```
# Example config in common.yaml

thycotic_dsv::dsv::client_id: hasdfaw-asefasf-asefs-asefa-asf
thycotic_dsv::dsv::client_secret: supersecretpassword
thycotic_dsv::dsv::tenant: abc
thycotic_dsv::dsv::secret_path: /test/path
```

## Limitations

This module _currently_ supports the following operating systems:

- Ubuntu 18.04
- CentOS 7
