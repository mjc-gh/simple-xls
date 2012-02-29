# Simple XLS


This gem builds HTML tables which makes easy import data into Excel, OpenOffice and others applications of this nature. The HTML can also be used to respond to web requests as well.

## Example

    xls = SimpleXLS.new ['header1','header2','header3']
	
    xls.push [1,2,3]
    xls.push [4,5]
    xls.push [6,7,8]

    File.open('output.xls', 'w+') { |f| f.puts xls }
	
### Add Collection 

    xls = SimpleXLS.new ['a','b','c']
	
	xls.add([[1,2,3], [4,5,6]])
	xls.add([ { :a => 1, :b => 2, :c => 3}, { :a => 4, :b => 5, :c => 6}])
	
The `add` method will accept an array of arrays or an array of hashes. When hashes are used, it will attempt to extract the values from the `Hash` using the header values as keys (first trying as a `String` then again as a `Symbol`). Since the headers are enumerated, order is preseved.