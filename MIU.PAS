{               M-I-U  A FORMAL INTRODUCTION TO FORMAL SYSTEMS              }
{               ----------------------------------------------              }

{                    BY: EHUD LAMM OF SWIFT PROGRAMING                      }
{ MIU IS A FORMAL SYSTEM , MEANING THAT EVERY STRING ("WORD") THAT IS USED IN
  THE SYSTEM IS EITHER AN AXIOM OR A STRING PRODUCED FROM AXIOMS USING FORMAL
  INFRENCE RULES.

  DESCRIPTION:
  ------------
              LETTERS USED: M , I , U.
                            AXIOM: MI.
              RULES OF INFRENCE:
              ------------------
                                1) IF xI IS A STRING SO IS xIU.
                                2) IF Mx IS A STRING SO IS Mxx.
                                3) IN ANY STRING III CAN BE REPLACED BY U.
                                4) UU CAN BE DROPPED FROM ANY STRING.
}



{ THIS PROGRAM CAN BE USED TO HELP LEARN MIU!
  YOU CAN YOU USE THE PROGRAM IN TWO MODES:
      1) AS A CHECKING TOOL: WRITE TO STRINGS AND THE COMPUTER WILL TELL YOU
      IF ONE CAN BE PRODUCED FROM THE OTHER BY THE RULES.
      2) WRITE A STRING AND A RULE NUMBER AND THE COMPUTER WILL GIVE THE
      STRING THAT WILL BE THE OUTCOME OF ISSUING THAT RULE ON THAT STRING.
}
{$IFDEF FPC}
   {$MODE TP}
{$ENDIF}

PROGRAM MIT;

        USES CRT;

LABEL L;

VAR
   SEL:CHAR;
   LSP:STRING;

PROCEDURE HELP;
BEGIN
     WINDOW(1,1,80,25);
     CLRSCR;
     HIGHVIDEO;
     WRITELN('                            FORMAL TUTOR HELP SYSTEM');
     NORMVIDEO;
     WINDOW(1,2,80,25);
     WRITELN('WHAT IS A FORMAL SYSTEM,AND WHY F"S ARE USED?');
     WRITELN('---------------------------------------------');
     WRITELN('SCIENCE , MATH AND LOGIC HAVE PRBLEMS USING NATURAL LANGUAGES,BECAUSE THESE ');
     WRITELN('LANGUAGES TEND TO BE TO FREE,AND LET SENTENCES HAVE DOUBLE MEANINGS AND THAT THE ');
     WRITELN('CORRECT MEANIG IS DETERMINED BY THE LISTENER. IN LOGIC,FOR INSTANCE, WE NEED A ');
     WRITELN('LANGUAGE THAT EVERY SENTENCE EXPERSSIBLE IN IT COULD BE UNDERSTOOD IN ONLY ONE');
     WRITELN('WAY.');
     WRITELN('FOR THIS PURPUSE FORMAL SYSTEMS WERE INVENTED,IN A FORMAL SYSTEM EVERY STRING');
     WRITELN('(SENTENCE) IS DERIVED FROM AXIOMS USING FORMAL RULES (AS WILL BE EXPLAIND LATER)');
     WRITELN('SO THAT A FORMAL SYSTEM CAN BE INVENTED THAT WILL ONLY HAVE TRUE SENTENCES AS');
     WRITELN('STRINGS!');
     REPEAT UNTIL READKEY<>'';
     CLRSCR;
     WRITELN('HOW STRINGS ARE DERIVED IN FORMAL SYSTEMS?');
     WRITELN('------------------------------------------');
     WRITELN('ANY FORMAL SYSTEM IS COMPOSED OF ONE OR MORE INFRENCE RULES AND USUALY ONE OR ');
     WRITELN('MORE AXIOMS. TO MAKE STRINGS WE START WITH THE AXIOM AND APPLY THE RULES TO IT');
     WRITELN(',FOR INSTANCE IN MIU THE AXIOM IS MI IF WE USE RULE 2 ON IT (Mx -> Mxx) WE GET');
     WRITELN('MII,FROM NOW ON MII IS ALSO A STRING IN THE SYSTEM SO WE CAN USE THE RULES ON IT');
     WRITELN(',FOR INSTANCE RULE 1 (xI -> xIU) AND GET MIIU , AND SO ON.');
     WRITELN('THESE STRINGS (MI,MII,MMIU) ARE ALL "STRINGS OF THE SYSTEM" OR IN ANOTHER TERM');
     WRITELN('THEOREMS.');
     WRITELN('BY THE WAY NOT EVERY COMBINATION OF THE SYMBOLS IS A THEOREM (TRY PRODUCING MU)');
     READLN;
     CLRSCR;
     WRITELN('HOW STRINGS COME TO LIFE IN FORMAL SYSTEMS?');
     WRITELN('-------------------------------------------');
     WRITELN('STRINGS COME TO LIFE? WELL SORT OF, THE WAY F"SS TREAT STRINGS IS BY');
     WRITELN('MANIPULATING SYMBOLS,WITHOUT CONCERN OF MEANIG.IN A LOT OF F"SS SYMBOLS DO HAVE');
     WRITELN('MEANIGS (NOT IN MIU,SORRY), SO THAT ANY STRING CAN BE TRANSLATED INTO AN ENGLISH');
     WRITELN('SENTENCE.');
     WRITELN;
     WRITELN('EXAMPLES OF FORMAL SYSTEMS:');
     WRITELN('---------------------------');
     WRITELN('THE EXAMPLES ARE "STOLEN" FROM A BOOK.');
     WRITELN('1) P-Q , SYMBOLISES ADDITION (AXIOM: xP-Qx- IF x CONTAINS ONLY "-",RULE OF');
     WRITELN('INFERENCE: IF xPyQz IS A STRING xPy-Qz- IS A STRING TOO.).');
     WRITELN;
     WRITELN('2)T-Q , SYMBOLISES MULTIPLICATION (AXIOM xT-Qx IF x CONTAINS ONLY "-",RULE');
     WRITELN('OF INFERENCE: IF xTyQz IS A STRING THEN xTy-Qzx IF A STRING.).');
     WRITELN;
     WRITELN('3)PROPOSITIONAL CALCULUS - IS A FORMAL SYSTEM REPRESENTING LOGIC, TOO DIFFICULT');
     WRITELN('TO EXPLAIN HERE.BTW IT DOES NOT CONTAIN AXIOMS!');
     WRITELN;
     WRITELN('4)TYPOGRAPHICAL NUMBER THEORY - AGAIN TO DIFFICULT TO EXPLAIN IS A MATHAMATIC FS');
     READLN;

