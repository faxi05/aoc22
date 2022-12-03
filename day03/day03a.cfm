<cfscript>
    totalscore = 0;
    counter = 0;

    filePath = expandPath("./puzzle-input.txt"); 
    writeOutput("<pre>");

    writeOutput("a...z --> #asc('a')#...#asc('z')#<br />"); // 1-26 97-122
    writeOutput("A...Z --> #asc('A')#...#asc('Z')#<br /><br />"); // 27-52 65-90
    
    cfloop(file=filePath, index="chars", charset="UTF-8"){ 
        counter++;
        rucksack1 = left(chars, len(chars)\2);
        rucksack2 = right(chars, len(chars)\2);
        shared = mid(rucksack2, findOneOf(rucksack1, rucksack2), 1);

        if (asc(shared) > 96) {
            priority = asc(shared)-96;
        } else {
            priority = asc(shared)-38;
        }

        totalscore = totalscore + priority;

        writeOutput("#counter#: ");
        writeOutput("#mid(rucksack2, findOneOf(rucksack1, rucksack2), 1)#  -->"  );
        writeOutput("#asc(shared)# --> #priority#");
        writeOutput("<br />");
    }
    writeOutput("<br />Total score: #totalscore#</pre>");
</cfscript>