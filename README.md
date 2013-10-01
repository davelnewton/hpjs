# Caveats

I had about 90 minutes to work on everything, and it shows. Not much else I can say--I've been a busy boy.

# Basics

* Plain Ruby 1.9, no external dependencies.
* The only stuff that runs is the tests, but they auto-run.

# Auctions

`test_auction_basics` shows the basic functionality, although it's staggeringly far from exhaustive. It doesn't test the output of the auction status call (last bullet item from the assignment).

Delta I barely implemented what was asked for, the core basics are there.

*Things I'd Change*

* Modules
* More tests
* Saner API
* More interfaces and injection
* Directory structure
* Shell scripts for actually running stuff
* Gemfile

# Sequences

*Things I'd Change*

* Scripts and Gemfile

# Original Assignment

## Part 1

Write a backend library for auction house for their online auction system so it supports the following operations (assume that we have an in-memory key-value store lib and a unique id generator available)

* Auctioneer adds an item that can be auctioned. An item has a unique name and reserved price
* Auctioneer starts an auction on an item
* Participants submit bids to an auction, a new bid has to have a price higher than the current highest bid otherwise it's not allowed.
* Auctioneer calls the auction (when s/he makes the judgement on her own that there will be no more higher bids coming in). If the current highest bid is higher than the reserved price of the item, the auction is deemed as a success otherwise it's marked as a failure. The item sold should be no longer available for future auctions.
* Participant/Auctioneer queries the latest action of an item by item name. The library should return the status of the auction if there is any, if the item is sold, it should return the information regarding the price sold and to whom it was sold to.

## Part 2

Given an array of unsorted positive ints, write a function that finds runs of three consecutive numbers (ascending or descending) and returns the indices where such runs begin.  If no such runs are found, return null.

    function findConsecutiveRuns(input:Array):Array

*Example*

    [1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7] => [0, 4, 6, 7]
