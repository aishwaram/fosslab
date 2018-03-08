pdftotext a.pdf s1.txt -layout
pdftotext b.pdf s2.txt -layout
grep -A 1 "MDL16CS" s1.txt > s1cs.txt
grep -A 1 "MDL16CS" s2.txt > s2cs.txt
sed -i 's/MA101(/  /g' s1cs.txt
sed -i 's/PH100(/ /g' s1cs.txt
sed -i 's/BE110(/ /g' s1cs.txt
sed -i 's/BE10105(/ /g' s1cs.txt
sed -i 's/BE103(/ /g' s1cs.txt
sed -i 's/EE100(/ /g' s1cs.txt
sed -i 's/PH110(/ /g' s1cs.txt
sed -i 's/EE110(/ /g' s1cs.txt
sed -i 's/CS110(/ /g' s1cs.txt
tr -d '\040\011\012\015\014' <s1cs.txt > s1_cs.txt
sed -i 's/MDL/\nMDL/g' s1_cs.txt
sed -i 's/O)/ 10/g' s1_cs.txt
sed -i 's/A+)/ 9/g' s1_cs.txt
sed -i 's/A)/ 8.5/g' s1_cs.txt
sed -i 's/B+)/ 8/g' s1_cs.txt
sed -i 's/B)/ 7/g' s1_cs.txt
sed -i 's/C)/ 6/g' s1_cs.txt
sed -i 's/P)/ 5/g' s1_cs.txt
sed -i 's/F)/ 0/g' s1_cs.txt
sed -i 's/--/ /g' s1_cs.txt
sed -i 's/\,/ /g' s1_cs.txt
awk '{printf($1" "($2 * 4 + $3 * 4 + $4 * 3 + $5 * 3 + $6 * 3 + $7 * 3 + $8 * 1 + $9 * 1 + $10 * 1)/23)}' s1_cs.txt > s1sg.txt
sed -i 's/MDL/\nMDL/g' s1sg.txt
sed -i 's/CY100(/  /g' s2cs.txt
sed -i 's/BE100(/ /g' s2cs.txt
sed -i 's/EC100(/ /g' s2cs.txt
sed -i 's/CY110(/ /g' s2cs.txt
sed -i 's/EC110(/ /g' s2cs.txt
sed -i 's/MA102(/ /g' s2cs.txt
sed -i 's/BE102(/ /g' s2cs.txt
sed -i 's/CS100(/ /g' s2cs.txt
sed -i 's/CS120(/ /g' s2cs.txt
tr -d '\040\011\012\015\014' <s2cs.txt > s2_cs.txt
sed -i 's/MDL/\nMDL/g' s2_cs.txt
sed -i 's/O)/ 10/g' s2_cs.txt
sed -i 's/A+)/ 9/g' s2_cs.txt
sed -i 's/A)/ 8.5/g' s2_cs.txt
sed -i 's/B+)/ 8/g' s2_cs.txt
sed -i 's/B)/ 7/g' s2_cs.txt
sed -i 's/C)/ 6/g' s2_cs.txt
sed -i 's/P)/ 5/g' s2_cs.txt
sed -i 's/F)/ 0/g' s2_cs.txt
sed -i 's/--/ /g' s2_cs.txt
sed -i 's/\,/ /g' s2_cs.txt
awk '{printf($1" "($2 * 4 + $3 * 4 + $4 * 3 + $5 * 1 + $6 * 1 + $7 * 4 + $8 * 3 + $9 * 3 + $10 * 1)/24)}' s2_cs.txt > s2sg.txt
sed -i 's/MDL/\nMDL/g' s2sg.txt
join s1sg.txt s2sg.txt > sgpa.txt
sed -i 's/MDL/\nMDL/g' sgpa.txt
grep 'MDL16CS' sgpa.txt > sgpa8.txt
awk '{printf($1" "($2 * 23 + $3 * 24)/47)}' sgpa8.txt >sgpa1.txt
sed -i 's/MDL/\nMDL/g' sgpa1.txt
cut -f4,5 name.txt > csb.txt
grep 'MDL16CS' csb.txt > csb2.txt
awk '{printf("\n"$1" "$2" "$3":")}' csb2.txt >csb3.txt
join csb3.txt sgpa1.txt > cgpa.txt
column -t -s $':' cgpa.txt > cgpa2.txt

