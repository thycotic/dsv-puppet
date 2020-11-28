# Thycotic Secrets

## Table of Contents

- [Thycotic Secrets](#thycotic-secrets)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [Requirements](#requirements)
    - [Installation](#installation)
  - [Usage](#usage)
    - [DSV configuration](#dsv-configuration)
    - [TSS Configuration](#tss-configuration)
  - [Limitations](#limitations)

## Description

This Puppet module facilitates the consumption of secrets from Thycotic Secret Server(TSS) and DevOps Secret Vault(DSV). 

## Setup

### Requirements

In order to use either Secret Server or DevOps Secret Vault, you must first ensure that the corresponding Ruby SDK is available via the puppetserver gem installer.

```
# Install DevOps Secret Vault SDK
puppetserver gem install dsv-sdk

# Install Secret Server SDK
puppetserver gem install tss-sdk
```

You must also be using a supported OS. See [limitations](#limitations) for a list of supported operating sytems.

### Installation

This module can be cloned directly into your `modules/` folder for your environment. You can validate this by running `puppet module list` to ensure Puppet recognizes it as a valid module.

## Usage

There are three classes that can be instantiated in your `manifest` file. Instantiate the appropiate class (or both) depending on which of the Thycotic services you depend on (DSV/TSS).

- `class { 'thycotic_secrets': }` (_not required_)
- `class { 'thycotic_secrets::dsv': }`
- `class { 'thycotic_secrets::tss': }`

The `thycotic_secrets` base class is _**optional**_ in all cases. If you would like to return the secrets matadata in addition to the secret itself, thwn you can set the `thycotic_secrets::metadata` property to `true`. The default is `false`.

> It is **recommended** that you use **Hiera** for configuration.

### DSV configuration 

`thycotic_secrets::dsv` requires the following properties to be set:

- `client_id` -- The client's identifier for authentication
- `client_secret` -- The client's secret for authentication
- `tenant` -- The server Tenant
- `secret_path` -- The path to the required secret.

An example:

```
# Example config in common.yaml

thycotic_secrets::dsv::client_id: hasdfaw-asefasf-asefs-asefa-asf
thycotic_secrets::dsv::client_secret: supersecretpassword
thycotic_secrets::dsv::tenant: abc
thycotic_secrets::dsv::secret_path: /test/path
```

### TSS Configuration

`thycotic_secrets::tss` requires the following properties to be set:

- `username` -- The client's username for authentication
- `password` -- The client's password for authentication
- `server_url` -- The full qualified server URL
- `secret_id` -- The id of the required secret.

An example:

```
# Example config in common.yaml

thycotic_secrets::tss::username: definitelynotroot
thycotic_secrets::tss::password: notrooteither
thycotic_secrets::tss::server_url: https://mysecretserver.org
thycotic_secrets::tss::secret_id: 1
```

## Limitations

This module _currently_ supports the following operating systems:

- Ubuntu 18.04
- CentOS 7
