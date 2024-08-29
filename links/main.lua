function Url(url)
    -- executa no windows a "" serve para aceitar espaços
    os.execute(' start "" "' .. url .. '"')
end


local filename = "links.links"
local links = {}
local file = io.open(filename, "r")

if not file then
    print("erro")
    return
end

for lines in file:lines() do
    -- regex dos cria
    local name, url = lines:match("%[(.-)%]:%s*(https?://%S+)")
    if name and url then
        table.insert(links, {name = name, url = url})
    end
end

file:close()


if #links > 0 then
    for i, link in ipairs(links) do
        print(i..") site: "..link.name .." url: "..link.url);
    end

    print("qual tu quer: ")
    local escolha = tonumber(io.read())

    if escolha and links[escolha] then
        Url(links[escolha].url)
    else
        print("invalido")
    end

else
    print("erro")

end