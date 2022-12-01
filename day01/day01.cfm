

<cfscript>
    elveCounter = 1;
    elveCalories = 0;

    elveWithMostCalories = 0;
    maxElveCalories = 0;

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");
    writeOutput("Starting with elve ##1<br />");
    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        writeOutput(chars); 
        elveCalories = elveCalories + val(chars);
        if (chars == "") {
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
    writeOutput("</pre>");
</cfscript>