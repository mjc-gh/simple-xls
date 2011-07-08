h1. Simple XLS

This gem basically builds HTML tables thus allowing you to easily import data into Excel and the like.

Example:

xls = SimpleXLS.new ['header1','header2','header3']

xls.push [1,2,3]
xls.push [4,5]
xls.push [6,7,8]

File.open('output.xls', 'w+') { |f|
  f.puts xls
}