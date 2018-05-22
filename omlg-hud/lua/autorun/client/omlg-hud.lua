local hideHUDElements = {
    ["DarkRP_HUD"] = true,
    ["DarkRP_EntityDisplay"] = false,
    ["DarkRP_ZombieInfo"] = false,
    ["DarkRP_LocalPlayerHUD"] = false,
    ["DarkRP_Agenda"] = false,
    ["DarkRP_Hungermod"] = true,
}

hook.Add("HUDShouldDraw", "HideDefaultDarkRPHud", function(name)
    if hideHUDElements[name] then return false end
end)

surface.CreateFont( "OMLG-Font1", {
    font = "Bebas Neue",
    size = 22,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

surface.CreateFont( "OMLG-Font2", {
    font = "Bebas Neue",
    size = 25,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

hook.Add("HUDPaint", "OMLG-hud", function()
   local health = LocalPlayer():Health()
   local armor = LocalPlayer():Armor()
   local salary = LocalPlayer():getDarkRPVar("salary")
   local money = LocalPlayer():getDarkRPVar("money")
   local name = LocalPlayer():Nick()
   local job = team.GetName(LocalPlayer():Team()) 
   local pos = ScrW()/ 2 - 202
   local pos1 = ScrW()/ 2 - 200
   local pos2 = ScrW()/ 1 - 650

    local health
    if LocalPlayer():Health() > 100 then
        health = 100
    else
        health = LocalPlayer():Health()
    end

    local armor
    if LocalPlayer():Armor() > 100 then
        armor = 100
    else
        armor = LocalPlayer():Armor()
    end

    if LocalPlayer():Armor() >= 1 then
        draw.RoundedBox(25, pos, ScrH() - 53, 504, 20,CONFIG.BASICCOLOR)
        draw.RoundedBox(20, pos1, ScrH() - 50, armor * 5, 14,CONFIG.ARMORCOLOR)
        draw.SimpleText(LocalPlayer():Armor(), "OMLG-Font1", ScrW()/ 2, ScrH() - 54,CONFIG.TEXTBAR)
    end
 
    draw.RoundedBox(25, pos, ScrH() - 83, 504, 20,CONFIG.BASICCOLOR)
    draw.RoundedBox(20, pos1, ScrH() - 80, health * 5, 14, CONFIG.HEALTHCOLOR)
    draw.SimpleText(LocalPlayer():Health(), "OMLG-Font1", ScrW()/ 2, ScrH() - 84,CONFIG.TEXTBAR)
    draw.SimpleText("Salaire: "..DarkRP.formatMoney(salary), "OMLG-Font2", pos1, ScrH() - 115,CONFIG.SALARYCOLOR)
    draw.SimpleText("Argent: "..DarkRP.formatMoney(money), "OMLG-Font2", pos2, ScrH() - 115,CONFIG.MONEYCOLOR)
    draw.SimpleText(name, "OMLG-Font2", pos1, ScrH() - 140,CONFIG.NAMECOLOR)
end)