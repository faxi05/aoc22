<cfscript>
    totalscore = 0;
    counter = 0;

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");

    writeOutput("a...z --> #asc('a')#...#asc('z')#<br />"); // 1-26 97-122
    writeOutput("A...Z --> #asc('A')#...#asc('Z')#<br /><br />"); // 27-52 65-90
    
    rucksack = arrayNew(1);
    elveCounter = 0;
    groupCounter = 0;
    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        counter++;
        elveCounter++;

        rucksack[ elveCounter ] = chars;

        if (elveCounter == 3) {
            groupCounter++;
            writeOutput("#groupCounter#: #rucksack[1]# - #rucksack[2]# - #rucksack[3]# --> ");

            shared = findCommonItem( rucksack );
            writeOutput( " teilen #shared#" );
            writeOutput("<br />");    
            
            if (asc(shared) > 96) {
                priority = asc(shared)-96;
            } else {
                priority = asc(shared)-38;
            }
    
            totalscore = totalscore + priority;
            elveCounter = 0;
        } 
    }
    writeOutput("<br />Total score: #totalscore#</pre>");

    
    string function findCommonItem( array rucksack) {
        var treffer = "";
        
        x = 1;
        while(x GT 0) {
            x = findOneOf(rucksack[1], rucksack[2], x);
            if (x > 0) {
                treffer = treffer & mid(rucksack[2], x, 1);
                x++;
            }
        }

        var treffer2 = "";
        z = 1;
        while(z GT 0) {
            z = findOneOf(treffer, rucksack[3], z);
            if (z>0) {
                treffer2 = treffer2 & mid(rucksack[3], z, 1);
                z++;
            }
        }

        return left(treffer2, 1);
    }
</cfscript>