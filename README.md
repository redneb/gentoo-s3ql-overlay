# gentoo-s3ql-overlay

This repository contains a [Gentoo ebuild overlay](https://wiki.gentoo.org/wiki/Ebuild_repository) that can be used to install [s3ql](https://github.com/s3ql/s3ql) in a [Gentoo](https://www.gentoo.org/) system. It contains all ebuilds necessary to install a modern version of s3ql. This repository exists because the ebuild found in the official Gentoo package repository is really [old](https://packages.gentoo.org/packages/net-fs/s3ql).

## How to use it

### Via `eselect repository`

The recommended way is to install it via [eselect repository](https://wiki.gentoo.org/wiki/Eselect/Repository):

    eselect repository add s3ql git https://github.com/redneb/gentoo-s3ql-overlay.git

Then you can install s3ql like you would install any other package in Gentoo:

    emerge -av net-fs/s3ql

### Manually

Alternatively, create the file `/etc/portage/repos.conf/s3ql.conf` with the following contents:

    [s3ql]
    location = <repos dir>/s3ql
    sync-type = git
    sync-uri = https://github.com/redneb/gentoo-s3ql-overlay.git
    auto-sync = yes

Then initialize the new repo with:

    emerge --sync s3ql

## Contributing

PRs are welcome.
