Simple XLS
----------

This gem builds HTML tables which makes easy import data into Excel, OpenOffice and others applications of this nature. The HTML can also be used to respond to web requests as well.

Example
-------

    xls = SimpleXLS.new ['header1','header2','header3']

    xls.push [1,2,3]
    xls.push [4,5]
    xls.push [6,7,8]

    File.open('output.xls', 'w+') { |f|
      f.puts xls
    }