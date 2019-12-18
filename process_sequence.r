#This program demonstrates how to read in a FASTA file and do some simple
#processing of the sequence
#
#A fasta file is a plain text file containing sequences
#a line begining with a ">"indicates a label
#all other lines below this one (that do not start with ">") is the sequence
#for that label
#
#

fileName = "seq.fasta"  #Change this to use your own file.

fileContents = read.table(fileName, sep="\t", header=T, stringsAsFactors=F, check.names=F)

sequence = paste(fileContents[[1]], sep="", collapse="")

cat ("Loaded sequence", names(fileContents),"\n")
cat ("Sequence:\n", sequence, "\n")

compSequence = chartr("ATCG", "TAGC", sequence)


cat ("The complement sequence is:\n", compSequence, "\n\n")

#split the string into an array of characters
sequenceVector = strsplit(compSequence, NULL)[[1]]
    
aCount = 0;
cCount = 0;
gCount = 0;
tCount = 0;
sequenceLength = 0;
for(base in sequenceVector)
{
	if(base == "A") {
		aCount = aCount+1
	}
	else if(base == "C") {
		cCount = cCount+1
	}
	else if(base == "G") {
		gCount = gCount+1
	}
	else if(base == "T") {
		tCount = tCount+1
	}
	sequenceLength = sequenceLength + 1
}
cat ("Sequence statistics:\n")
cat ("Fraction of A's : ",aCount/sequenceLength,"\n")
cat ("Fraction of T's : ",tCount/sequenceLength,"\n")
cat ("Fraction of G's : ",gCount/sequenceLength,"\n")
cat ("Fraction of C's : ",cCount/sequenceLength,"\n")
cat ("------------------------------\n")

