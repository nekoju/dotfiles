# filters sections from master class spreadsheet
# usage: filterSections roster.txt master.csv >out.csv
function filterSections
    awk 'BEGIN {FPAT = "([^,]+)|(\"[^\"]+\")"} \
    FNR == NR { seen[$1]; next } FNR <= 2 || $3 in seen' "$argv[1]" "$argv[2]"
end 
