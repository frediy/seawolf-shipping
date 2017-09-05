# Seawolf Shipping

## Installation

    $ git clone git@github.com:theminted/seawolf-shipping.git

In seawolf-shipping directory

    $ bundle

## Usage

    $ ./bin/calculate <transportation_amount>

For example:

    $ ./bin/calculate 17
    1S 2P

New ships can be added to bin/calculate to the ships variable

    ships = [
      ...
      Ships.new(identifier: 'G', name: 'Grandiosa', capacity: 12)
    ]

## Test suite

    $ rspec spec
