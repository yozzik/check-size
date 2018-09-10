#!/usr/bin/perl -w

# https://github.com/yozzik/checkSize/blob/master/check_size_short.pl
# Short version
# This script connects to the "lux" database, "files" table, sums up all sizeOfFile fields and compares it with provided maximum size

# Get all encessary modules: DBI for interfacing with database, strict to restrict unsafe actions
use DBI;
use strict;

# Main variables
my $maxSize = 4.7; # Max size in gigabytes
my $checkSize = $maxSize * (1024 * 1024 * 1024); # Check sum in bytes
my $query = "SELECT sum(sizeOfFiles) FROM files;"; # Query to be executed
my $dsn = "DBI:mysql:lux"; # Data Source Name
my $user = "test";
my $password = "112358";

# Establish connection, prepare and execute query
my $dbh = DBI->connect($dsn, $user, $password, {RaiseError => 1});
my $sth = $dbh->prepare($query);
$sth->execute();

# Save query results
my $fileSize = $sth->fetchrow();

# Validate files size
if ($fileSize < $checkSize) {
  print "Size of files is less then $maxSize GB.\n";
}
else {
  print "Size of files is more then $maxSize GB.\n";
}

# Close statement handler, disconnect from DB
$sth->finish();
$dbh->disconnect();
