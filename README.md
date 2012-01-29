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

## Commands ##

You can run the phpspec commands within TextMate. The output will be presented in a new window using the 'textmate' formatter. If you wish to override the formatter for the results you can specify the formatter value in a TextMate variable TM_PHPSPEC_FORMATTER.

### Run All ###

This will run all examples within the project.

### Run File ###

This command will run all the examples in the current active file.

### Run the Selected Example

This command will run only the selected example.



### Authors ###

* Alistair Stead <alistair.stead@designdisclosure.com>