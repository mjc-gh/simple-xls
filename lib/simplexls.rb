class SimpleXLS
  attr_accessor :headers, :rows
  
  def initialize(headers)
    raise ArgumentError.new('headers must be an Array') unless Array === headers

    @headers = headers.dup
    @rows = []
  end
  # TODO fill out array here is needed rather than when we build the string
  #      also, slice the array is longer than headers
  def push(row)
    raise ArgumentError.new('row must be an Array') unless Array === row
    
    row = row.dup
    row += Array.new(headers.size - row.size) if row.size < headers.size
    
    @rows.push row
  end

  alias :<< :push
  
  # TODO test this!
  def add(collection)
    collection.each do |obj|
      self << (Hash === obj ? headers.map { |key| obj[key] || obj[key.to_sym] } : obj.to_a)
    end
  end
  
  def to_s
    output = "<table><thead><tr>"
    output << @headers.collect { |hr| "<th>#{hr}</th>" }.join << "</tr></thead><tbody>"
    output << @rows.collect { |row| "<tr>#{row.collect { |cell| "<td>#{cell}</td>"}.join}</tr>" }.join
    output << "</tbody></table>"
  end
end
