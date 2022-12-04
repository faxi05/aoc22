<cfscript>
    totalscore = 0;
    counter = 0;

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");

    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        counter++;
        contained = 0;
        elve1 = listGetAt(chars, 1, ",");
        elve2 = listGetAt(chars, 2, ",");

        writeOutput("<br />#counter#: #chars#");

        lstElve1 = "";
        for (i = listGetAt(elve1, 1, "-"); i <= listGetAt(elve1, 2, "-"); i++) {
            lstElve1 = listAppend(lstElve1, "#i#");            
        }

        lstElve2 = "";
        for (i = listGetAt(elve2, 1, "-"); i <= listGetAt(elve2, 2, "-"); i++) {
            lstElve2=listAppend(lstElve2, i);
        }

        if (listlen(lstElve1) GTE listlen(lstElve2)) {
            lstOne = lstElve1;
            lstTwo = lstElve2;
        } else {
            lstOne = lstElve2;
            lstTwo = lstElve1;
        }

        lstOne.each(function(element, index) { 
            if (listFind(lstTwo, element, ",")) {
                contained = 1;
            }
        }, ",");
        

        if (contained) {
            totalscore++;
            writeOutput(" (overlaps)");
        }
    }
    writeOutput("<br />Total score: #totalscore#</pre>");
</cfscript>