END;

FUNCTION UPCASES(X:STRING):STRING;
VAR
   T:BYTE;
BEGIN
     FOR T:=1 TO LENGTH(X) DO X[T]:=UPCASE(X[T]);
     UPCASES:=X;
END;

FUNCTION MIU(S:STRING):BOOLEAN;
VAR
   T:INTEGER;
BEGIN
     IF S[1]<>'M' THEN BEGIN MIU:=FALSE; EXIT; END;
     FOR T:=1 TO LENGTH(S) DO IF (S[T]<>'M') AND (S[T]<>'I') AND (S[T]<>'U') THEN BEGIN MIU:=FALSE; T:=LENGTH(S); END;
END;

PROCEDURE XtoY;
VAR
   S1,S2:STRING;
   INx:INTEGER;


FUNCTION RULE1:BOOLEAN;
VAR
   X:INTEGER;

BEGIN
     IF LENGTH(S1)+1=LENGTH(S2) THEN
      IF S1[LENGTH(S1)]='I' THEN
       IF S2[LENGTH(S2)]='U' THEN
        RULE1:=TRUE
        ELSE RULE1:=FALSE
      ELSE RULE1:=FALSE
     ELSE RULE1:=FALSE;

END;

FUNCTION RULE2:BOOLEAN;
VAR
   T:INTEGER;
   S:STRING;
BEGIN
     IF (LENGTH(S1)-1)*2<> LENGTH(S2)-1 THEN BEGIN RULE2:=FALSE; EXIT; END;
     S:=S1[2];
     FOR T:=3 TO LENGTH(S1) DO S:=S+S1[T];
     S:=S+S;
     S:='M'+S;
     IF S=S2 THEN RULE2:=TRUE ELSE RULE2:=FALSE;
END;

FUNCTION RULE3:BOOLEAN;
VAR
   T,T1:INTEGER;
   S:STRING;
BEGIN
     S:='                           ';
     RULE3:=FALSE;
     FOR T:=2 TO LENGTH(S1) DO
         IF (S1[T]='I') AND
            (S1[T+1]='I') AND
            (S1[T+2]='I') THEN  BEGIN
                                    S:='M';
                                    FOR T1:=2 TO T-1 DO S:=S+S1[T1];
                                    S:=S+'U';
                                    FOR T1:=T+3 TO LENGTH(S1) DO S:=S+S1[T1];
                                    IF S=S2 THEN RULE3:=TRUE;
                                END;
