#!/usr/bin/perl -w

# This script connects to the "lux" database, "files" table, sums up all sizeOfFile fields and compares it with provided maximum size

# Get all encessary modules: DBI for interfacing with database, strict to restrict unsafe actions
use DBI;
use strict;


# Main variables
my $maxSize = 4700; # Max size in megabytes
my $checkSize = $maxSize * (1024 * 1024 * 1024) / 1000; # Check sum in bytes
my $query = "SELECT sum(sizeOfFile) FROM files;"; # Query to be executed


# Set Data Source Name and credentials for connection
my $dsn = "DBI:mysql:lux";
my $user = "test";
my $password = "112358";


# Establish connection via DBI, RaiseErrors if they appear
my $dbh = DBI->connect($dsn, $user, $password, {RaiseError => 1});
# Prepare a query and execute it
my $sth = $dbh->prepare($query);
$sth->execute();


# Get sum(sizeOfFile) from DB
my $sizeOfFileSum = $sth->fetchrow();


# Print results
if ($sizeOfFileSum < $checkSize) {
  print "Size of files is less then check size: $sizeOfFileSum / $checkSize ($maxSize MB).\n";
}
else {
  print "Size of files is more then check size: $sizeOfFileSum / $checkSize ($maxSize MB).\n";
}
