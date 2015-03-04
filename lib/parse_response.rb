# write your code here
# request_file = File.read('data/post_request.txt')

class Request
  attr_accessor :request

  def initialize (req)
    @request = File.read(req)
  end

  def verb
    first_line.split(" ")[0]
  end

  def headers
    blank = lines.index("")
    headers_array = lines.slice(1, blank - 1)
    result = {}
    headers_array.each do |header|
      key = header.slice(0, header.index(":"))
      value = header[header.index(":") + 2.. -1]
      p key
      p value
      result[key] = value
    end
    result
  end

  def body
    blank = lines.index("")
    lines[blank..-1].join('')
  end

  private

    def first_line
      request.split("\n")[0]
    end

    def lines
      @request.split("\n")
    end
end

request = Request.new('data/post_request.txt')
p request.body
