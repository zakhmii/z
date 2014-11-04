
function run(msg, matches)
  return "Hello," .. matches[1]
end

return {
    description = "Says hello to someone", 
    usage = "say hello to [name]",
    regexp = "^say hello to (.*)$", 
    run = run 
}
