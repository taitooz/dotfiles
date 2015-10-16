for i in {1..100}; do convert -background lightblue -fill blue -size 100x100 -pointsize 24 -gravity center label:$i $i.jpg; done