END;

FUNCTION RULE4:BOOLEAN;
VAR
   T,T1:INTEGER;
   S:STRING;
BEGIN
     RULE4:=FALSE;
     FOR T:=2 TO LENGTH(S1) DO
         IF (S1[T]='U') AND
            (S1[T+1]='U') THEN  BEGIN
                                     S:='M';
                                     FOR T1:=2 TO T-1 DO S:=S+S1[T1];
                                     FOR T1:=T+2 TO LENGTH(S1) DO S:=S+S1[T1];
                                     IF S=S2 THEN RULE4:=TRUE;
                                END;
END;

PROCEDURE XTOYINIT;
BEGIN
     CLRSCR;
     GOTOXY(1,1);
     HIGHVIDEO;
     WRITELN('             MIU (C) SWIFT PROGRAMING      CAN X BE PRDUCED FROM Y?');
     NORMVIDEO;
     WRITELN('WRITE "QUIT" TO QUIT!');
     WRITELN;WRITELN;
     WINDOW(1,5,80,25);
END;

BEGIN {OF XtoY}
     XTOYINIT;
     REPEAT
           IF S1='HELP' THEN XTOYINIT;
           WRITE('EXISTING STRING >');
           S1:='                         ';
           READLN(S1);
           S1:=UPCASES(S1);
           IF S1<>'QUIT' THEN
              IF S1<>'HELP' THEN
              BEGIN
                   WRITE('DERIVED STRING  >');
                   READLN(S2);
                   S2:=UPCASES(S2);
                   WRITELN('------------------------');
                   WRITELN;
                   IF (MIU(S1)) AND (MIU(S2)) THEN IF (RULE1) OR (RULE2) OR (RULE3) OR (RULE4) THEN WRITELN('Y E S')
                       ELSE WRITELN('N O!') ELSE WRITELN('NOT MIU STRINGS!');
                   WRITELN;

              END ELSE
              HELP;

     UNTIL S1='QUIT';
     WINDOW(1,1,80,25);
     CLRSCR;
     HIGHVIDEO;
     GOTOXY(20,10);
     WRITELN('THANK YOU FOR USING "FORMAL TUTOR",');
     WRITELN('      WE HOPE YOU WILL HAVE THE OPPERTUNITY TO USE OTHER SWIFT PROGRAMS.');

END;




PROCEDURE XbyY;
VAR
   S:STRING;
   RULE:CHAR;

PROCEDURE RULE1;
BEGIN
     IF S[LENGTH(S)]='I' THEN BEGIN
                                   WRITELN(S+'U');
                                   LSP:=S+'U';
                              END
                         ELSE WRITELN('CAN NOT APPLY RULE ONE TO A STRING NOT TERMINATING WITH AN "I"');
END;

PROCEDURE RULE2;
VAR
   T:INTEGER;
   S1:STRING;
BEGIN
     S1:='M';
     FOR T:=2 TO LENGTH(S) DO S1:=S1+S[T];
     FOR T:=2 TO LENGTH(S) DO S1:=S1+S[T];
     WRITELN(S1);
     LSP:=S1;
END;

PROCEDURE RULE3;
VAR
   T,T1:INTEGER;
   S1:STRING;
BEGIN
     S1:='                   ';
     FOR T:=2 TO LENGTH(S) DO
         IF (S[T]='I') AND
            (S[T+1]='I') AND
            (S[T+2]='I') THEN
                                BEGIN
                                    S1:='M';
                                    FOR T1:=2 TO T-1 DO S1:=S1+S[T1];
                                    S1:=S1+'U';
                                    FOR T1:=T+3 TO LENGTH(S) DO S1:=S1+S[T1];
                                    WRITELN(S1);
                                    LSP:=S1;
                                END;
END;

PROCEDURE RULE4;
VAR
   T,T1:INTEGER;
   S1:STRING;
BEGIN
     S1:='                                ';
     FOR T:=2 TO LENGTH(S) DO
         IF (S[T]='U') AND
            (S[T+1]='U') THEN  BEGIN
                                     S1:='M';
                                     FOR T1:=2 TO T-1 DO S1:=S1+S[T1];
                                     FOR T1:=T+2 TO LENGTH(S) DO S1:=S1+S[T1];
                                     WRITELN(S1);
                                     LSP:=S1;
                                END;
END;

