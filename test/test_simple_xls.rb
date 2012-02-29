require 'simplexls'
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
  
  def test_row_push_alias
     xls = SimpleXLS.new(['a','b','c'])
    
     assert_equal xls.method(:push), xls.method(:<<)
  end
  
  def test_evens_out_row
    xls = SimpleXLS.new(['a','b','c'])
    row = [1,2]
    
    xls.push(row)
    
    assert_equal 3, xls.rows.first.size
    assert_equal [1,2,nil], xls.rows.first
  end
  
  def test_row_push_dups_row
    xls = SimpleXLS.new(['a', 'b', 'c'])
    row = [1,2,3]
    
    xls.push(row)
    
    assert_not_same row, xls.rows.first
  end
  
  def test_add_collection
    xls = SimpleXLS.new(['a', 'b', 'c'])
    rows = [[1,2,3], [4,5,6]]
    
    xls.add(rows)
    
    assert_equal rows.first, xls.rows.first
    assert_equal rows.last, xls.rows.last
  end
  
  def test_add_collection_with_hash
    xls = SimpleXLS.new(['a', 'b', 'c'])
    
    rows = [{:a => 1, :b => 2, :c => 3}, {:a => 4, :b => 5, :d => 7}]
    xls.add(rows)
    
    assert_equal rows.first.values, xls.rows.first
    assert_equal [4,5,nil], xls.rows.last
    
    rows = [{:a => 1, :b => 2, :c => 3}, {:a => 4, :c => 5, :d => 7}]
    xls.add(rows)
    
    assert_equal rows.first.values, xls.rows.first
    assert_equal [4,nil,5], xls.rows.last    
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
