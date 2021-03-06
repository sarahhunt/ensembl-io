=pod

=head1 LICENSE

  Copyright (c) 1999-2013 The European Bioinformatics Institute and
  Genome Research Limited.  All rights reserved.

  This software is distributed under a modified Apache license.
  For license details, please see

  http://www.ensembl.org/info/about/code_licence.html

=head1 NAME

Bio::EnsEMBL::IO::Parser::Psl - A line-based parser devoted to PSL format

=cut

package Bio::EnsEMBL::IO::Parser::Psl;

use strict;
use warnings;

use base qw/Bio::EnsEMBL::IO::TrackBasedParser/;

## ----------- Mandatory fields (21) -------------

=head2 get_raw_matches

    Description: Getter for matches field (number of matching bases that aren't repeats)
    Returntype : Integer

=cut

sub get_raw_matches {
  my $self = shift;
  return $self->{'record'}[0];
}

=head2 get_matches

    Description: Getter - wrapper around get_raw_matches 
    Returntype : Integer

=cut

sub get_matches {
  my $self = shift;
  return $self->get_raw_matches; 
}

=head2 get_raw_misMatches

    Description: Getter for misMatches field (number of bases that don't match)
    Returntype : Integer

=cut

sub get_raw_misMatches {
  my $self = shift;
  return $self->{'record'}[1];
}

=head2 get_misMatches

    Description: Getter - wrapper around get_raw_misMatches 
    Returntype : Integer

=cut

sub get_misMatches {
  my $self = shift;
  return $self->get_raw_misMatches; 
}

=head2 get_raw_repMatches

    Description: Getter for repMatches field (number of matching bases that are part of repeats)
    Returntype : Integer

=cut

sub get_raw_repMatches {
  my $self = shift;
  return $self->{'record'}[2];
}

=head2 get_repMatches

    Description: Getter - wrapper around get_raw_repMatches 
    Returntype : Integer

=cut

sub get_repMatches {
  my $self = shift;
  return $self->get_raw_repMatches; 
}

=head2 get_raw_nCount

    Description: Getter for nCount field (number of 'N' bases)
    Returntype : Integer

=cut

sub get_raw_nCount {
  my $self = shift;
  return $self->{'record'}[3];
}

=head2 get_nCount

    Description: Getter - wrapper around get_raw_nCount 
    Returntype : Integer

=cut

sub get_nCount {
  my $self = shift;
  return $self->get_raw_nCount; 
}

=head2 get_raw_qNumInsert

    Description: Getter for qNumInsert field (Number of inserts in query)
    Returntype : Integer

=cut

sub get_raw_qNumInsert {
  my $self = shift;
  return $self->{'record'}[4];
}

=head2 get_qNumInsert

    Description: Getter - wrapper around get_raw_qNumInsert 
    Returntype : Integer

=cut

sub get_qNumInsert {
  my $self = shift;
  return $self->get_raw_qNumInsert; 
}

=head2 get_raw_qBaseInsert

    Description: Getter for qBaseInsert field (Number of bases inserted into query)
    Returntype : Integer

=cut

sub get_raw_qBaseInsert {
  my $self = shift;
  return $self->{'record'}[5];
}

=head2 get_qBaseInsert

    Description: Getter - wrapper around get_raw_qBaseInsert 
    Returntype : Integer

=cut

sub get_qBaseInsert {
  my $self = shift;
  return $self->get_raw_qBaseInsert; 
}

=head2 get_raw_tNumInsert

    Description: Getter for tNumInsert field (Number of inserts in target)
    Returntype : Integer

=cut

sub get_raw_tNumInsert {
  my $self = shift;
  return $self->{'record'}[6];
}

=head2 get_tNumInsert

    Description: Getter - wrapper around get_raw_tNumInsert 
    Returntype : Integer

=cut

sub get_tNumInsert {
  my $self = shift;
  return $self->get_raw_tNumInsert; 
}

=head2 get_raw_tBaseInsert

    Description: Getter for tBaseInsert field (Number of bases inserted into target)
    Returntype : Integer

=cut

sub get_raw_tBaseInsert {
  my $self = shift;
  return $self->{'record'}[7];
}

=head2 get_tBaseInsert

    Description: Getter - wrapper around get_raw_tBaseInsert 
    Returntype : Integer

=cut

sub get_tBaseInsert {
  my $self = shift;
  return $self->get_raw_tBaseInsert; 
}

=head2 get_raw_strand

    Description: Getter for strand field
    Returntype : String

=cut

sub get_raw_strand {
  my $self = shift;
  return $self->{'record'}[8];
}

=head2 get_strand

    Description: Getter - wrapper around get_raw_strand 
                  Defined as + (forward) or - (reverse) for query strand; 
                  in mouse, a second '+' or '-' indicates genomic strand
                  We want a single value, converted to an integer
    Returntype : Integer

=cut

sub get_strand {
  my $self = shift;
  my $strand = substr($self->get_raw_strand, -1, 1);
  return $self->{'strand_conversion'}{$strand};
}

=head2 get_raw_qName

    Description: Getter for qName field (Query sequence name)
    Returntype : String

=cut

sub get_raw_qName {
  my $self = shift;
  return $self->{'record'}[9];
}

=head2 get_qName

    Description: Getter - wrapper around get_raw_qName 
    Returntype : String

=cut

sub get_qName {
  my $self = shift;
  return $self->get_raw_qName; 
}

=head2 get_raw_qSize

    Description: Getter for qSize field (Query sequence size)
    Returntype : Integer

=cut

sub get_raw_qSize {
  my $self = shift;
  return $self->{'record'}[10];
}

=head2 get_qSize

    Description: Getter - wrapper around get_raw_qSize 
    Returntype : Integer

=cut

sub get_qSize {
  my $self = shift;
  return $self->get_raw_qSize; 
}

=head2 get_raw_qStart

    Description: Getter for qStart field (Alignment start position in query)
    Returntype : Integer

=cut

sub get_raw_qStart {
  my $self = shift;
  return $self->{'record'}[11];
}

=head2 get_qStart

    Description: Getter - wrapper around get_raw_qStart 
    Returntype : Integer

=cut

sub get_qStart {
  my $self = shift;
  return $self->get_raw_qStart; 
}

=head2 get_raw_qEnd

    Description: Getter for qEnd field (Alignment end position in query)
    Returntype : Integer

=cut

sub get_raw_qEnd {
  my $self = shift;
  return $self->{'record'}[12];
}

=head2 get_qEnd

    Description: Getter - wrapper around get_raw_qEnd 
    Returntype : Integer

=cut

sub get_qEnd {
  my $self = shift;
  return $self->get_raw_qEnd; 
}

=head2 get_raw_tName

    Description: Getter for tName field (Target sequence name, e.g. chromosome name)
    Returntype : String

=cut

sub get_raw_tName {
  my $self = shift;
  return $self->{'record'}[13];
}

=head2 get_tName

    Description: Getter - wrapper around get_raw_tName 
    Returntype : String

=cut

sub get_tName {
  my $self = shift;
  (my $chr = $self->get_raw_tName()) =~ s/^chr//;
  return $chr;
}

=head2 get_raw_tSize

    Description: Getter for tSize field (Target sequence size)
    Returntype : Integer

=cut

sub get_raw_tSize {
  my $self = shift;
  return $self->{'record'}[14];
}

=head2 get_tSize

    Description: Getter - wrapper around get_raw_tSize 
    Returntype : Integer

=cut

sub get_tSize {
  my $self = shift;
  return $self->get_raw_tSize; 
}

=head2 get_raw_tStart

    Description: Getter for tStart field (Alignment start position in query)
    Returntype : Integer

=cut

sub get_raw_tStart {
  my $self = shift;
  return $self->{'record'}[15];
}

=head2 get_tStart

    Description: Getter - wrapper around get_raw_tStart 
    Returntype : Integer

=cut

sub get_tStart {
  my $self = shift;
  return $self->get_raw_tStart+1; 
}

=head2 get_raw_tEnd

    Description: Getter for tEnd field (Alignment end position in query)
    Returntype : Integer

=cut

sub get_raw_tEnd {
  my $self = shift;
  return $self->{'record'}[16];
}

=head2 get_tEnd

    Description: Getter - wrapper around get_raw_tEnd
    Returntype : Integer

=cut

sub get_tEnd {
  my $self = shift;
  return $self->get_raw_tEnd; 
}

=head2 get_raw_blockCount

    Description: Getter for blockCount field (Number of blocks in the alignment)
    Returntype : Integer

=cut

sub get_raw_blockCount {
  my $self = shift;
  return $self->{'record'}[17];
}

=head2 get_blockCount

    Description: Getter - wrapper around get_raw_blockCount 
    Returntype : Integer

=cut

sub get_blockCount {
  my $self = shift;
  return $self->get_raw_blockCount; 
}

=head2 get_raw_blockSizes

    Description: Getter for blockSizes field (Comma-separated list of sizes of each block)
    Returntype : String

=cut

sub get_raw_blockSizes {
  my $self = shift;
  return $self->{'record'}[18];
}

=head2 get_blockSizes

    Description: Getter - wrapper around get_raw_blockSizes 
    Returntype : Arrayref

=cut

sub get_blockSizes {
  my $self = shift;
  my @sizes = split(',', $self->get_raw_blockSizes); 
  return \@sizes;
}

=head2 get_raw_qStarts

    Description: Getter for qStarts field (Comma-separated list of start 
                  position of each block in query)
    Returntype : String

=cut

sub get_raw_qStarts {
  my $self = shift;
  return $self->{'record'}[19];
}

=head2 get_qStarts

    Description: Getter - wrapper around get_raw_qStarts 
    Returntype : Arrayref

=cut

sub get_qStarts {
  my $self = shift;
  my @starts = split(',', $self->get_raw_qStarts); 
  return \@starts;
}

=head2 get_raw_tStarts

    Description: Getter for tStarts field (Comma-separated list of start 
                  position of each block in target)
    Returntype : String

=cut

sub get_raw_tStarts {
  my $self = shift;
  return $self->{'record'}[20];
}

=head2 get_tStarts

    Description: Getter - wrapper around get_raw_tStarts
    Returntype : Arrayref

=cut

sub get_tStarts {
  my $self = shift;
  my @starts = split(',', $self->get_raw_tStarts); 
  return \@starts;
}


1;
