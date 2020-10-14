# Choppingauer

This is a skeleton application for scanning articles barcode and mimic shopping.
There are three devices; barcode scanner, lcd display, printer. All of them are virtual.
Scanner can be any browser or console.
Lcd display and printer are files under directory tmp/print_devices/


## Getting started

After installation run specs in project directory.
```
# rspec --format=documentation
```
If all specs are succefuly passed, you can start manual testing, if you wish.
Run aplication server. Go to tmp/print_devices/ directory, then open lcd and printer files in modern editor.
Start shopping. In console send:
```
# curl http://localhost:3000/scan/1234567A
# curl http://localhost:3000/scan/1234567B
# curl http://localhost:3000/scan/1234567C
```
1234567(A-J) are barcodes
When barcode is in database, appropriate article name and price is printed on lcd (file). Article is cached.
If barcode is not present in database, "Product not found" is printed on lcd.
Next finish shopping. In console send:
```
# curl http://localhost:3000/exit
```
After it:
* Articles in cache are printed on printer (file) in format [name: price], eg."banana: 7"
* Total price is printed on printer in format ["total:", sum], eg.  "total: 10"
* Total price is prited on lcd display (file) in format [sum], eq. "10"

### Instalation
```
$ git clone https://github.com/THIS_PROJECT.git
$ cd THIS_PROJECT
```

Then install the needed gems (while skipping any gems needed only in production):

```
$ bundle install --without production
```

Next:

```
$ rake db:create
$ rake db:migrate
$ rake db:migrate RAILS_ENV=test
$ rake db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server

## License

All source code is under GPLv3 lincese.
