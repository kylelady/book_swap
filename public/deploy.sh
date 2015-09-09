cd /home/mikehand/book_swap/public
wget --no-check-certificate -O  inventory.csv https://doraemon.eecs.umich.edu/bookswap/export/csv.csv?api=34c3770a9a2d85acef079d195f67fededee8aca1740ec77145d956b4d9c2b13fd4ff69f1b1b10df7ffec7efdbbb24784bd3f12b112337d2721421c7c18396471
python ./LoadInventory.py
cp -r ./webcontent/*  /var/www/dramaticchipmunk/bookswap
