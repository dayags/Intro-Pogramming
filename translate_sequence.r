# Script: translate_sequence.r
# Problem description: read in sequence from file, compute stats, translate RNA into
# 	       amino acid sequence

#read sequence file into a variable
rna_sequence=read.table("assignment2_sequence.txt",sep="\t")
rna_sequence

#read 5 lines of the sequence into a string. Use this string for the rest of the code below.
r_sequence = paste(readLines("assignment2_sequence.txt", 5), sep="", collapse="")
r_sequence

#print the length of the sequence
nchar(r_sequence)

#get the coding part of the sequence (61st bp-->end) and store in variable called sequence
sequence=substr(r_sequence, 61, nchar(r_sequence))
sequence
#Fill in the loop below so that each codon is translated into the corresponding
#amino acid.  Append each codon to the end of the variable aasequence so that
#at the end of the loop, the variable aasequence contains the complete sequence
#of amino acids

aasequence = ""

index=1
while(index < nchar(sequence)) {

    # HINT: index contains the starting index of the current codon

    # get a substring corresponding to the next codon (3 bp)
   codon<-substr(sequence, index, index+2)
codon
    # Translate the codon into the corresponding amino acid.
   
    # Include the start and stop translations from the reference table.
  
  
   {
     if(codon == "AUG") {
        j= "Start"
     }
     else if(codon == "UUC") {
       j = "Phe"
     }
     else if(codon == "CUU") {
       j = "Leu"
     }else if(codon == "CCA") {
       j = "Pro"
     }else if(codon == "ACC") {
       j = "Thr"
     }else if(codon == "GAU") {
       j = "Asp"
     }
     else if(codon == "CGA") {
       j = "Arg"
     }
     else if(codon == "UGA") {
       j = "Stop"
     }
     aa<-sub(codon, codon, j)
   } 
   
    # Here's a reference table for the codons that appear in this sequence


    # concatenate the current codon onto the end of the aasequence variable

aasequence<-paste(aasequence,aa,sep="")
    index = index + 3  #this moves the index forward 3 places in the sequence
  }
   aasequence

#print the amino acid sequence to the output file "aaoutput.txt". Hint: ?cat
   sink("outfile.txt")<--cat(aasequence)
   sink()
