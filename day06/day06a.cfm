<cfscript>
    totalscore = 0;
    distinctChars = 14; // setting this to 4 solves the first part

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");

    cfloop(file=filePath, index="chars", charset="UTF-8"){ 

        for (i = 1; i <= len(chars)-distinctChars; i++) {
            buffer = "";
            
            for (x = i; x <= distinctChars-1+i; x++) {
                buffer = listAppend(buffer, mid(chars, x, 1));
            }
            writeOutput("<br />#i# #buffer# --> ");
            

            if (buffer == listRemoveDuplicates(buffer)) {
                totalscore = i+distinctChars-1;
                writeOutput("no dupes after #totalscore#!");
                break;
            }

        }

    }

    writeOutput("<br />Total score: #totalscore#</pre>");
</cfscript>