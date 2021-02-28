copyToClip = true

local g
g = hookfunction(game.HttpGet,function(self,url,...)
  warn("HttpGet: "..url)
  if copyToClip then setclipboard(url) end
  return g(self,url,...)
end)

local oldSyn
oldSyn = hookfunction(syn.request,function(a,b)
    if type(a) == "table" then
        for i,v in pairs(a) do
            if i == "Url" then
                warn("SynRequest: "..v)
                if copyToClip then setclipboard(v) end
            end
        end
    end
    return oldSyn(a,b)
end)

local ga
ga = hookfunction(game.HttpGetAsync,function(self,url,...)
  warn("HttpGetAsync: "..url)
  if copyToClip then setclipboard(url) end
  return ga(self,url,...)
end)

local p
p = hookfunction(game.HttpPost,function(self,url,...)
  warn("HttpPost: "..url)
  if copyToClip then setclipboard(url) end
  warn("Arguments: "..(...))
  return p(self,url,...)
end)

local pa
pa = hookfunction(game.HttpPostAsync,function(self,url,...)
  warn("HttpPostAsync: "..url)
  if copyToClip then setclipboard(url) end
  warn("Arguments: "..(...))
  return pa(self,url,...)
end)