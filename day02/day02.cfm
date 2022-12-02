<cfscript>
    totalscore = 0;

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");

    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        writeOutput("Elve move: #Left(chars, 1)# vs. #right(chars, 1)#");

        elveMove = left(chars, 1);
        myMove = right(chars, 1);
        roundMove = elveMove & myMove;
    
        switch (myMove) {
            case 'X': //Rock A,X
                shapeScore = 1;
                break;
            case 'Y': //Paper B,Y
                shapeScore = 2;
                break;
            case 'Z': //Scissors C,Z
                shapeScore = 3;
                break;
            default:
            break;
        }

        switch (roundMove) {
            case 'AX': case 'BY': case 'CZ': //draw
                roundScore = 3;
                writeOutput("--> draw");
                break;
            case 'AZ': case 'CY': case 'BX': //lose
                roundScore = 0;
                writeOutput("--> lose");
                break;
            case 'CX': case 'BZ': case 'AY': //win
                roundScore = 6;
                writeOutput("--> win");
                break;
            default: //win
                writeOutput("<strong>#roundMove# ?</strong>");
                break;
        }

        writeOutput("--> roundscore: #shapeScore+roundScore#<br />");

        totalscore = totalscore + shapeScore + roundScore;


        // Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock. If both players choose the same shape, the round instead ends in a draw.
        

    }

    writeOutput("<br />Total score: #totalscore#</pre>");
</cfscript>