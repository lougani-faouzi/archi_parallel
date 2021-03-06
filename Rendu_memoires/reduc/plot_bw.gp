set term png size 1900,1000 enhanced font "Terminal,10"

set grid

set auto x

set key left top

set title "Intel(R) Core(TM) i5-2520M Zen+ bandwidth (in GiB/s) for a Load benchmark on a single array"

set xlabel "Benchmark variants"
set ylabel "Bandwidth in Bytes Per Cycle (higher is better)

set style data histogram
set style fill solid border -1
set boxwidth 0.9

set xtic rotate by -45 scale 0

set multiplot layout 2, 2 rowsfirst

set yrange [0:150]

set title "L1 cache"
plot "reduc_L1.dat" u 2:xtic(1) t "Intel(R) Core(TM) i5-2520M"

set title "L2 cache"
plot "reduc_L2.dat" u 2:xtic(1) t "Intel(R) Core(TM) i5-2520M"

set title "L3 cache"
plot "reduc_L3.dat" u 2:xtic(1) t "Intel(R) Core(TM) i5-2520M"

set title "DRAM"
plot "reduc_DRAM.dat" u 2:xtic(1) t "Intel(R) Core(TM) i5-2520M"

unset multiplot
