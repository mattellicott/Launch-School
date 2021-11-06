def balanced?(string)
  s_brack, c_brack, parens = 0, 0, 0
  string.chars.each do |c|
    s_brack += 1 if c == "["
    s_brack -= 1 if c == "]"
    c_brack += 1 if c == "{"
    c_brack -= 1 if c == "}"
    parens  += 1 if c == "("
    parens  -= 1 if c == ")"
    return false if (s_brack == -1) || (c_brack == -1) || (parens == -1)
  end
  (s_brack + c_brack + parens) == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('(({[([]){}}]))') == true
p balanced?('(({[([]){}]))') == false
