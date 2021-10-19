# def staggered_case(string)
#   new_string = ''
#   string.split('').each_with_index do |element, index|
#     new_string += case index.even?
#                   when true then element.upcase
#                   else element.downcase
#                   end
#   end
#   new_string
# end

def staggered_case(string, even_or_odd = 'even')
  result = ''
  need_upper = true if even_or_odd == 'even'
  need_upper = false if even_or_odd == 'odd'
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!', 'even') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', 'even') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', 'even') == 'IgNoRe 77 ThE 444 NuMbErS'
