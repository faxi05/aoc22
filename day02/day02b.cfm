<cfscript>
    totalscore = 0;

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");

    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        writeOutput("Elve move: #Left(chars, 1)# vs. #right(chars, 1)#");

        elveMove = left(chars, 1);
        myMove = right(chars, 1);
        roundMove = elveMove & myMove;
    
        // X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. 
        switch (roundMove) {
            case 'AX': case 'BX': case 'CX': // need to lose
                roundScore = 0;
                switch (elveMove) {
                    case 'A': //rock
                        neededMove = 'C';
                        break;
                    case 'B': //paper
                        neededMove = 'A';
                        break;
                    case 'C': //scissors
                        neededMove = 'B';
                    break;
                }
                break;
            
            case 'AY': case 'BY': case 'CY': // need a draw
                roundScore = 3;
                neededMove = elveMove;
                break;

            case 'AZ': case 'BZ': case 'CZ': // need to win
                roundScore = 6;
                switch (elveMove) {
                    case 'A': //rock
                        neededMove = 'B';
                        break;
                    case 'B': //paper
                        neededMove = 'C';
                        break;
                    case 'C': //scissors
                        neededMove = 'A';
                    break;
                }
                break;
    

            default: //win
                writeOutput("<strong>#roundMove# ?</strong>");
                break;
        }

        switch (neededMove) {
            case 'A': //Rock A,X
                shapeScore = 1;
                break;
            case 'B': //Paper B,Y
                shapeScore = 2;
                break;
            case 'C': //Scissors C,Z
                shapeScore = 3;
                break;
            default:
            break;
        }

        writeOutput("--> roundscore: #shapeScore+roundScore#<br />");

        totalscore = totalscore + shapeScore + roundScore;

        // Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock. If both players choose the same shape, the round instead ends in a draw.
        
    }
    writeOutput("<br /><br />Total score: #totalscore#</pre>");
</cfscript>