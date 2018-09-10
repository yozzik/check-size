#!/usr/bin/perl -w

# https://github.com/yozzik/checkSize/blob/master/checkSize.pl
# Short version
# This script connects to the "lux" database, "files" table, sums up all sizeOfFile fields and compares it with provided maximum size

# Get all encessary modules: DBI for interfacing with database, strict to restrict unsafe actions
use DBI;
use strict;

# Main variables
my $maxSize = 4.7; # Max size in gigabytes
my $checkSize = $maxSize * (1024 * 1024 * 1024); # Check sum in bytes
my $query = "SELECT sum(sizeOfFiles) FROM files;"; # Query to be executed
my $dsn = "DBI:mysql:luxoft"; # Data Source Name
my $user = "root";
my $password = "root";


my $dbh = DBI->connect($dsn, $user, $password, {RaiseError => 1});
my $sth = $dbh->prepare($query);
$sth->execute();
my $fileSize = $sth->fetchrow();

if ($fileSize < $checkSize) {
  print "Size of files is less then check size: $fileSize / $checkSize ($maxSize GB).\n";
}
else {
  print "Size of files is more then check size: $fileSize / $checkSize ($maxSize GB).\n";
}

$sth->finish();
$dbh->disconnect();
