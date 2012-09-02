from datetime import datetime 
import csv
inventory_path="inventory.csv"
today=datetime.today()
selling_close=datetime(today.year,9,5,5,30 )
if(today>selling_close):
	print "Price View Authorized"
gen_html_path="BookswapInventory.html"
gen_html=open(gen_html_path,'w')
gen_html.write(r'''<!doctype html>
<html lang="en">

<!--Meta information-->
<head>
<meta charset=utf-8>
<title>Tau Beta Pi Bookswap</title>
<link rel="stylesheet" href="http://www.w3.org/StyleSheets/Core/Ultramarine" type="text/css">
<link rel="stylesheet" href="bookswap.css" type="text/css">
<meta name=description value="Tau Beta Pi hosts a bookswap during the first week of class each semester. Students can buy and sell books for their engineering and prerequisite courses">
<meta name=keywords value="book, textbook, tbp, bookswap, engineering">

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="sorttable.js"></script>
<script type="text/javascript">
var pagename="Inventory";
</script>
</head>

<!--Main Content-->
<body>

<script type="text/javascript" src="includes/header.js"></script>

<article>
<h1>Current Inventory</h1>''')
if(today<=selling_close):
	gen_html.write(r'''<p>Please note that until reception of books is closed, no price information will be visible.</p>''')

gen_html.write(r'''<p>Click on column headers to sort the table by that column</p>
<table class="sortable">''')

if(today>selling_close):
	gen_html.write(r'''<tr>
<th>Course</th>
<th>Book Title</th>
<th>Author</th>
<th>Publisher</th>
<th>Edition</th>
<th>ISBN</th>
<th>Price</th>
</tr>''')
else:
	gen_html.write(r'''<tr>
<th>Course</th>
<th>Book Title</th>
<th>Author</th>
<th>Publisher</th>
<th>Edition</th>
<th>ISBN</th>
</tr>''')

inventory_reader = csv.reader(open(inventory_path,'r'), delimiter=',')
inventory_reader.next()
for row in inventory_reader:
	gen_html.write(r'''<tr><td>%(Course)s</td>
<td>%(Title)s</td>
<td>%(Author)s</td>
<td>%(Publisher)s</td>
<td>%(Edition)s</td>
<td>%(ISBN)s</td>'''%{"Course":row[0],"Title":row[1],"Author":row[2],"Publisher":row[3],"Edition":row[4],"ISBN":row[5]})
	if(today>selling_close):
		gen_html.write(r'''<td>%s</td>'''%(row[6]))
	gen_html.write("</tr>")




gen_html.write(r'''
</table>


</article>
<script type="text/javascript" src="includes/sidebar.js"></script>
<footer></footer>
</body>
</html>''')
