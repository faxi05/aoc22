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

        // 39-98,38-47
        // 98-99,3-97---> first contains second
        if ( (listGetAt(elve1, 1, "-") GTE listGetAt(elve2, 1, "-")) and (listGetAt(elve1, 2, "-") LTE listGetAt(elve2, 2, "-")) ) {
            contained = 1;
            writeOutput("---> second contains first");
        } 

        if ( (listGetAt(elve2, 1, "-") GTE listGetAt(elve1, 1, "-")) and (listGetAt(elve2, 2, "-") LTE listGetAt(elve1, 2, "-")) ) {
            contained = 1;
            writeOutput("---> first contains second");
            
        } 

        if (contained) totalscore++;
    }
    writeOutput("<br />Total score: #totalscore#</pre>");
</cfscript>