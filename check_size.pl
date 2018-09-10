#!/usr/bin/perl -w

# https://github.com/yozzik/check_size/blob/master/check_size.pl
# This script connects to the "lux" database, "files" table, sums up all sizeOfFile fields and compares it with provided maximum size

# Get all encessary modules: DBI for interfacing with database, strict to restrict unsafe actions
use DBI;
use strict;

# Main variables
my $maxSize = 4.7; # Max size in gigabytes
my $maxFileSize = $maxSize * (1024 * 1024 * 1024); # Check sum in bytes
my $query = "SELECT sum(sizeOfFiles) FROM files;"; # Query to be executed
my $dsn = "DBI:mysql:lux"; # Data Source Name
my $user = "test";
my $password = "112358";

sub getSizeOfFilesFromDB {
  # Establish connection, prepare a query, execute it and save result, then close connection and return $fileSize
  my $dbh = DBI->connect($dsn, $user, $password, {RaiseError => 1});
  my $sth = $dbh->prepare($query);
  $sth->execute();
  my $filesSize = $sth->fetchrow();
  $sth->finish();
  $dbh->disconnect();
  return ($filesSize);
}

# Print verification result based on received size
if (getSizeOfFilesFromDB() < $maxFileSize) {
  print "Size of files is less then $maxSize GB.\n";
}
else {
  print "Size of files is more then $maxSize GB.\n";
}
