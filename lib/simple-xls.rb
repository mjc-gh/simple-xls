class SimpleXLS
  attr_accessor :headers, :rows
  
  def initialize(headers = [])
    @rows = []
    @headers = headers
  end
  
  def push(row)
    raise ArgumentError unless row.is_a?(Array)
    @rows.push(row)
  end
  
  def to_s
    output = "<table><thead><tr>"
    output << @headers.collect { |hr| "<th>#{hr}</th>" }.join << "</tr></thead><tbody>"
    output << @rows.collect { |row|
      # even out the row if needed
      row += Array.new(headers.size - row.size) if row.size != headers.size
      "<tr>#{row.collect { |cell| "<td>#{cell}</td>"}.join}</tr>"
    }.join
    output << "</tbody></table>"
  end
end