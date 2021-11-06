def staggered_case(string, count_all_chars)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper if (char =~ /[a-z]/i && !count_all_chars) || count_all_chars
  end
  result
end

p staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', false) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL CAPS', true) == 'AlL CaPs'
p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'
