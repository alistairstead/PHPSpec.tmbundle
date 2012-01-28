# PHPSpec TextMate bundle #

A TextMate bundle to support the use of PHPSpec for TDD. Provides templates and snippets for the full API of PHPSpec.

## Roadmap ##

* Test runner and HTML output within TextMate
* Autorun integration

## Prerequisites ##

Requires PHPSpec

    $ sudo pear channel-discover pear.phpspec.net
    $ sudo pear install phpspec/PHPSpec

## Installation ##

To install via Git:

    cd "~/Library/Application Support/TextMate/Bundles/"
    git clone git://github.com/alistairstead/PHPSpec.tmbundle.git "PHPSpec.tmbundle"
    osascript -e 'tell app "TextMate" to reload bundles'

Either way, restart TextMate or select "Reload Bundles" from the Bundles >> Bundle Editor menu.

### Authors ###

* Alistair Stead <alistair.stead@designdisclosure.com>