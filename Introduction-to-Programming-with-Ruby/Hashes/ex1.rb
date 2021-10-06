family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"],
           brothers: ["frank", "rob", "david"],
           aunts: ["mary", "sally", "susan"]
         }

imm_fam = family.select { |k,v| (k == :sisters) || (k == :brothers) }

final = imm_fam.values.flatten

p final
