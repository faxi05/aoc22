

<cfscript>
    elveCounter = 1;
    elveCalories = 0;
    elveArray = arrayNew(1);

    elveWithMostCalories = 0;
    maxElveCalories = 0;

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");
    writeOutput("Starting with elve ##1<br />");
    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        writeOutput(chars); 
        elveCalories = elveCalories + val(chars);
        if (chars == "") {
            elveArray.append( elveCalories );
            writeOutput("Total calories: #elveCalories#.<br />");    

            if (elveCalories > maxElveCalories) {
                maxElveCalories = elveCalories;
                elveWithMostCalories = elveCounter;
                writeOutput("New leader: Elve ## #elveWithMostCalories# with #maxElveCalories#<br />");
            }

            elveCounter ++;
            elveCalories = 0;
            writeOutput("<br />Now processing elve #elveCounter#:");    
        }
        writeOutput("<br/>");
    }

    writeOutput("<p>Final result: Elve ## #elveWithMostCalories# carries #maxElveCalories#.</p>");
    writeOutput("<p>#elveCounter# elves.</p>");

    arraySort(elveArray, "numeric", "desc");
    writeOutput("<br />Top 3 elves: #elveArray[1]+elveArray[2]+elveArray[3]# calories");

    writeOutput("</pre>");
</cfscript>