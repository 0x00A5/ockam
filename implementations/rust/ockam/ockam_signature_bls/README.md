# ockam\_signature\_bls

[![crate][crate-image]][crate-link]
[![docs][docs-image]][docs-link]
[![license][license-image]][license-link]
[![discuss][discuss-image]][discuss-link]

Ockam is a library for building devices that communicate securely, privately
and trustfully with cloud services and other devices.

In order to support a variety of proving protocols, this crate implements the BLS signatures scheme which can be used as a building block for other more elaborate zero-knowledge capable signatures like short group signatures.

The main [Ockam][main-ockam-crate-link] has optional dependency on this crate.

## Usage

Add this to your `Cargo.toml`:

```
[dependencies]
ockam_signature_bls = "0.1.0"
```

## Crate Features

The `ockam_signature_bls` crate has a Cargo feature named `"alloc"` that is enabled by
default. In order to use this crate in a `no_std` context this feature can
disabled as follows

```
[dependencies]
ockam_signature_bls = { version = "0.1.0", default-features = false }
```

Please note that Cargo features are unioned across the entire dependency
graph of a project. If any other crate you depend on has not opted out of
`ockam_signature_bls` default features, Cargo will build `ockam_signature_bls` with the std
feature enabled whether or not your direct dependency on `ockam_signature_bls`
has `default-features = false`.

## License

This code is licensed under the terms of the [Apache License 2.0][license-link].

[main-ockam-crate-link]: https://crates.io/crates/ockam
[ockam-vault-crate-link]: https://crates.io/crates/ockam_signature_bls

[crate-image]: https://img.shields.io/crates/v/ockam_signature_bls.svg
[crate-link]: https://crates.io/crates/ockam_signature_bls

[docs-image]: https://docs.rs/ockam_signature_bls/badge.svg
[docs-link]: https://docs.rs/ockam_signature_bls

[license-image]: https://img.shields.io/badge/License-Apache%202.0-green.svg
[license-link]: https://github.com/ockam-network/ockam/blob/HEAD/LICENSE

[discuss-image]: https://img.shields.io/badge/Discuss-Github%20Discussions-ff70b4.svg
[discuss-link]: https://github.com/ockam-network/ockam/discussions
