# write your code here
# request_file = File.read('data/post_request.txt')

class Request
  attr_accessor :request

  def initialize (req)
    @request = req
  end

  def path
    first_line[first_line.index(" ") + 1 .. first_line.index("?") - 1]
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
      value = header[header.index(":") + 2 .. -1]
      result[key] = value
    end
    result
  end

  def body
    blank = lines.index("")
    lines[blank..-1].join('')
  end

  def querystring
    lines[0].split(" ")[1].partition("?").last
  end

  def params
    query_groups = querystring.split("&")
    body_groups = body.split("&")
    groups =  query_groups + body_groups
    result = {}
    groups.each do |group|
      key = group.slice(0, group.index("="))
      value = group[group.index("=") + 1 .. -1]
      result[key] = value
    end
    result
  end

  def version
    lines[0].split(" ")[-1]
  end

private

  def first_line
    request.split("\n")[0]
  end

  def lines
    @request.split("\n")
  end
end