PROCEDURE XBYINIT;
BEGIN
      WINDOW(1,1,80,25);
      CLRSCR;
      GOTOXY(1,1);
      HIGHVIDEO;
      WRITELN('      MIU (C) SWIFT PROGRAMING      WHAT WILL X BE AFTER RULE Y IS APPLIED?');
      NORMVIDEO;
      WRITELN('WRITE "QUIT" TO QUIT!');
      WRITELN('RULES:');
      WRITELN('      1) IF xI IS A STRING SO IS xIU.');
      WRITELN('      2) IF Mx IS A STRING SO IS Mxx.                WE CAN MAKE MI!');
      WRITELN('      3) IN ANY STRING III CAN BE REPLACED BY U.     ---------------');
      WRITELN('      4) UU CAN BE DROPPED FROM ANY STRING.');
      WRITELN('--------------------------------------------------------------------------------');
      WINDOW(1,9,80,25);
END;

BEGIN {OF XbyY}
      XBYINIT;
      REPEAT
            IF S='HELP' THEN XBYINIT;
            S:='                                        ';
            WRITE('STRING >');
            READLN(S);
            S:=UPCASES(S);
            IF S='LSP' THEN S:=LSP;
            IF S<>'QUIT' THEN
               IF S<>'HELP' THEN
                  IF NOT(MIU(S)) THEN WRITELN('NOT AN MIU STRING!') ELSE
                           BEGIN
                                WRITE('RULE   >');
                                READLN(RULE);
                                IF RULE='1' THEN RULE1 ELSE
                                  IF RULE='2' THEN RULE2 ELSE
                                     IF RULE='3' THEN RULE3 ELSE
                                       IF RULE='4' THEN RULE4 ELSE
                                         WRITELN('NOT A VALID RULE NUMBER (1-4)');

                           END ELSE
                  HELP;


      UNTIL S='QUIT';
      WINDOW(1,1,80,25);
      CLRSCR;
      HIGHVIDEO;
      GOTOXY(20,10);
      WRITELN('THANK YOU FOR USING "FORMAL TUTOR",');
      WRITELN('      WE HOPE YOU WILL HAVE THE OPPERTUNITY TO USE OTHER SWIFT PROGRAMS.');
END;

BEGIN
     CLRSCR;
     GOTOXY(1,1);
     HIGHVIDEO;
     WRITELN('               M-I-U  A FORMAL INTRODUCTION TO FORMAL SYSTEMS             ');
     WRITELN;
     WRITELN('                    BY: EHUD LAMM OF SWIFT PROGRAMING                     ');
     NORMVIDEO;
     WRITELN('MIU IS A FORMAL SYSTEM , MEANIG THAT EVERY STRING ("WORD") THAT IS USED IN');
     WRITELN('THE SYSTEM IS EITHER AN AXIOM OR A STRING PRODUCED FROM AXIOMS USING FORMAL');
     WRITELN('INFRENCE RULES.');
     WRITELN;
     HIGHVIDEO;
     WRITELN('DESCRIPTION:');
     WRITELN('------------');
     NORMVIDEO;
     WRITELN('LETTERS USED: M , I , U.');
     WRITELN('AXIOM: MI.');
     WRITELN('RULES OF INFRENCE:');
     WRITELN('------------------');
     WRITELN('                  1) IF xI IS A STRING SO IS xIU.');
     WRITELN('                  2) IF Mx IS A STRING SO IS Mxx.');
     WRITELN('                  3) IN ANY STRING III CAN BE REPLACED BY U.');
     WRITELN('                  4) UU CAN BE DROPPED FROM ANY STRING.');
     GOTOXY(80,25);REPEAT UNTIL READKEY<>#00;
     CLRSCR;
     GOTOXY(1,1);
     WRITELN('THIS PROGRAM CAN BE USED TO HELP LEARN MIU!');
     WRITELN('YOU CAN YOU USE THE PROGRAM IN TWO MODES:');
     WRITELN('  1) AS A CHECKING TOOL: WRITE TO STRINGS AND THE COMPUTER WILL TELL YOU');
     WRITELN('IF ONE CAN BE PRODUCED FROM THE OTHER BY THE RULES.');
     WRITELN('  2) WRITE A STRING AND A RULE NUMBER AND THE COMPUTER WILL GIVE THE');
     WRITELN('STRING THAT WILL BE THE OUTCOME OF ISSUING THAT RULE ON THAT STRING.');
L:   GOTOXY(1,25);
     WRITE('WHAT MODE DO YOU WANT TO USE?');
     SEL:=READKEY;
     IF SEL='1' THEN XtoY ELSE IF SEL='2' THEN XbyY ELSE GOTO L;
END.

