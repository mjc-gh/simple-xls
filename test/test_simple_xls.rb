require File.expand_path File.join(File.dirname(__FILE__), '..', 'lib', 'simple-xls')
require 'test/unit'

class SimpleXlsTest < Test::Unit::TestCase
  def test_initialize
    headers = ['a', 'b', 'c']
    xls = SimpleXLS.new(headers)
    
    assert_equal headers, xls.headers
  end
  
  def test_initialize_dups_headers
    headers = ['a', 'b', 'c']
    xls = SimpleXLS.new(headers)
    
    assert_not_same headers, xls.headers
  end
  
  def test_row_push
    xls = SimpleXLS.new(['a', 'b', 'c'])
    row = [1,2,3]
    
    xls.push(row)
    
    assert_equal row, xls.rows.first
  end
  
  def test_row_push_dups_row
    xls = SimpleXLS.new(['a', 'b', 'c'])
    row = [1,2,3]
    
    xls.push(row)
    
    assert_not_same row, xls.rows.first
  end
  
  def test_output
    xls = SimpleXLS.new(['a', 'b', 'c'])
    xls.push([1,2,3])
    
    output = xls.to_s
    
    assert output.include?('<table><thead>')
    assert output.include?('<th>a</th><th>b</th><th>c</th>')
    assert output.include?('<td>1</td><td>2</td><td>3</td>')
    assert output.include?('</tbody></table>')

    assert_equal 2, output.scan(/<tr>/).size
  end
end
