<cfscript>

    stacks = arrayNew();
    stacks[1] = "F,C,P,G,Q,R";
    stacks[2] = "W,T,C,P";
    stacks[3] = "B,H,P,M,C";
    stacks[4] = "L,T,Q,S,M,P,R";
    stacks[5] = "P,H,J,Z,V,G,N";
    stacks[6] = "D,P,J";
    stacks[7] = "L,G,P,Z,F,J,T,R";
    stacks[8] = "N,L,H,C,F,P,T,J";
    stacks[9] = "G,V,Z,Q,H,T,C,W";
    
    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");
    
    counter = 0;
    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        counter++;

        // move,2,from,2,to,8
        move = listGetAt(chars, 2, " ");
        from = listGetAt(chars, 4, " ");
        to = listGetAt(chars, 6, " ");
        writeOutput("#counter# #chars# -- #move# - #from# - #to#<br />");

        if (move == 1) {
            for (i = 1; i <= move; i++) {
                stacks[to] = listAppend( stacks[to], listLast( stacks[from] ));
                stacks[from] = listDeleteAt( stacks[from], listLen(stacks[from]));
            }
        } else {

            for (i = move; i >= 1; i--) {
                stacks[to] = listAppend( stacks[to], listGetAt( stacks[from], (listlen(stacks[from])-(i-1)) ) )
            }
            for (i = 1; i <= move; i++) {
                stacks[from] = listDeleteAt( stacks[from], listLen(stacks[from]));
            }
        }
    }
    
    writeOutput("<br />");
    for (i = 1; i <= 9; i++) {
        writeOutput( listLast(stacks[i]));
    }
    writeOutput("<br /></pre>");
</cfscript>